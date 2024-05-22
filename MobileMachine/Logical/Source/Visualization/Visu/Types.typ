
TYPE
	MobileMachineType : 	STRUCT 
		LightMode : LightModeType;
		Parameter : MachineParameterType;
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
	MachineParameterType : 	STRUCT 
		EngineRevolution : INT;
		EngineTemperature : INT;
		Velocity : USINT;
		WorkingHours : INT;
		TirePressure : REAL;
		TankLevel : USINT;
		MusicVolume : USINT(0..10) ;
		AirConditioner : USINT(0..10) ;
	END_STRUCT;
	MachineStateType : 
		(
		Off,
		PowerOn,
		StartEngine,
		Driving,
		Decelerate,
		Accelerate,
		Cutting
		);
END_TYPE
