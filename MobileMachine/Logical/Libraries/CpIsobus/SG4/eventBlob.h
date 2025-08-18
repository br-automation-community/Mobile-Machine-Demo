/*
 * Formats for the additional (binary) data of log event entries.
 * 
 * A detailed description of the event BLOB formats can be found in:
 * https://confluence.br-automation.com/x/hAknC (EventLog BLOB formats)
 */

#ifndef _EVENT_BLOB_H_
#define _EVENT_BLOB_H_

/* Currently available event blob formats (0-255) */
#define EVENTLOG_BLOBFORMAT_BINARY 0u           /* only binary data */
#define EVENTLOG_BLOBFORMAT_ASCII 1u            /* series of null-terminated ascii strings */
#define EVENTLOG_BLOBFORMAT_BINARY_CODED 2u     /* byte prefixed data (see also eventBlobCudApi.h)*/
#define EVENTLOG_BLOBFORMAT_COMPATIBILITY 3u    /* AR system internal format - compatibility for old logger api */
#define EVENTLOG_BLOBFORMAT_EXCEPTION_I386 254u /* AR system internal format - INTEL CPU exception backtrace */
#define EVENTLOG_BLOBFORMAT_EXCEPTION_ARM 255u  /* AR system internal format - ARM CPU exception backtrace */

#endif
