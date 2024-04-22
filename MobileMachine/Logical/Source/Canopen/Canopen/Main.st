PROGRAM _INIT
END_PROGRAM

PROGRAM _CYCLIC

	IF NOT KeypadOld THEN
		IF Keypad[0] = KEYPAD_VALUE[0] THEN
			IF (Keypad[1] MOD KEYPAD_VALUE[1] = KEYPAD_VALUE[0]) THEN
				Keypad[1] := Keypad[1] - KEYPAD_VALUE[0];
			ELSE
				Keypad[1] := Keypad[1] + KEYPAD_VALUE[0];
			END_IF
		ELSIF Keypad[0] = KEYPAD_VALUE[1] THEN
			IF (Keypad[1] MOD KEYPAD_VALUE[2] >= KEYPAD_VALUE[1]) THEN 
				Keypad[1] := Keypad[1] - KEYPAD_VALUE[1];
			ELSE
				Keypad[1] := Keypad[1] + KEYPAD_VALUE[1];
			END_IF
		ELSIF Keypad[0] = KEYPAD_VALUE[2] THEN
			IF (Keypad[1] MOD KEYPAD_VALUE[3] >= KEYPAD_VALUE[2]) THEN 
				Keypad[1] := Keypad[1] - KEYPAD_VALUE[2];
			ELSE
				Keypad[1] := Keypad[1] + KEYPAD_VALUE[2];
			END_IF
		ELSIF Keypad[0] = KEYPAD_VALUE[3] THEN
			IF (Keypad[1] MOD KEYPAD_VALUE[4] >= KEYPAD_VALUE[3]) THEN 
				Keypad[1] := Keypad[1] - KEYPAD_VALUE[3];
			ELSE
				Keypad[1] := Keypad[1] + KEYPAD_VALUE[3];
			END_IF
		ELSIF Keypad[0] = KEYPAD_VALUE[4] THEN
			IF (Keypad[1] MOD KEYPAD_VALUE[5] >= KEYPAD_VALUE[4]) THEN 
				Keypad[1] := Keypad[1] - KEYPAD_VALUE[4];
			ELSE
				Keypad[1] := Keypad[1] + KEYPAD_VALUE[4];
			END_IF
		ELSIF Keypad[0] = KEYPAD_VALUE[5] THEN
			IF (Keypad[1] MOD (2*KEYPAD_VALUE[5]) >= KEYPAD_VALUE[5]) THEN 
				Keypad[1] := Keypad[1] - KEYPAD_VALUE[5];
			ELSE
				Keypad[1] := Keypad[1] + KEYPAD_VALUE[5];
			END_IF
		END_IF
	END_IF
		
	IF Keypad[0] > 0 THEN
		KeypadOld := TRUE;
	ELSE
		KeypadOld := FALSE;
	END_IF

	 
END_PROGRAM

PROGRAM _EXIT	 
END_PROGRAM

