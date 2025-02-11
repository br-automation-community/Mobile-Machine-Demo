(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 13/05/2024
* Description: 	Example for standby mode
				Go in deep sleep at TimeStampHour:TimeStampMinute
				Wake up after 5 minutes or status ignition goes to true
***********************************************************************************************************************)

PROGRAM _INIT
	//Wakeup configuration, after 5 minutes
	ArEcoPlcShutdown_0.WakeupTime.Mode := arECO_WAKEUPMODE_VISIBLE;
	ArEcoPlcShutdown_0.WakeupTime.Time := T#5m;
	
	WakeupTriggers[0].Mode := arECO_WAKEUPMODE_VISIBLE;
	WakeupTriggers[0].Name := 'X1.StatusIgnition';
	
	ArEcoPlcShutdown_0.NrOfWakeupTriggers := SIZEOF(WakeupTriggers) / SIZEOF(WakeupTriggers[0]);
	ArEcoPlcShutdown_0.WakeupTriggers := ADR(WakeupTriggers);

END_PROGRAM

PROGRAM _CYCLIC
	//Get Timestamp from PLC
	DTGetTime_0(enable := TRUE);
	Timestamp := DTGetTime_0.DT1;
	TimeStampString := DT_TO_STRING(Timestamp);
	
	//Select time hour, minute
	brsmemcpy(ADR(TimeStampMinuteString),ADR(TimeStampString) + 17, 2);
	brsmemcpy(ADR(TimeStampHourString),ADR(TimeStampString) + 14, 2);
	
	TimeStampMinute := STRING_TO_USINT(TimeStampMinuteString);
	TimeStampHour := STRING_TO_USINT(TimeStampHourString);
	
	//Deep sleep at TimeStampHour:TimeStampMinute
	IF TimeStampHour = 8 AND TimeStampMinute = 40 THEN
		GoStandby := TRUE;
	END_IF
	
	//Power on T50 mobile
	PowerSupplyT50 := TRUE;
	
	ArEcoPlcShutdown_0(Execute := GoStandby);
	
END_PROGRAM



PROGRAM _EXIT

END_PROGRAM