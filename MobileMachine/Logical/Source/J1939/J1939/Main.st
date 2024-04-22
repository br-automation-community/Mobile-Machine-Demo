
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC

//	MpJ1939Receive_0(MpLink := ADR(gJ1939Receive), Enable := TRUE, PGN := 42752, Priority := 6, Data := ADR(RawData), DataLength := 8);
	
//	MpJ1939Transmit_0(MpLink := ADR(gJ1939Transmit), Enable := TRUE, Data := ADR(RawDataTransmit), DataLength := 8);
	
	MpJ1939Receive_1(MpLink := ADR(gJ1939Receive), Enable := Enable, Data := ADR(RawData), DataLength := 8);
	
	MpJ1939Transmit_1(MpLink := ADR(gJ1939Transmit), Enable := Enable, Data := ADR(RawDataTransmit), DataLength := 8);
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

