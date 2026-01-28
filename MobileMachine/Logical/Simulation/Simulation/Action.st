
ACTION MoveToZeroPosition: 
	
	CASE Step OF
		
		0:
			IF Cmd.MoveToZeroPosition THEN
				Step := Step + 1;
			END_IF
		
		
		1:
			IF Joint.J1.PositionDegree <= Joint.J1.PROPORTIONAL_CTRL AND Joint.J1.PositionDegree >= -Joint.J1.PROPORTIONAL_CTRL THEN
				Joint.J1.PositionDegree := 0;
				MovementDone[0] := TRUE;
			ELSIF Joint.J1.PositionDegree > Joint.J1.PROPORTIONAL_CTRL THEN
				Joint.J1.PositionDegree := Joint.J1.PositionDegree - Joint.J1.PROPORTIONAL_CTRL;
				MovementDone[0] := FALSE;
			ELSIF Joint.J1.PositionDegree < -Joint.J1.PROPORTIONAL_CTRL THEN
				Joint.J1.PositionDegree := Joint.J1.PositionDegree + Joint.J1.PROPORTIONAL_CTRL;
				MovementDone[0] := FALSE;
			END_IF
				
			IF Joint.J2.PositionDegree <= Joint.J2.PROPORTIONAL_CTRL AND Joint.J2.PositionDegree >= -Joint.J2.PROPORTIONAL_CTRL THEN
				Joint.J2.PositionDegree := 0;
				MovementDone[1] := TRUE;
			ELSIF Joint.J2.PositionDegree > Joint.J2.PROPORTIONAL_CTRL THEN
				Joint.J2.PositionDegree := Joint.J2.PositionDegree - Joint.J2.PROPORTIONAL_CTRL;
				MovementDone[1] := FALSE;
			ELSIF Joint.J2.PositionDegree < -Joint.J2.PROPORTIONAL_CTRL THEN
				Joint.J2.PositionDegree := Joint.J2.PositionDegree + Joint.J2.PROPORTIONAL_CTRL;
				MovementDone[1] := FALSE;
			END_IF
				
			IF Joint.J3.PositionDegree <= Joint.J3.PROPORTIONAL_CTRL AND Joint.J3.PositionDegree >= -Joint.J3.PROPORTIONAL_CTRL THEN
				Joint.J3.PositionDegree := 0;
				MovementDone[2] := TRUE;
			ELSIF Joint.J3.PositionDegree > Joint.J3.PROPORTIONAL_CTRL THEN
				Joint.J3.PositionDegree := Joint.J3.PositionDegree - Joint.J3.PROPORTIONAL_CTRL;
				MovementDone[2] := FALSE;
			ELSIF Joint.J3.PositionDegree < -Joint.J3.PROPORTIONAL_CTRL THEN
				Joint.J3.PositionDegree := Joint.J3.PositionDegree + Joint.J3.PROPORTIONAL_CTRL;
				MovementDone[2] := FALSE;
			END_IF
			
			IF Joint.J4.PositionDegree <= Joint.J4.PROPORTIONAL_CTRL AND Joint.J4.PositionDegree >= -Joint.J4.PROPORTIONAL_CTRL THEN
				Joint.J4.PositionDegree := 0;
				MovementDone[3] := TRUE;
			ELSIF Joint.J4.PositionDegree > Joint.J4.PROPORTIONAL_CTRL THEN
				Joint.J4.PositionDegree := Joint.J4.PositionDegree - Joint.J4.PROPORTIONAL_CTRL;
				MovementDone[3] := FALSE;
			ELSIF Joint.J4.PositionDegree < -Joint.J4.PROPORTIONAL_CTRL THEN
				Joint.J4.PositionDegree := Joint.J4.PositionDegree + Joint.J4.PROPORTIONAL_CTRL;
				MovementDone[3] := FALSE;
			END_IF
				
			IF Joint.J5.PositionDegree <= Joint.J5.PROPORTIONAL_CTRL AND Joint.J5.PositionDegree >= -Joint.J5.PROPORTIONAL_CTRL THEN
				Joint.J5.PositionDegree := 0;
				MovementDone[4] := TRUE;
			ELSIF Joint.J5.PositionDegree >= Joint.J5.PROPORTIONAL_CTRL THEN
				Joint.J5.PositionDegree := Joint.J5.PositionDegree - Joint.J5.PROPORTIONAL_CTRL;
				MovementDone[4] := FALSE;
			ELSIF Joint.J5.PositionDegree <= -Joint.J5.PROPORTIONAL_CTRL THEN
				Joint.J5.PositionDegree := Joint.J5.PositionDegree + Joint.J5.PROPORTIONAL_CTRL;
				MovementDone[4] := FALSE;
			END_IF
			
			IF Joint.J6.PositionDegree <= Joint.J6.PROPORTIONAL_CTRL AND Joint.J6.PositionDegree >= -Joint.J6.PROPORTIONAL_CTRL THEN
				Joint.J6.PositionDegree := 0;
				MovementDone[5] := TRUE;
			ELSIF Joint.J6.PositionDegree >= Joint.J6.PROPORTIONAL_CTRL THEN
				Joint.J6.PositionDegree := Joint.J6.PositionDegree - Joint.J6.PROPORTIONAL_CTRL;
				MovementDone[5] := FALSE;
			ELSIF Joint.J6.PositionDegree <= -Joint.J6.PROPORTIONAL_CTRL THEN
				Joint.J6.PositionDegree := Joint.J6.PositionDegree + Joint.J6.PROPORTIONAL_CTRL;
				MovementDone[5] := FALSE;
			END_IF

			IF MovementDone[0] AND MovementDone[1] AND MovementDone[2] AND MovementDone[3] AND MovementDone[4] AND MovementDone[5] THEN
				Step := Step + 1;
			END_IF
			
			
		2:
			IF Joint.J7.PositionDegree <= Joint.J7.PROPORTIONAL_CTRL AND Joint.J7.PositionDegree >= -Joint.J7.PROPORTIONAL_CTRL THEN
				Joint.J7.PositionDegree := 0;
				MovementDone[0] := TRUE;
			ELSIF Joint.J7.PositionDegree > Joint.J7.PROPORTIONAL_CTRL THEN
				Joint.J7.PositionDegree := Joint.J7.PositionDegree - Joint.J7.PROPORTIONAL_CTRL;
				MovementDone[0] := FALSE;
			ELSIF Joint.J7.PositionDegree < -Joint.J7.PROPORTIONAL_CTRL THEN
				Joint.J7.PositionDegree := Joint.J7.PositionDegree + Joint.J7.PROPORTIONAL_CTRL;
				MovementDone[0] := FALSE;
			END_IF
			
			IF Joint.J9.PositionDegree <= Joint.J9.PROPORTIONAL_CTRL AND Joint.J9.PositionDegree >= -Joint.J9.PROPORTIONAL_CTRL THEN
				Joint.J9.PositionDegree := 0;
				MovementDone[1] := TRUE;
			ELSIF Joint.J9.PositionDegree > Joint.J9.PROPORTIONAL_CTRL THEN
				Joint.J9.PositionDegree := Joint.J9.PositionDegree - Joint.J9.PROPORTIONAL_CTRL;
				MovementDone[1] := FALSE;
			ELSIF Joint.J9.PositionDegree < -Joint.J8.PROPORTIONAL_CTRL THEN
				Joint.J9.PositionDegree := Joint.J9.PositionDegree + Joint.J9.PROPORTIONAL_CTRL;
				MovementDone[1] := FALSE;
			END_IF
				
			IF Joint.J11.PositionDegree < Joint.J11.PROPORTIONAL_CTRL AND Joint.J11.PositionDegree > -Joint.J11.PROPORTIONAL_CTRL THEN
				Joint.J11.PositionDegree := 0;
				MovementDone[2] := TRUE;
			ELSIF Joint.J11.PositionDegree > Joint.J11.PROPORTIONAL_CTRL THEN
				Joint.J11.PositionDegree := Joint.J11.PositionDegree - Joint.J11.PROPORTIONAL_CTRL;
				MovementDone[2] := FALSE;
			ELSIF Joint.J11.PositionDegree < -Joint.J11.PROPORTIONAL_CTRL THEN
				Joint.J11.PositionDegree := Joint.J11.PositionDegree + Joint.J11.PROPORTIONAL_CTRL;
				MovementDone[2] := FALSE;
			END_IF
				
			IF Joint.J12.PositionDegree < Joint.J12.PROPORTIONAL_CTRL AND Joint.J12.PositionDegree > -Joint.J12.PROPORTIONAL_CTRL THEN
				Joint.J12.PositionDegree := 0;
				MovementDone[3] := TRUE;
			ELSIF Joint.J12.PositionDegree >= Joint.J12.PROPORTIONAL_CTRL THEN
				Joint.J12.PositionDegree := Joint.J12.PositionDegree - Joint.J12.PROPORTIONAL_CTRL;
				MovementDone[3] := FALSE;
			ELSIF Joint.J12.PositionDegree <= -Joint.J12.PROPORTIONAL_CTRL THEN
				Joint.J12.PositionDegree := Joint.J12.PositionDegree + Joint.J12.PROPORTIONAL_CTRL;
				MovementDone[3] := FALSE;
			END_IF
			
			IF MovementDone[0] AND MovementDone[1] AND MovementDone[2] AND MovementDone[3] AND MovementDone[4] AND MovementDone[4] THEN
				Step := Step + 1;
			END_IF
			
		3:
			Cmd.MoveToZeroPosition := FALSE;
			Step := 0;
			
	END_CASE

END_ACTION
