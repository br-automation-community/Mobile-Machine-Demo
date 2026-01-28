
TYPE
	CmdType : 	STRUCT 
		SawIn : BOOL;
		SawOut : BOOL;
		ClampsClose : BOOL;
		ClampsOpen : BOOL;
		TranspClampsClose : BOOL;
		TranspClampsOpen : BOOL;
		TransportWheelUp : BOOL;
		TransportWheelDown : BOOL;
		PushArmOut : BOOL;
		PushArmIn : BOOL;
		BottomClampOut : BOOL;
		BottomClampIn : BOOL;
		ActuatorYXClockwise : BOOL;
		ActuatorYXAnticlockwise : BOOL;
		MoveViewPointRight : BOOL;
		MoveViewPointLeft : BOOL;
		Cut : BOOL;
		MoveToZeroPosition : BOOL;
	END_STRUCT;
	JoystickType : 	STRUCT 
		J1 : REAL;
		J2 : REAL;
		J3 : REAL;
		J5 : REAL;
	END_STRUCT;
	JointType : 	STRUCT 
		J1 : JointPropertiesType := (MIN_LIMIT:=-99,MAX_LIMIT:=99,PROPORTIONAL_CTRL:=0.25);
		J2 : JointPropertiesType := (MIN_LIMIT:=-30,MAX_LIMIT:=12,PROPORTIONAL_CTRL:=0.25);
		J3 : JointPropertiesType := (MIN_LIMIT:=-18,MAX_LIMIT:=29,PROPORTIONAL_CTRL:=0.25);
		J4 : JointPropertiesType := (MIN_LIMIT:=-1300,MAX_LIMIT:=2500,PROPORTIONAL_CTRL:=20);
		J5 : JointPropertiesType := (MIN_LIMIT:=-75,MAX_LIMIT:=40,PROPORTIONAL_CTRL:=0.5);
		J6 : JointPropertiesType := (MIN_LIMIT:=-150,MAX_LIMIT:=150,PROPORTIONAL_CTRL:=1);
		J7 : JointPropertiesType := (MIN_LIMIT:=-30,MAX_LIMIT:=48,PROPORTIONAL_CTRL:=3);
		J8 : JointPropertiesType;
		J9 : JointPropertiesType := (MIN_LIMIT:=-77,MAX_LIMIT:=80,PROPORTIONAL_CTRL:=2.75);
		J10 : JointPropertiesType := (MIN_LIMIT:=0,MAX_LIMIT:=66,PROPORTIONAL_CTRL:=1.5);
		J11 : JointPropertiesType := (MIN_LIMIT:=-45,MAX_LIMIT:=50,PROPORTIONAL_CTRL:=1.5);
		J12 : JointPropertiesType := (PROPORTIONAL_CTRL:=5);
	END_STRUCT;
	JointPropertiesType : 	STRUCT 
		PositionDegree : REAL;
		PositionRad : REAL;
		MIN_LIMIT : REAL;
		MAX_LIMIT : REAL;
		PROPORTIONAL_CTRL : REAL;
	END_STRUCT;
END_TYPE
