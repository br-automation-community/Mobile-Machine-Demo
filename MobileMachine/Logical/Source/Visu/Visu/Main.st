
PROGRAM _INIT
	Tank := 5;
	Velocity := 0;
	EngineRevolution := 0;
	EngineTemperature := 194;
	AmbientTemperature := 23;
	WorkingHours := 524;
	MusicVolume := 6;
	AirConditioner := 2;
	
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
	 
END_PROGRAM

PROGRAM _CYCLIC
	(*
	Tank := Tank - 1;
	WorkingHours := WorkingHours + 1;
	
	IF Tank < 10 THEN
		EngineRevolution := EngineRevolution -100;
		Velocity := Velocity - 1;
		Tank := 140;
	ELSIF EngineRevolution < 2500 THEN
		EngineRevolution := EngineRevolution + 100;
		Velocity := Velocity + 1;
	END_IF
	
	IF EngineTemperature < 90 THEN
		EngineTemperature := EngineTemperature + 1;
	END_IF
	
	RevolutionWidget := (INT_TO_REAL (EngineRevolution)) / 1000;
	*)
	IF Alarm THEN
		MpAlarmXSet(gAlarmXCore, 'Tire Pressure');
	ELSIF Alarm1 THEN
		MpAlarmXSet(gAlarmXCore, 'Tank Level Low');
	ELSE
		MpAlarmXSet(gAlarmXCore, 'Engine Temperature');
	END_IF
	
	MpAlarmXCore_0();
	 
END_PROGRAM

PROGRAM _EXIT
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := FALSE);
	 
END_PROGRAM

