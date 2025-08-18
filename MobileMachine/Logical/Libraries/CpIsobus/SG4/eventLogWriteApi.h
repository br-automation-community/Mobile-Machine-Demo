
/*
 * Event Log System Write API.
 *
 * Writing events into a logbook.
 */

#ifndef _EVENT_LOG_WRITE_API_H_
#define _EVENT_LOG_WRITE_API_H_

#include <stdint.h>
#include <stdarg.h>
#include <artimespec.h>
#include <eventLogApi.h>
#include <arexport.h>

#ifdef __cplusplus
extern "C" {
#endif

#define EVENTLOG_FORMATTED_TEXT_MAX 256

/*
 * Writes an event log entry including text data.
 * 'hEvLog' selects the logbook. In case of hEvLog=NULL, the AR system logbook is selected.
 * 'eventId' takes an BuR formatted event ID (see eventId.h).
 * The format string can be used as formatted string like in printf(). It will be truncated if it exceeds
 * EVENTLOG_FORMATTED_TEXT_MAX.
 *
 * e.g. AR system error entry:
 * eventLogWriteText(NULL, EVENTID_MAKE_SYS_ERROR(815, 4711), "Info: %s", "yep");
 */
void eventLogWriteText(EVENTLOG_H hEvLog, EVENTID_T eventId, const char* format, ...);

/*
 * Writes an event log entry including text data.
 * Works the same as eventLogWriteText(), but the arguments are passed as va_list.
 */
void eventLogWriteFrmtText(EVENTLOG_H hEvLog, EVENTID_T eventId, const char* format, va_list args);

/*
 * Writes an event log entry including all possible parameters.
 * 'hEvLog' selects the logbook. In case of hEvLog=NULL, the AR system logbook is selected.
 * 'eventId' takes an BuR formatted event ID (see eventId.h).
 * 'originRecordId' takes the record id of the causing event log entry (0 no causing record id).
 * 'pTimestampUtc' takes an UTC timestamp for the entry, if pTimestampUtc=NULL the timestamp is taken internally.
 * 'binaryDataFormat' describes the format of the optionally given binary data (see eventBlob.h -
 * EVENTLOG_BLOBFORMAT_x).
 * 'binaryDataSize' determines the size of the optionally given binary data, if binaryDataSize=0 no binary data is
 * stored in the entry.
 * 'pBinaryData' points to the binary data, if pBinaryData=NULL no binary data is stored in the entry.
 * 'objectId' takes a name of the caller (35 characters max), if objectId=NULL the name of the current system task is
 * used.
 * 'pRecordId' is optional. If set, the record id of the entry is stored in the field pointed to by pRecordId.
 * Returns 0 on success, event log error on failure (see loggerErrors.h).
 */
int eventLogWrite(EVENTLOG_H hEvLog, EVENTID_T eventId, RECORDID_T originRecordId, const AR_TIMESPEC* pTimestampUtc,
                  uint8_t binaryDataFormat, uint32_t binaryDataSize, const void* pBinaryData, const char* objectId,
                  RECORDID_T* pRecordId);


#if AR_CORE
#include <private/eventLogWriteApiP.h>
#endif

#ifdef __cplusplus
}
#endif

#endif
