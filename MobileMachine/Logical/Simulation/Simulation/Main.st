(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 05/12/2025
* Description: 	Used for simulation with robot studio
				To enable live demonstartion activate simulation in AS and start simulation in robot studio
***********************************************************************************************************************)
PROGRAM _INIT
	
	//Initial viewPoint
	ViewPoint[0] := TRUE;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//Main rotary joint conrol
	IF Joystick.J1 > 0 AND JointPosition.J1 < JOINT_LIMITS.J1_MAX THEN
		JointPosition.J1 := JointPosition.J1 + Joystick.J1 / 4;	
	ELSIF Joystick.J1 < 0 AND JointPosition.J1 > JOINT_LIMITS.J1_MIN THEN
		JointPosition.J1 := JointPosition.J1 + Joystick.J1 / 4;	
	END_IF
	
	//Primary arm conrol
	IF Joystick.J2 > 0 AND JointPosition.J2 > JOINT_LIMITS.J2_MIN THEN
		JointPosition.J2 := JointPosition.J2 - Joystick.J2 / 4;	
	ELSIF Joystick.J2 < 0 AND JointPosition.J2 < JOINT_LIMITS.J2_MAX THEN
		JointPosition.J2 := JointPosition.J2 - Joystick.J2 / 4;	
	END_IF
	
	//Secondary arm conrol
	IF Joystick.J3 > 0 AND JointPosition.J3 < JOINT_LIMITS.J3_MAX THEN
		JointPosition.J3 := JointPosition.J3 + Joystick.J3 / 4;	
	ELSIF Joystick.J3 < 0 AND JointPosition.J3 > JOINT_LIMITS.J3_MIN THEN
		JointPosition.J3 := JointPosition.J3 + Joystick.J3 / 4;	
	END_IF
	
	//PushArm conrol
	IF Cmd.PushArmOut AND JointPosition.J4 < JOINT_LIMITS.J4_MAX THEN
		JointPosition.J4 := JointPosition.J4 + 20;	
	ELSIF Cmd.PushArmIn AND JointPosition.J4 > JOINT_LIMITS.J4_MIN THEN
		JointPosition.J4 := JointPosition.J4 - 20;	
	END_IF
	
	//Actuator ZY rotary conrol
	IF Joystick.J5 > 0 AND JointPosition.J5 < JOINT_LIMITS.J5_MAX THEN
		JointPosition.J5 := JointPosition.J5 + Joystick.J5 / 2;	
	ELSIF Joystick.J5 < 0 AND JointPosition.J5 > JOINT_LIMITS.J5_MIN THEN
		JointPosition.J5 := JointPosition.J5 + Joystick.J5 / 2;	
	END_IF
	
	//Actuator YX rotary conrol
	IF Cmd.ActuatorYXClockwise AND JointPosition.J6 < JOINT_LIMITS.J6_MAX THEN
		JointPosition.J6 := JointPosition.J6 + 1;
	ELSIF Cmd.ActuatorYXAnticlockwise AND JointPosition.J6 > JOINT_LIMITS.J6_MIN THEN
		JointPosition.J6 := JointPosition.J6 - 1;	
	END_IF
	
	//Clamp control
	IF Cmd.ClampsOpen AND JointPosition.J7 < JOINT_LIMITS.J7_MAX THEN
		JointPosition.J7 := JointPosition.J7 + 1.5;
	ELSIF Cmd.ClampsClose AND JointPosition.J7 > JOINT_LIMITS.J7_MIN THEN
		JointPosition.J7 := JointPosition.J7 - 1.5;	
	END_IF
	
	//J8 not used
	
	//Bottom clamp
	IF Cmd.BottomClampOut AND JointPosition.J9 < JOINT_LIMITS.J9_MAX THEN
		JointPosition.J9 := JointPosition.J9 + 2.75;
	ELSIF Cmd.BottomClampIn AND JointPosition.J9 > JOINT_LIMITS.J9_MIN THEN
		JointPosition.J9 := JointPosition.J9 - 2.75;
	END_IF
	
	//Saw control
	IF Cmd.SawOut THEN
		JointPosition.J10 := JointPosition.J10 + 3;
	ELSIF Cmd.SawIn THEN
		JointPosition.J10 := JointPosition.J10 - 3;
	END_IF
	
	//Transport clamp control
	IF Cmd.TranspClampsOpen AND JointPosition.J11 < JOINT_LIMITS.J11_MAX THEN
		JointPosition.J11 := JointPosition.J11 + 1.5;
	ELSIF Cmd.TranspClampsClose AND JointPosition.J11 > JOINT_LIMITS.J11_MIN THEN
		JointPosition.J11 := JointPosition.J11 - 1.5;	
	END_IF
	
	//Transport wheel control
	IF Cmd.TransportWheelUp THEN
		JointPosition.J12 := JointPosition.J12 - 5;
	ELSIF Cmd.TransportWheelDown THEN
		JointPosition.J12 := JointPosition.J12 + 5;	
	END_IF
	
	//Close clamps and bottom clamp
	IF Cmd.CloseAllClamps THEN
		Cmd.ClampsClose := TRUE;
		Cmd.BottomClampIn := TRUE;
	ELSIF Cmd.OpenAllClamps THEN
		Cmd.ClampsOpen := TRUE;
		Cmd.BottomClampOut := TRUE;
	ELSE
		Cmd.ClampsClose := FALSE;
		Cmd.BottomClampIn := FALSE;
		Cmd.ClampsOpen := FALSE;
		Cmd.BottomClampOut := FALSE;
	END_IF
	
	//Calculation to rad
	JointPositionRad.J1 := JointPosition.J1 * PI / 180;
	JointPositionRad.J2 := JointPosition.J2 * PI / 180;
	JointPositionRad.J3 := JointPosition.J3 * PI / 180;
	JointPositionRad.J4 := JointPosition.J4 / 1000;
	JointPositionRad.J5 := JointPosition.J5 * PI / 180;
	JointPositionRad.J6 := JointPosition.J6 * PI / 180;
	JointPositionRad.J7 := JointPosition.J7 * PI / 180;
	JointPositionRad.J8 := JointPosition.J8 * PI / 180;
	JointPositionRad.J9 := JointPosition.J9 * PI / 180;
	JointPositionRad.J10 := JointPosition.J10 * PI / 180;
	JointPositionRad.J11 := JointPosition.J11 * PI / 180;
	JointPositionRad.J12 := JointPosition.J12 * PI / 180;
	
	//Viewpoint
	IF Cmd.MoveViewPointRight AND NOT MoveViewPointOld THEN
		IF i = MAX_VIEW_POINTS THEN
			i := 0;
		ELSE
			i := i + 1;
		END_IF
	ELSIF Cmd.MoveViewPointLeft AND NOT MoveViewPointOld THEN
		IF i = 0 THEN
			i := MAX_VIEW_POINTS;
		ELSE
			i := i - 1;
		END_IF
	END_IF
	MoveViewPointOld := Cmd.MoveViewPointRight OR Cmd.MoveViewPointLeft;
	
	FOR n := 0 TO MAX_VIEW_POINTS DO 
		ViewPoint[n] := FALSE;
	END_FOR
	ViewPoint[i] := TRUE;	
	
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM

