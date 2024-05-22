(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 17/05/2024
 * Description: Used for simulation of visualization
				 
 ***********************************************************************************************************************)
PROGRAM _INIT
	
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
	MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE);
	
	TON_20s(PT := T#20s);
	TON_10s(PT := T#10s);
	TON_5s(PT := T#5s);
	
	MachineState := Off;
	MobileMachine.Parameter.WorkingHours := 524;
	MobileMachine.Parameter.EngineTemperature := 15;
	MobileMachine.Parameter.MusicVolume := 6;
	MobileMachine.Parameter.AirConditioner := 2;
	MobileMachine.Parameter.TankLevel := 98;
	MobileMachine.Parameter.TirePressure := 0.92;
	AmbientTemperature := 12;
	 
END_PROGRAM

PROGRAM _CYCLIC

	IF TON_10s.Q AND MobileMachine.Parameter.EngineTemperature > 0 THEN
		MobileMachine.Parameter.WorkingHours := MobileMachine.Parameter.WorkingHours + 1;
		MobileMachine.Parameter.TankLevel := MobileMachine.Parameter.TankLevel - 7;
		TON_10s.IN := FALSE;
	ELSE
		TON_10s.IN := TRUE;
	END_IF
	
	IF MobileMachine.Parameter.TankLevel < 15 AND NOT TankOld THEN
		MachineState := Decelerate;
		TankOld := TRUE;
	END_IF
	
	CASE MachineState OF
		Off:
			MobileMachine.LightMode := LightsOff;
			MobileMachine.Parameter.EngineRevolution := 0;
			MobileMachine.Parameter.Velocity := 0;
			
			BrakeImage := TRUE;
			CheckAlarmImage := TRUE;
			
			TankOld := FALSE;
			IF MobileMachine.Parameter.TankLevel < 15 THEN
				MobileMachine.Parameter.TankLevel := 98;
			END_IF
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				CheckAlarmImage := FALSE;
				MachineState := PowerOn;
			END_IF
			
		PowerOn:
			MobileMachine.LightMode := LightsOff;
			BrakeImage := TRUE;
						
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MachineState := StartEngine;
			END_IF
		
		StartEngine:
			MobileMachine.LightMode := DimmedHeadlights;
			IF MobileMachine.Parameter.EngineTemperature < 95 THEN
				MobileMachine.Parameter.EngineTemperature := MobileMachine.Parameter.EngineTemperature + 1;
			END_IF
			IF MobileMachine.Parameter.EngineRevolution < 1650 THEN
				MobileMachine.Parameter.EngineRevolution := MobileMachine.Parameter.EngineRevolution + 825;
			END_IF
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MpAlarmXSet(gAlarmXCore, 'Tire pressure');
				BrakeImage := FALSE;
				MachineState := Accelerate;
			END_IF
		
		Accelerate:
			MobileMachine.LightMode := DimmedHeadlights;
			IF MobileMachine.Parameter.EngineTemperature < 95 THEN
				MobileMachine.Parameter.EngineTemperature := MobileMachine.Parameter.EngineTemperature + 1;
			END_IF
			IF MobileMachine.Parameter.EngineRevolution < 1890 THEN
				MobileMachine.Parameter.EngineRevolution := MobileMachine.Parameter.EngineRevolution + 40;
				MobileMachine.Parameter.Velocity := MobileMachine.Parameter.Velocity + 2;
			END_IF
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MachineState := Driving;
			END_IF
		
		Driving:
			MobileMachine.LightMode := HighBeam;
			IF MobileMachine.Parameter.EngineTemperature < 95 THEN
				MobileMachine.Parameter.EngineTemperature := MobileMachine.Parameter.EngineTemperature + 1;
			END_IF
			IF MobileMachine.Parameter.EngineRevolution < 2290 AND MobileMachine.Parameter.Velocity < 32 THEN
				MobileMachine.Parameter.EngineRevolution := MobileMachine.Parameter.EngineRevolution + 20;
				MobileMachine.Parameter.Velocity := MobileMachine.Parameter.Velocity + 1;
			END_IF
			
			TON_20s.IN := TRUE;
			IF TON_20s.Q THEN
				TON_20s.IN := FALSE;
				MachineState := Decelerate;
			END_IF
		
		Decelerate:
			TON_20s.IN := FALSE;
			MobileMachine.LightMode := DimmedHeadlights;
			
			IF MobileMachine.Parameter.EngineRevolution > 1560 THEN
				MobileMachine.Parameter.EngineRevolution := MobileMachine.Parameter.EngineRevolution - 80;
			END_IF
			IF MobileMachine.Parameter.Velocity > 0 THEN
				MobileMachine.Parameter.Velocity := MobileMachine.Parameter.Velocity - 4;
			END_IF
			IF MobileMachine.Parameter.Velocity > 200 THEN
				MobileMachine.Parameter.Velocity := 0;
			END_IF
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MachineState := Cutting;
			END_IF
		
		Cutting:
			MobileMachine.LightMode := HighBeam;
			CuttingImage := TRUE;
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				CuttingImage := FALSE;
				MachineState := Off;
			END_IF

	END_CASE;
	
	IF MpAlarmXCheckState(gAlarmXCore, 'Tire pressure', mpALARMX_STATE_UNACKNOWLEDGED) THEN
		TirePressureImage := TRUE;
	ELSE
		TirePressureImage := FALSE;
	END_IF
	
	
	RevolutionWidget := (INT_TO_REAL (MobileMachine.Parameter.EngineRevolution)) / 1000;
	
	IF MobileMachine.Parameter.Velocity > 25 THEN
		MobileMachine.VelocityMode := Rabbit;
	ELSIF MobileMachine.Parameter.Velocity > 10 THEN
		MobileMachine.VelocityMode := Turtle;
	ELSE
		MobileMachine.VelocityMode := Snail;
	END_IF

	MpAlarmXCore_0();
	MpAlarmXHistory_0();
	
	TON_20s();
	TON_5s();
	TON_10s();
	 
END_PROGRAM

PROGRAM _EXIT
	MpAlarmXCore_0(Enable := FALSE);
	MpAlarmXHistory_0(Enable := FALSE);
END_PROGRAM