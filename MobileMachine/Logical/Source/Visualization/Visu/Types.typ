
TYPE
	MobileMachineType : 	STRUCT 
		Parameter : MachineParameterType;
	END_STRUCT;
	MachineParameterType : 	STRUCT 
		EngineRevolution : INT;
		EngineTemperature : INT;
		Velocity : USINT;
		WorkingHours : INT;
		TirePressure : REAL;
		TankLevel : USINT;
		MusicVolume : USINT(0..10) ;
		AirConditioner : USINT(0..10) ;
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
