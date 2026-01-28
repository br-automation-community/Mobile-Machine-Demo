(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 06/11/2025
* Description: 	Example for PWM control with current control
				Channel 39 is used as PWM output with dither & frequency set in the configuration
***********************************************************************************************************************)
PROGRAM _INIT
	
	//[%]
	MTBasicsPID_0.MinOut := 0.0;
	MTBasicsPID_0.MaxOut := 100.0;
	
	MTBasicsPID_0.PIDParameters := MTPIDParameters;
	MTPIDParameters.Gain := 1.2; 
	MTPIDParameters.DerivativeTime := 0.0;	//[s]
	MTPIDParameters.FilterTime := 0.02;		//[s]
	MTPIDParameters.IntegrationTime := 0.2; //[s]
	
	//[mA]
	MTBasicsPID_0.SetValue := 200.0; 	
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//Coversion from measurment units to mA
	MTBasicsPID_0.ActValue := INT_TO_REAL(PWMOutput39RawCurrent) * 1000 / 305;
	MTBasicsPID_0.Enable := OutputOn;
	
	IF NOT OutputOn THEN
		PWMOutput39Duty := 0;			//Off
	ELSE
		PWMOutput39Duty := REAL_TO_INT(MTBasicsPID_0.Out);
	END_IF
	
	MTBasicsPID_0();
	 
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

