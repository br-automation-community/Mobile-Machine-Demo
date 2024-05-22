(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 13/05/2024
* Description: 	Example for deep sleep mode
				Go in deep sleep at 15:11, wake up after 2 minutes
***********************************************************************************************************************)
PROGRAM _INIT
	//Wakeup configuration, after 2 minutes
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
	TimestampString := DT_TO_STRING(Timestamp);
	
	brsmemcpy(ADR(TimeStampMinuteString),ADR(TimestampString) + 17, 2);
	brsmemcpy(ADR(TimeStampHourString),ADR(TimestampString) + 14, 2);
	
	TimeStampMinute := STRING_TO_USINT(TimeStampMinuteString);
	TimeStampHour := STRING_TO_USINT(TimeStampHourString);
	
	//Deep sleep at TimeStampHour:TimeStampMinute
	IF TimeStampHour = 9 AND TimeStampMinute = 21 THEN
		GoSleep := TRUE;
	END_IF
	
	//Power on T50 mobile
	PowerSupplyT50 := TRUE;
	
	ArEcoPlcShutdown_0(Execute := GoSleep);
	
END_PROGRAM

PROGRAM _EXIT

END_PROGRAM