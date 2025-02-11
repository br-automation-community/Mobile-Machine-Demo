(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 22/04/2024
* Description: 	Used for J1939 generic communication
				Two Can interfaces required to test
***********************************************************************************************************************)
PROGRAM _INIT
	 
END_PROGRAM

PROGRAM _CYCLIC
	//The parameter group numbers (PGNs) defined in the MpJ1939Generic configuration are transmitted and received on the specified CAN interface using MpJ1939Generic.
	//The CAN interface is defined in the MpJ1939Generic configuration under "CAN interface". 
	MpJ1939Generic_0(MpLink := ADR(gJ1939Generic), Enable := TRUE);	
	
	//Data sended
	EEC1_Data;
	//Data recieved
	EEC2_Data;

END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

