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
	
	MoveToZeroPosition;
	
	//Main rotary joint conrol
	IF Joystick.J1 > 0 AND Joint.J1.PositionDegree < Joint.J1.MAX_LIMIT THEN
		Joint.J1.PositionDegree := Joint.J1.PositionDegree + Joystick.J1 * Joint.J1.PROPORTIONAL_CTRL;	
	ELSIF Joystick.J1 < 0 AND Joint.J1.PositionDegree > Joint.J1.MIN_LIMIT THEN
		Joint.J1.PositionDegree := Joint.J1.PositionDegree + Joystick.J1 * Joint.J1.PROPORTIONAL_CTRL;	
	END_IF
	
	//Primary arm conrol
	IF Joystick.J2 > 0 AND Joint.J2.PositionDegree > Joint.J2.MIN_LIMIT THEN
		Joint.J2.PositionDegree := Joint.J2.PositionDegree - Joystick.J2 * Joint.J2.PROPORTIONAL_CTRL;	
	ELSIF Joystick.J2 < 0 AND Joint.J2.PositionDegree < Joint.J2.MAX_LIMIT THEN
		Joint.J2.PositionDegree := Joint.J2.PositionDegree - Joystick.J2 * Joint.J2.PROPORTIONAL_CTRL;	
	END_IF
	
	//Secondary arm conrol
	IF Joystick.J3 > 0 AND Joint.J3.PositionDegree < Joint.J3.MAX_LIMIT THEN
		Joint.J3.PositionDegree := Joint.J3.PositionDegree + Joystick.J3 * Joint.J3.PROPORTIONAL_CTRL;	
	ELSIF Joystick.J3 < 0 AND Joint.J3.PositionDegree > Joint.J3.MIN_LIMIT THEN
		Joint.J3.PositionDegree := Joint.J3.PositionDegree + Joystick.J3 * Joint.J3.PROPORTIONAL_CTRL;	
	END_IF
	
	//PushArm conrol
	IF Cmd.PushArmOut AND Joint.J4.PositionDegree < Joint.J4.MAX_LIMIT THEN
		Joint.J4.PositionDegree := Joint.J4.PositionDegree + Joint.J4.PROPORTIONAL_CTRL;	
	ELSIF Cmd.PushArmIn AND Joint.J4.PositionDegree > Joint.J4.MIN_LIMIT THEN
		Joint.J4.PositionDegree := Joint.J4.PositionDegree - Joint.J4.PROPORTIONAL_CTRL;	
	END_IF
	
	//Actuator ZY rotary conrol
	IF Joystick.J5 > 0 AND Joint.J5.PositionDegree < Joint.J5.MAX_LIMIT THEN
		Joint.J5.PositionDegree := Joint.J5.PositionDegree + Joystick.J5 * Joint.J5.PROPORTIONAL_CTRL;	
	ELSIF Joystick.J5 < 0 AND Joint.J5.PositionDegree > Joint.J5.MIN_LIMIT THEN
		Joint.J5.PositionDegree := Joint.J5.PositionDegree + Joystick.J5 * Joint.J5.PROPORTIONAL_CTRL;	
	END_IF
	
	//Actuator YX rotary conrol
	IF Cmd.ActuatorYXClockwise AND Joint.J6.PositionDegree < Joint.J6.MAX_LIMIT THEN
		Joint.J6.PositionDegree := Joint.J6.PositionDegree + Joint.J6.PROPORTIONAL_CTRL;	
	ELSIF Cmd.ActuatorYXAnticlockwise AND Joint.J6.PositionDegree > Joint.J6.MIN_LIMIT THEN
		Joint.J6.PositionDegree := Joint.J6.PositionDegree - Joint.J6.PROPORTIONAL_CTRL;	
	END_IF
	
	//Clamp control
	IF Cmd.ClampsOpen AND Joint.J7.PositionDegree < Joint.J7.MAX_LIMIT THEN
		Joint.J7.PositionDegree := Joint.J7.PositionDegree + Joint.J7.PROPORTIONAL_CTRL;	
	ELSIF Cmd.ClampsClose AND Joint.J7.PositionDegree > Joint.J7.MIN_LIMIT THEN
		Joint.J7.PositionDegree := Joint.J7.PositionDegree - Joint.J7.PROPORTIONAL_CTRL;	
	END_IF
	
	//J8 not used
	
	//Bottom clamp
	IF Cmd.BottomClampOut AND Joint.J9.PositionDegree < Joint.J9.MAX_LIMIT THEN
		Joint.J9.PositionDegree := Joint.J9.PositionDegree + Joint.J9.PROPORTIONAL_CTRL;	
	ELSIF Cmd.BottomClampIn AND Joint.J9.PositionDegree > Joint.J9.MIN_LIMIT THEN
		Joint.J9.PositionDegree := Joint.J9.PositionDegree - Joint.J9.PROPORTIONAL_CTRL;	
	END_IF
	
	//Saw control
	IF Cmd.Cut THEN
		CASE l OF
			0:    IF Joint.J10.PositionDegree <= Joint.J10.MAX_LIMIT THEN
					Joint.J10.PositionDegree := Joint.J10.PositionDegree + Joint.J10.PROPORTIONAL_CTRL;
				ELSE
					l := 1;
				END_IF
            
			1:    IF Joint.J10.PositionDegree > Joint.J10.MIN_LIMIT THEN
					Joint.J10.PositionDegree := Joint.J10.PositionDegree - Joint.J10.PROPORTIONAL_CTRL;
				ELSE
					Cmd.Cut := FALSE;
					l := 0;
				END_IF
		END_CASE;
	END_IF
	
	//Transport clamp control
	IF Cmd.TranspClampsOpen AND Joint.J11.PositionDegree < Joint.J11.MAX_LIMIT THEN
		Joint.J11.PositionDegree := Joint.J11.PositionDegree + Joint.J11.PROPORTIONAL_CTRL;	
	ELSIF Cmd.TranspClampsClose AND Joint.J11.PositionDegree > Joint.J11.MIN_LIMIT THEN
		Joint.J11.PositionDegree := Joint.J11.PositionDegree - Joint.J11.PROPORTIONAL_CTRL;	
	END_IF
	
	//Transport wheel control
	IF Cmd.TransportWheelUp THEN
		Joint.J12.PositionDegree := Joint.J12.PositionDegree - Joint.J12.PROPORTIONAL_CTRL;	
	ELSIF Cmd.TransportWheelDown THEN
		Joint.J12.PositionDegree := Joint.J12.PositionDegree + Joint.J12.PROPORTIONAL_CTRL;	
	END_IF

	
	//Calculation to rad
	Joint.J1.PositionRad := Joint.J1.PositionDegree * PI / 180;
	Joint.J2.PositionRad := Joint.J2.PositionDegree * PI / 180;
	Joint.J3.PositionRad := Joint.J3.PositionDegree * PI / 180;
	Joint.J4.PositionRad := Joint.J4.PositionDegree / 1000;
	Joint.J5.PositionRad := Joint.J5.PositionDegree * PI / 180;
	Joint.J6.PositionRad := Joint.J6.PositionDegree * PI / 180;
	Joint.J7.PositionRad := Joint.J7.PositionDegree * PI / 180;
	Joint.J8.PositionRad := Joint.J8.PositionDegree * PI / 180;
	Joint.J9.PositionRad := Joint.J9.PositionDegree * PI / 180;
	Joint.J10.PositionRad := Joint.J10.PositionDegree * PI / 180;
	Joint.J11.PositionRad := Joint.J11.PositionDegree * PI / 180;
	Joint.J12.PositionRad := Joint.J12.PositionDegree * PI / 180;
	
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

