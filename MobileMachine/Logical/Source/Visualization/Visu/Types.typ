
TYPE
	MobileMachineType : 	STRUCT 
		Parameter : MachineParameterType;
	END_STRUCT;
	MachineParameterType : 	STRUCT 
		EngineRevolution : INT;
		EngineTemperature : INT := 15;
		Velocity : USINT;
		WorkingHours : INT := 524;
		TirePressure : REAL := 0.92;
		TankLevel : USINT;
		MusicVolume : USINT(0..10)  := 6;
		AirConditioner : USINT(0..10)  := 2;
		LightMode : LightModeType;
		VelocityMode : VelocityModeType;
	END_STRUCT;
	VelocityModeType : 
		(
		Snail,
		Turtle,
		Rabbit
		);
	LightModeType : 
		(
		LightsOff,
		DimmedHeadlights,
		HighBeam
		);
	MachineStateType : 
		(
		OFF,
		POWER_ON,
		START_ENGINE,
		DRIVING,
		DECELERATE,
		ACCELERATE,
		CUTTING
		);
END_TYPE
