
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	IF i THEN
		MTBasicsPWM_0(Enable := TRUE, Mode := 0, MinPulseWidth := 0, Period := 0.05, DutyCycle := 40);
	END_IF
		
	
//	DutyCycle := (REAL_TO_UINT(100000/SupplyVoltage) * (REAL_TO_UINT(100000/SupplyVoltage)) * 32766);
	Period;
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

