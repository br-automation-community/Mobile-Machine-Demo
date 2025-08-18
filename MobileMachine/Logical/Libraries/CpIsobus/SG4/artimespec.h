
/* definition of a type similar to the POSIX timespec type */

#ifndef _AR_TIMESPEC_H_
#define _AR_TIMESPEC_H_


#include <time.h>

typedef struct AR_TIMESPEC
{
    time_t tv_sec;
    long tv_nsec;
} AR_TIMESPEC;


#endif
