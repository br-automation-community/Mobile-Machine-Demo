(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 22/04/2024
* Description: 	Used for the communication of Blink keypad
				When button pressed (Keypad[0]) switch red led status (Keypad[1])
				Find datasheet in the documentation
***********************************************************************************************************************)
PROGRAM _INIT
	 
END_PROGRAM

PROGRAM _CYCLIC
	//The parameter group numbers (PGNs) defined in the MpJ1939Generic configuration are transmitted and received on the specified CAN interface using MpJ1939Generic.
	//The CAN interface is defined in the MpJ1939Generic configuration under "CAN interface". 
	MpJ1939Generic_0(MpLink := ADR(gJ1939Generic), Enable := TRUE);	

END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

