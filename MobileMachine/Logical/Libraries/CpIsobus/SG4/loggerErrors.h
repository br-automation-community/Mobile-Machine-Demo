/* Fehlercodes (Fehlernummernbereich von 31240 bis 31339 fuer AR Logger reserviert) */

#ifndef _LOGGER_ERRORS_H_
#define _LOGGER_ERRORS_H_

/* clang-format off */
#define ERR_EVENTLOG_BASE 31240
#define ERR_EVENTLOG_INIT_FAILED			(ERR_EVENTLOG_BASE + 1)
#define ERR_EVENTLOG_LOAD_FAILED			(ERR_EVENTLOG_BASE + 2)
#define ERR_EVENTLOG_INVALID_HANDLE			(ERR_EVENTLOG_BASE + 4)
#define ERR_EVENTLOG_NOTEXISTING			(ERR_EVENTLOG_BASE + 5)
#define ERR_EVENTLOG_EXISTING				(ERR_EVENTLOG_BASE + 6)
#define ERR_EVENTLOG_INSTALL				(ERR_EVENTLOG_BASE + 7)
#define ERR_EVENTLOG_CREATE					(ERR_EVENTLOG_BASE + 8)
#define ERR_EVENTLOG_NOMEMORY				(ERR_EVENTLOG_BASE + 9)
#define ERR_EVENTLOG_DELETE					(ERR_EVENTLOG_BASE + 10)
#define ERR_EVENTLOG_INVALID_LEN			(ERR_EVENTLOG_BASE + 11)
#define ERR_EVENTLOG_READ_BUFFER_TOO_SMALL	(ERR_EVENTLOG_BASE + 14) /* uebergebener Lesebuffer zu klein */
#define ERR_EVENTLOG_INVALID_BUFFER			(ERR_EVENTLOG_BASE + 15)
#define ERR_EVENTLOG_INVALID_INDEX			(ERR_EVENTLOG_BASE + 16)
#define ERR_EVENTLOG_READ_INVALID_ENTRY		(ERR_EVENTLOG_BASE + 17)
#define ERR_EVENTLOG_NO_MORE_ENTRY			(ERR_EVENTLOG_BASE + 18) /* letzten Eintrag gelesen */
#define ERR_EVENTLOG_READ_BUFFER_BINARY		(ERR_EVENTLOG_BASE + 19) /* binaerer Buffer zu klein f. Library */
#define ERR_EVENTLOG_READ_BUFFER_ASCII		(ERR_EVENTLOG_BASE + 20)  /* Ascii-Buffer zu klein f. Library */
#define ERR_EVENTLOG_RESIZE_FAILED			(ERR_EVENTLOG_BASE + 21) /* Resize fehlgeschlagen, auch org. Modul geloescht */
#define ERR_EVENTLOG_RESIZE_NEW_HANDLE		(ERR_EVENTLOG_BASE + 22) /* Resize fehlgeschlagen, org. Modul ueber neues Handle referenzierbar */
#define ERR_EVENTLOG_RESIZE_MIN_SIZE		(ERR_EVENTLOG_BASE + 23) /* Resize fehlgeschlagen, urspr. Modul mit min. Laenge generiert, ueber neues Handle referenzierbar */
#define ERR_EVENTLOG_ADD_TO_NVFLUSH_LIST	(ERR_EVENTLOG_BASE + 24)
#define ERR_EVENTLOG_ACCESS_DENIED			(ERR_EVENTLOG_BASE + 25)
#define ERR_EVENTLOG_OUT_OF_RANGE			(ERR_EVENTLOG_BASE + 27)
#define ERR_EVENTLOG_MODULE_CREATED			(ERR_EVENTLOG_BASE + 40) /* general information: AR log module created */
#define ERR_EVENTLOG_EVENTID_ENTRY			(ERR_EVENTLOG_BASE + 51) /* event id entry - for INA and V1.00 ANSL service. */
#define ERR_EVENTLOG_MOEXISTS				(ERR_EVENTLOG_BASE + 52) /* A module of another type but with the same name already exists. */
#define ERR_EVENTLOG_CORRUPT_ENTRY			(ERR_EVENTLOG_BASE + 53)
#define ERR_EVENTLOG_NOTIFIER				(ERR_EVENTLOG_BASE + 54)
#define ERR_EVENTLOG_MODULE_CLEARED			(ERR_EVENTLOG_BASE + 55) /* general information: AR log module cleared */

#define ERR_ARLOG_BASE						ERR_EVENTLOG_BASE
#define ERR_ARLOG_INIT_FAILED				ERR_EVENTLOG_INIT_FAILED
#define ERR_ARLOG_LOAD_FAILED				ERR_EVENTLOG_LOAD_FAILED
#define ERR_ARLOG_INVALID_HANDLE			ERR_EVENTLOG_INVALID_HANDLE
#define ERR_ARLOG_NOTEXISTING				ERR_EVENTLOG_NOTEXISTING
#define ERR_ARLOG_EXISTING					ERR_EVENTLOG_EXISTING
#define ERR_ARLOG_INSTALL					ERR_EVENTLOG_INSTALL
#define ERR_ARLOG_CREATE					ERR_EVENTLOG_CREATE
#define ERR_ARLOG_NOMEMORY					ERR_EVENTLOG_NOMEMORY
#define ERR_ARLOG_DELETE					ERR_EVENTLOG_DELETE 
#define ERR_ARLOG_INVALID_LEN				ERR_EVENTLOG_INVALID_LEN
#define ERR_ARLOG_READ_BUFFER_TOO_SMALL		ERR_EVENTLOG_READ_BUFFER_TOO_SMALL	/* uebergebener Lesebuffer zu klein */
#define ERR_ARLOG_INVALID_BUFFER			ERR_EVENTLOG_INVALID_BUFFER
#define ERR_ARLOG_INVALID_INDEX				ERR_EVENTLOG_INVALID_INDEX
#define ERR_ARLOG_READ_INVALID_ENTRY		ERR_EVENTLOG_READ_INVALID_ENTRY
#define ERR_ARLOG_NO_MORE_ENTRY				ERR_EVENTLOG_NO_MORE_ENTRY 			/* letzten Eintrag gelesen */	
#define ERR_ARLOG_READ_BUFFER_BINARY		ERR_EVENTLOG_READ_BUFFER_BINARY 	/* binaerer Buffer zu klein f. Library */
#define ERR_ARLOG_READ_BUFFER_ASCII			ERR_EVENTLOG_READ_BUFFER_ASCII		/* Ascii-Buffer zu klein f. Library */
#define ERR_ARLOG_RESIZE_FAILED				ERR_EVENTLOG_RESIZE_FAILED			/* Resize fehlgeschlagen, auch org. Modul geloescht */ 
#define ERR_ARLOG_RESIZE_NEW_HANDLE			ERR_EVENTLOG_RESIZE_NEW_HANDLE		/* Resize fehlgeschlagen, org. Modul ueber neues Handle referenzierbar */ 
#define ERR_ARLOG_RESIZE_MIN_SIZE			ERR_EVENTLOG_RESIZE_MIN_SIZE		/* Resize fehlgeschlagen, urspr. Modul mit min. Laenge generiert, ueber neues Handle referenzierbar */ 
#define ERR_ARLOG_ADD_TO_NVFLUSH_LIST		ERR_EVENTLOG_ADD_TO_NVFLUSH_LIST 
#define ERR_ARLOG_ACCESS_DENIED				ERR_EVENTLOG_ACCESS_DENIED 
#define ERR_ARLOG_MODULE_CREATED			ERR_EVENTLOG_MODULE_CREATED			/* general information: AR log module created */

#endif
