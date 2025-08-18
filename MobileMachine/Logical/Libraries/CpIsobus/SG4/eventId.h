/*
 * Macros for event ID handling.
 * 
 * An event ID exists of 32 bits:
 * bit 0-15: error code
 * bit 16-27: facility
 * bit 28: reserved
 * bit 29: customer flag
 * bit 30-31: severity code (0=success, 1=informational, 2=warning, 3=error)
 * 
 * A detailed description of BuR formatted event IDs can be found in the ARIS System (search for 'EventID' or 'Facilityvergabe').
 * file://brateggevaris6.br-automation.co.at/ArisAblage/DE/allgemeines/Facilityvergabe_EventIDs.pdf
 */
#ifndef _EVENT_ID_H_
#define _EVENT_ID_H_

#include <stdint.h>

typedef int32_t EVENTID_T;

/* Severity Codes */
typedef enum
{
	EVENTID_SEVERITYCODE_SUCCESS,
	EVENTID_SEVERITYCODE_INFO,
	EVENTID_SEVERITYCODE_WARNING,
	EVENTID_SEVERITYCODE_ERROR
} EVENTID_SEVERITY;

/* Macros for generating event ids. */
#define EVENTID_MAKE(_Sev, _C, _R, _Fac, _Code)                                                                        \
	((_Sev << 30) | (_C << 29) | (_R << 28) | ((_Fac & 0xFFF) << 16) | (_Code & 0xFFFF))

#define EVENTID_MAKE_SYS_ERROR(_Fac, _Code) EVENTID_MAKE(EVENTID_SEVERITYCODE_ERROR, 0, 0, _Fac, _Code)
#define EVENTID_MAKE_SYS_WARNING(_Fac, _Code) EVENTID_MAKE(EVENTID_SEVERITYCODE_WARNING, 0, 0, _Fac, _Code)
#define EVENTID_MAKE_SYS_INFO(_Fac, _Code) EVENTID_MAKE(EVENTID_SEVERITYCODE_INFO, 0, 0, _Fac, _Code)
#define EVENTID_MAKE_SYS_SUCCESS(_Fac, _Code) EVENTID_MAKE(EVENTID_SEVERITYCODE_SUCCESS, 0, 0, _Fac, _Code)

#define EVENTID_IS_ERROR(_EvId) (EVENTID_SEVERITY(_EvId) == EVENTID_SEVERITYCODE_ERROR)

#define EVENTID_SUCCEED(_EvId) (((EVENTID_T)(_EvId)) >= 0)
#define EVENTID_FAILED(_EvId) (((EVENTID_T)(_EvId)) < 0)
#define EVENTID_CODE(_EvId) ((_EvId)&0xFFFF)
#define EVENTID_FACILITY(_EvId) (((_EvId) >> 16) & 0xFFF)
#define EVENTID_SEVERITY(_EvId) (((_EvId) >> 30) & 0x3)
#define EVENTID_CUSTOMER(_EvId) (((_EvId) >> 29) & 0x1)


#if AR_CORE
#include <private/eventIdP.h>
#endif

#endif
