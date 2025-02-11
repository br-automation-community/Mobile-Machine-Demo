(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 17/05/2024
* Description: 	Used for simulation of generel visualization
				Can be adapted for your usecase
 ***********************************************************************************************************************)
PROGRAM _INIT
	
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
	MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE);
	
	TON_20s(PT := T#20s);
	TON_10s(PT := T#10s);
	TON_5s(PT := T#5s);
	
	//Assign initial values
	MachineState := OFF;
	MobileMachine.Parameter.WorkingHours := 524;
	MobileMachine.Parameter.EngineTemperature := 15;
	MobileMachine.Parameter.MusicVolume := 6;
	MobileMachine.Parameter.AirConditioner := 2;
	MobileMachine.Parameter.TankLevel := TANK_FULL;
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
	
	IF MobileMachine.Parameter.TankLevel < TANK_LEVEL_LOW AND NOT TankOld THEN
		MachineState := DECELERATE;
		TankOld := TRUE;
	END_IF
	
	//Simulation of machine state
	CASE MachineState OF
		OFF:
			MobileMachine.Parameter.LightMode := LightsOff;
			MobileMachine.Parameter.EngineRevolution := 0;
			MobileMachine.Parameter.Velocity := 0;
			
			BrakeImage := TRUE;
			CheckAlarmImage := TRUE;
			
			TankOld := FALSE;
			IF MobileMachine.Parameter.TankLevel < TANK_LEVEL_LOW THEN
				MobileMachine.Parameter.TankLevel := TANK_FULL;
			END_IF
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				CheckAlarmImage := FALSE;
				MachineState := POWER_ON;
			END_IF
			
		POWER_ON:
			MobileMachine.Parameter.LightMode := LightsOff;
			BrakeImage := TRUE;
						
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MachineState := START_ENGINE;
			END_IF
		
		START_ENGINE:
			MobileMachine.Parameter.LightMode := DimmedHeadlights;
			IF MobileMachine.Parameter.EngineTemperature < ENGINE_TEMPERATURE_MIN THEN
				MobileMachine.Parameter.EngineTemperature := MobileMachine.Parameter.EngineTemperature + 1;
			END_IF
			
			MobileMachine.Parameter.EngineRevolution := ENGINE_REVOLUTION_STANDSTILL;

			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MpAlarmXSet(gAlarmXCore, 'Tire pressure');
				BrakeImage := FALSE;
				MachineState := ACCELERATE;
			END_IF
		
		ACCELERATE:
			MobileMachine.Parameter.LightMode := DimmedHeadlights;
			IF MobileMachine.Parameter.EngineTemperature < ENGINE_TEMPERATURE_MIN THEN
				MobileMachine.Parameter.EngineTemperature := MobileMachine.Parameter.EngineTemperature + 1;
			END_IF
			IF MobileMachine.Parameter.EngineRevolution < ENGINE_REVOLUTION_STEP1 THEN
				MobileMachine.Parameter.EngineRevolution := MobileMachine.Parameter.EngineRevolution + 40;
				MobileMachine.Parameter.Velocity := MobileMachine.Parameter.Velocity + 2;
			END_IF
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				MachineState := DRIVING;
			END_IF
		
		DRIVING:
			MobileMachine.Parameter.LightMode := HighBeam;
			IF MobileMachine.Parameter.EngineTemperature < ENGINE_TEMPERATURE_MIN THEN
				MobileMachine.Parameter.EngineTemperature := MobileMachine.Parameter.EngineTemperature + 1;
			END_IF
			IF MobileMachine.Parameter.EngineRevolution < ENGINE_REVOLUTION_STEP2 AND MobileMachine.Parameter.Velocity < 32 THEN
				MobileMachine.Parameter.EngineRevolution := MobileMachine.Parameter.EngineRevolution + 20;
				MobileMachine.Parameter.Velocity := MobileMachine.Parameter.Velocity + 1;
			END_IF
			
			TON_20s.IN := TRUE;
			IF TON_20s.Q THEN
				TON_20s.IN := FALSE;
				MachineState := DECELERATE;
			END_IF
		
		DECELERATE:
			TON_20s.IN := FALSE;
			MobileMachine.Parameter.LightMode := DimmedHeadlights;
			
			IF MobileMachine.Parameter.EngineRevolution > ENGINE_REVOLUTION_STANDSTILL THEN
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
				MachineState := CUTTING;
			END_IF
		
		CUTTING:
			MobileMachine.Parameter.LightMode := HighBeam;
			CuttingImage := TRUE;
			
			TON_5s.IN := TRUE;
			IF TON_5s.Q THEN
				TON_5s.IN := FALSE;
				CuttingImage := FALSE;
				MachineState := OFF;
			END_IF

	END_CASE;
	
	//Set alarm image tire pressure
	IF MpAlarmXCheckState(gAlarmXCore, 'Tire pressure', mpALARMX_STATE_UNACKNOWLEDGED) THEN
		TirePressureImage := TRUE;
	ELSE
		TirePressureImage := FALSE;
	END_IF
	
	
	RevolutionWidget := (INT_TO_REAL (MobileMachine.Parameter.EngineRevolution)) / 1000;
	
	//Set velocity mode image
	IF MobileMachine.Parameter.Velocity > VELOCITY_RABBIT THEN
		MobileMachine.Parameter.VelocityMode := Rabbit;
	ELSIF MobileMachine.Parameter.Velocity > VELOCITY_TURTLE THEN
		MobileMachine.Parameter.VelocityMode := Turtle;
	ELSE
		MobileMachine.Parameter.VelocityMode := Snail;
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