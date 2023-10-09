//
//  SystemInfo.h
//  
//
//  Created by Daniel Koller on 09.10.23.
//

#ifndef SystemInfo_h
#define SystemInfo_h

#include <stdio.h>

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

#endif /* SystemInfo_h */
