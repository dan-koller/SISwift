//
//  SystemInfo.c
//  
//
//  Created by Daniel Koller on 09.10.23.
//

#include "SystemInfo.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <mach/mach.h>
#include <sys/mount.h>
#include <sys/param.h>
#include <sys/utsname.h>

/*
 * Maximum number of CPU states used in the calculation of CPU load.
 * It is used as a constant to ensure consistent handling of CPU state
 * data in the calculation algorithm.
 */
#define CPU_STATE_MAX 4

/*
 * Variables used in CPU usage calculation to measure the change in ticks
 * over time, allowing the calculation of actual CPU usage.
 */
static unsigned long long _previousTotalTicks = 0;
static unsigned long long _previousIdleTicks = 0;

/*
 * Retrieves and returns the CPU architecture as a character array (string),
 * such as "x86_64" or "arm64".
 */
const char* getCPUArchitecture(void) {
    struct utsname systemInfo;
    if (uname(&systemInfo) == -1) {
        perror("uname");
        return NULL;
    }
    return strdup(systemInfo.machine);
}

/*
 * Returns 1.0f for "CPU fully pinned", 0.0f for "CPU idle", or somewhere in
 * between. You'll need to call this at regular intervals, since it measures
 * the load between the previous call and the current one.
 */
float getCPULoad(void) {
    host_cpu_load_info_data_t cpuinfo;
    mach_msg_type_number_t count = HOST_CPU_LOAD_INFO_COUNT;
    if (host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO,
                        (host_info_t) &cpuinfo, &count) == KERN_SUCCESS) {
        unsigned long long totalTicks = 0;
        for(int i = 0; i < CPU_STATE_MAX; i++) totalTicks += cpuinfo.cpu_ticks[i];
        return calculateCPULoad(cpuinfo.cpu_ticks[CPU_STATE_IDLE], totalTicks);
    }
    return -1.0f;
}

/*
 * Helper function to calculate CPU load percentage based on idle and total
 * CPU ticks. It calculates the CPU load as a float value between 0 and 1.
 */
static float calculateCPULoad(unsigned long long idleTicks,
                              unsigned long long totalTicks) {
    unsigned long long totalTicksSinceLastTime = totalTicks - _previousTotalTicks;
    unsigned long long idleTicksSinceLastTime = idleTicks - _previousIdleTicks;
    float loadFactor = 1.0f - ((totalTicksSinceLastTime > 0)
                               ? ((float) idleTicksSinceLastTime) / totalTicksSinceLastTime
                               : 0);
    _previousTotalTicks = totalTicks;
    _previousIdleTicks = idleTicks;
    return loadFactor;
}

/*
 * Returns a number between 0.0f and 1.0f, with 0.0f meaning all RAM is
 * available, and 1.0f meaning all RAM is currently in use.
 */
float getSystemMemoryUsage(void) {
    FILE * fpIn = popen("/usr/bin/vm_stat", "r");
    if (fpIn) {
        float memoryUsage = getMemoryUsage(fpIn);
        pclose(fpIn);
        if (memoryUsage >= 0.0f) return (float) memoryUsage;
    }
    /* Indicate failure */
    return -1.0f;
}

/*
 * Helper function to calculate the system memory usage percentage
 * by parsing the "vm_stat" file.
 */
static float getMemoryUsage(FILE *fp) {
    float pagesUsed = 0.0f, totalPages = 0.0f;
    char buf[512];
    while (fgets(buf, sizeof(buf), fp) != NULL) {
        if (strncmp(buf, "Pages", 5) == 0) {
            float val = parseMemoryValue(buf);
            if (val >= 0.0f) {
                if ((strncmp(buf, "Pages wired",  11) == 0) ||
                    (strncmp(buf, "Pages active", 12) == 0)) {
                    pagesUsed += val;
                }
                totalPages += val;
            }
        } else {
            /*
             * Stop at "Translation Faults". We don't care about
             * anything at or below that.
             */
            if (strncmp(buf, "Mach Virtual Memory Statistics", 30) != 0) break;
        }
    }
    return totalPages >= 0.0f ? (pagesUsed / totalPages) : -1.0f;
}

/*
 * Helper function to parse a memory value from a string. It skips non-digit
 * characters at the beginning of the input string 'b' and returns the
 * parsed memory value as a double.
 */
static float parseMemoryValue(const char *b) {
    while (*b && !isdigit(*b)) {
        b++;
    }
    return isdigit(*b) ? strtof(b, NULL) : -1.0f;
}

/*
 * Returns a number between 0.0f and 1.0f, with 0.0f meaning all disk space
 * is available, and 1.0f meaning all disk space is currently in use.
 */
float getDiskUsage(void) {
    struct statfs buf;
    if (statfs("/", &buf) == -1) {
        perror("statfs");
        return -1.0f;
    }
    unsigned long totalBlocks = buf.f_blocks;
    unsigned long freeBlocks = buf.f_bfree;
    unsigned long blockSize = buf.f_bsize;
    /* Convert bytes to megabytes */
    float totalSpace = (float) totalBlocks * blockSize / (1024.0f * 1024.0f);
    float freeSpace = (float) freeBlocks * blockSize / (1024.0f * 1024.0f);
    float usedSpace = 1.0f - (freeSpace / totalSpace);
    return usedSpace;
}
