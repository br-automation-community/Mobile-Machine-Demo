(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 22/04/2024
* Description: 	Used for J1939 communication
				Two Can interfaces required to test, possible in simulation
				Data handling of NOT predefined PGNs
***********************************************************************************************************************)
PROGRAM _INIT
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	MpJ1939Receive_EEC1(MpLink := ADR(gJ1939Receive), Enable := TRUE, PGN := 61444, Priority := 0, Data := ADR(RawDataEEC1), DataLength := 8);
	
	TON_50ms(IN := NOT MpJ1939Receive_EEC1.Receive, PT := T#50ms);
	
	//Recieve every 50ms new data
	IF MpJ1939Receive_EEC1.Active AND NOT MpJ1939Receive_EEC1.CommandBusy AND NOT MpJ1939Receive_EEC1.CommandDone AND NOT MpJ1939Receive_EEC1.Error AND TON_50ms.Q THEN
		MpJ1939Receive_EEC1.Receive := TRUE;
	ELSE
		MpJ1939Receive_EEC1.Receive := FALSE;
	END_IF
	
	//EEC1 - EngTorqueMode   /   Startbit: 0   /   Length: 4   /   Factor: 1   /   Offset: 0   /   Minimum: 0   /   Maximum: 15
	DataEEC1 := 0;
	IF RawDataEEC1[0].0 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[0];
	END_IF
	IF RawDataEEC1[0].1 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[1];
	END_IF
	IF RawDataEEC1[0].2 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[2];
	END_IF
	IF RawDataEEC1[0].3 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[3];
	END_IF
	EEC1_Data.EngTorqueMode := DataEEC1;
	
	//EEC1 - ActlEngPrcntTorqueHighResolution   /   Startbit: 4   /   Length: 4   /   Factor: 0.125   /   Offset: 0   /   Minimum: 0.0   /   Maximum: 0.875
	DataEEC1 := 0;
	IF RawDataEEC1[0].4 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[0];
	END_IF
	IF RawDataEEC1[0].5 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[1];
	END_IF
	IF RawDataEEC1[0].6 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[2];
	END_IF
	IF RawDataEEC1[0].7 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[3];
	END_IF
	EEC1_Data.ActlEngPrcntTorqueHighResolution := 0.125 * DataEEC1;
	
	//EEC1 - DriversDemandEngPercentTorque   /   Startbit: 8   /   Length: 8   /   Factor: 1   /   Offset: -125   /   Minimum: 0   /   Maximum: 125
	EEC1_Data.DriversDemandEngPercentTorque := RawDataEEC1[1];
	
	//EEC1 - ActualEngPercentTorque   /   Startbit: 16   /   Length: 8   /   Factor: 1   /   Offset: -125   /   Minimum: 0   /   Maximum: 125
	EEC1_Data.ActualEngPercentTorque := USINT_TO_SINT(RawDataEEC1[2] - 125);
	
	//EEC1 - EngSpeed   /   Startbit: 24   /   Length: 16   /   Factor: 0.125   /   Offset: 0   /   Minimum: 0.0   /   Maximum: 8031.875
	EEC1_Data.EngSpeed := 0.125 * USINT_TO_REAL(RawDataEEC1[3]) + INT_TO_REAL(SHL(USINT_TO_INT(RawDataEEC1[4]),8));
	
	//EEC1 - SrcAddrssOfCntrllngDvcForEngCtrl   /   Startbit: 40   /   Length: 8   /   Factor: 1   /   Offset: 0   /   Minimum: 0   /   Maximum: 253
	EEC1_Data.SrcAddrssOfCntrllngDvcForEngCtrl := RawDataEEC1[5];
	
	//EEC1 - EngStarterMode   /   Startbit: 48   /   Length: 4   /   Factor: 1   /   Offset: 0   /   Minimum: 0   /   Maximum: 15
	DataEEC1 := 0;
	IF RawDataEEC1[6].0 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[0];
	END_IF
	IF RawDataEEC1[6].1 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[1];
	END_IF
	IF RawDataEEC1[6].2 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[2];
	END_IF
	IF RawDataEEC1[6].3 THEN
		DataEEC1 := DataEEC1 + BIT_VALUE[3];
	END_IF
	EEC1_Data.EngStarterMode := DataEEC1;
	
	//EEC1 - EngDemandPercentTorque   /   Startbit: 56   /   Length: 8   /   Factor: 1   /   Offset: -125   /   Minimum: -125   /   Maximum: 125
	EEC1_Data.DriversDemandEngPercentTorque := USINT_TO_SINT(RawDataEEC1[7] - 125);
	
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

