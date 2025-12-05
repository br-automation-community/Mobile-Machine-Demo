
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
		CloseAllClamps : BOOL;
		OpenAllClamps : BOOL;
		MoveViewPointRight : BOOL;
		MoveViewPointLeft : BOOL;
	END_STRUCT;
	JointPositionType : 	STRUCT 
		J1 : REAL;
		J2 : REAL;
		J3 : REAL;
		J4 : REAL;
		J5 : REAL;
		J6 : REAL;
		J7 : REAL;
		J8 : REAL;
		J9 : REAL;
		J10 : REAL;
		J11 : REAL;
		J12 : REAL;
	END_STRUCT;
	JointPositionRadType : 	STRUCT 
		J1 : REAL;
		J2 : REAL;
		J3 : REAL;
		J4 : REAL;
		J5 : REAL;
		J6 : REAL;
		J7 : REAL;
		J8 : REAL;
		J9 : REAL;
		J10 : REAL;
		J11 : REAL;
		J12 : REAL;
	END_STRUCT;
	JoystickType : 	STRUCT 
		J1 : REAL;
		J2 : REAL;
		J3 : REAL;
		J4 : REAL;
		J5 : REAL;
	END_STRUCT;
	JointLimitsType : 	STRUCT 
		J1_MAX : REAL := 99;
		J1_MIN : REAL := -99;
		J2_MAX : REAL := 12;
		J2_MIN : REAL := -30;
		J3_MAX : REAL := 29;
		J3_MIN : REAL := -18;
		J4_MAX : REAL := 2500;
		J4_MIN : REAL := -1300;
		J5_MAX : REAL := 40;
		J5_MIN : REAL := -75;
		J6_MAX : REAL := 150;
		J6_MIN : REAL := -150;
		J7_MAX : REAL := 48;
		J7_MIN : REAL := -43;
		J9_MAX : REAL := 80;
		J9_MIN : REAL := -85;
		J10_MAX : REAL := 0;
		J10_MIN : REAL := 0;
		J11_MAX : REAL := 50;
		J11_MIN : REAL := -61;
		J12_MAX : REAL := 0;
		J12_MIN : REAL := 0;
	END_STRUCT;
END_TYPE
