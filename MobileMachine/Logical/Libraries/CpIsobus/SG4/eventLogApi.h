/*
 * Event Log System API
 */

#ifndef _EVENT_LOG_API_H
#define _EVENT_LOG_API_H

#include <eventBlob.h>
#include <eventId.h>
#include <loggerErrors.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef uint32_t RECORDID_T;

/* Logbuch Handle */
typedef struct EVENTLOG_OBJECT* EVENTLOG_H;

/* Basis Logbuch IDs */
typedef enum
{
	EVENTLOG_ID_SYSTEM,              /* 0 - ID des Basis-System-Logbuchs. */
	EVENTLOG_ID_USER,                /* 1 - ID des Basis-User-Logbuchs. */
	EVENTLOG_ID_FIELDBUS,            /* 2 - ID des Basis-Feldbus-Logbuchs. */
	EVENTLOG_ID_SAFETY,              /* 3 - ID des Basis-Safety-Logbuchs. */
	EVENTLOG_ID_REDUND,              /* 4 - ID des Basis-Redundanz-Logbuchs. */
	EVENTLOG_ID_CONNECTIVITY,        /* 5 - ID des Konnektivitaets-Logbuchs (OPC-UA, ANSL, ...). */
	EVENTLOG_ID_ACCESS_AND_SECURITY, /* 6 - ID des Access & Security Logbuchs (User/Role, SSL/TLS, ...). */
	EVENTLOG_ID_TEXT_SYSTEM,         /* 7 - ID des Textsystem-Logbuchs. */
	EVENTLOG_ID_UNIT_SYSTEM,         /* 8 - ID des Einheitensystem-Logbuchs. */
	EVENTLOG_ID_COUNT                /* Anzahl der Basislogbuecher */
} EVENTLOG_ID;

/*
 * Holen eines EventLog-Logbuch Handles.
 * Returns: EventLog-Logbuch Handle oder 0 wenn das angegebene Logbuch nicht
 * vorhanden ist.
 */
EVENTLOG_H eventLogHandleGet(const char* logName);

/*
 * Holt zu der angegebenen Log ID das passende Handle.
 * Returns: Log Handle oder 0 wenn die angegebene ID nicht gemappt werden kann
 * (ungueltig).
 */
EVENTLOG_H eventLogIdToHandle(EVENTLOG_ID logId);

#ifdef __cplusplus
}
#endif

#endif
