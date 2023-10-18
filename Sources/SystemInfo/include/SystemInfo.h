//
//  SystemInfo.h
//  
//
//  Created by Daniel Koller on 09.10.23.
//

#ifndef SystemInfo_h
#define SystemInfo_h

#include <stdio.h>

/*
 * Static methods declared in this file shouldn't be implemented directly.
 * They are just helper methods for the public methods.
 */

/* Get the cpu architecture */
const char* getCPUArchitecture(void);

/* Retreive the current cpu load */
float getCPULoad(void);
static float calculateCPULoad(unsigned long long idleTicks, unsigned long long totalTicks);

/* Retreive the current memory usage */
float getSystemMemoryUsage(void);
static float getMemoryUsage(FILE *fp);
static float parseMemoryValue(const char *b);

/* Retreive the current disk usage */
float getDiskUsage(void);

/* Retreive the hostname (e.g. Daniels-MBP) */
const char* getHostname(void);

/* Retreive the model name (e.g. MacbookPro 15,4) */
const char* getModelname(void);

/* Retreive OS version */
const char* getOSVersion(void);

/* Retreive OS name */
const char* getOSName(void);

/* Retreive kernel name */
const char* getKernelName(void);

#endif /* SystemInfo_h */
