//***********************************************************************
// Copyright: B&R Industrial Automation GmbH
// Author: B&R
// Created: 2023
// Description: Main task
//***********************************************************************

//***********************************************************************
// Note on licensing: 1x 1TCISOBUS.00-00 license is needed per PLC. 
// This is a fair use license. In case of TIM, a 1TCISOBUS.TM-00 license is required.
//***********************************************************************

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

#ifdef __cplusplus
	extern "C"
	{
#endif

	#include <IsoStackCore.h>
	#include <IsoStackNw_types.h>

	void ApplicationInit(void);
	void ApplicationRun(void);
	void ApplicationExit(void);
	void ApplicationSafetyNotification(INT eSafetyNotification);

void _INIT ProgramInit(void)
{
	// comment out following line to start ISOBUS manually
	StartIsobus = 1;
	
	if (StartIsobus) {	
		// set level of logging
		CpIsobusSetLogLevel(LOG_LEVEL);
	
		CpIsobusAllocateBuffers(E_LOCAL_CF_1, 4096, 1, 15, 32, 32, 32, 35);
		CpIsobusAllocateBuffers(E_LOCAL_CF_2, 1024, 15, 1, 1, 1, 1, 1);
		
		// CAN communication interface is set here
		CpIsobusInit(CAN_INTERFACE, (UDINT)&ApplicationSafetyNotification);
		
		ApplicationInit();
	}
	
	StartIsobus = 0 ;
}

void _EXIT ProgramExit(void)
{
	EIsoStackState isobusState = eIsoStackCoreGetState();

	if (isobusState != E_ISO_STACK_STATE_CLOSED) {
		CpIsobusExit();
		ApplicationExit();
		CpIsobusExitDone();
	}
	
	StopIsobus = 0;
}


void _CYCLIC ProgramCyclic(void)
{
	IsobusState = (CpIsobusStateEnum)eIsoStackCoreGetState();

	switch (IsobusState) {
		case cpISOBUS_STATE_CLOSED:
			if (StartIsobus) {
				ProgramInit();
			}
			break;
		
		case cpISOBUS_STATE_INITIALIZING:
			CpIsobusInitDone();
			break;
		
		case cpISOBUS_STATE_RUNNING:
			CpIsobusRun();
			ApplicationRun();

			if (StopIsobus) {
				ProgramExit();
			}
			break;
		case cpISOBUS_STATE_CLOSING : 
			break;
	}	
}
  
#ifdef __cplusplus
	};
#endif
   