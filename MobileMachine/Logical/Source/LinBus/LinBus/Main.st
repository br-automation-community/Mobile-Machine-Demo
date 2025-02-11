(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 13/05/2024
* Description:  Marquardt Rocker Switch Series 3270 example
				Example from the AS help, no simulation of the lin communication possibe
 ***********************************************************************************************************************)
PROGRAM _INIT
	CpLinScheduler_0.Enable := TRUE;
	CpLinScheduler_0.Run := cpLIN_RUN_CYCLIC;
	CpLinScheduler_0.DeviceName := 'IF5';
	(* Scheduler configuration *)
	// Frame ID 1 is used to read button states. 
	Schedule[0].Duration := 10;
	Schedule[0].Frame.FrameId := 1;
	Schedule[0].Frame.Length := 0;
	// Frame ID 2 is used to set colors of the LEDs
	Schedule[1].Duration := 10;
	Schedule[1].Frame.FrameId := 2;
	Schedule[1].Frame.Length := 6;
	// Frame ID 59 is used to set background lighting of the switch
	Schedule[2].Duration := 10;
	Schedule[2].Frame.FrameId := 59;
	Schedule[2].Frame.Length := 2;
 END_PROGRAM


PROGRAM _CYCLIC
	CpLinScheduler_0.Schedule := ADR(Schedule);
	CpLinScheduler_0.ScheduleLength := SIZEOF(Schedule)/SIZEOF(Schedule[0]);
	CpLinScheduler_0();
	(* Reading input data *)
	IF CpLinScheduler_0.FrameReceived THEN
		nbReceivedFrames := nbReceivedFrames + 1;
		IF CpLinScheduler_0.Frame.ErrorFlags = cpLIN_EF_NO_ERROR THEN
			IF CpLinScheduler_0.Frame.FrameId = Schedule[0].Frame.FrameId THEN
				lpb_001_b := CpLinScheduler_0.Frame.Data[0].0; // 0 = bottom switch open; 1 = bottom switch closed
				lpb_001_a := CpLinScheduler_0.Frame.Data[0].2; // 0 = top switch open; 1 = top switch closed
			END_IF
		ELSE
			// frame error evaluation
			nbErrorFlags := nbErrorFlags + 1;
			lastErrorFlag := CpLinScheduler_0.Frame.ErrorFlags;
		END_IF
	END_IF
	(* Doing some logic *)
	IF lpb_001_a THEN
		// if upper button pressed, turn upper LED green 
		lpb_001_led_a_green_brightness := 255; 
	ELSE
		lpb_001_led_a_green_brightness := 0;
	END_IF        
	IF lpb_001_b THEN
		// if lower button pressed, turn lower LED green 
		lpb_001_led_b_green_brightness := 255;
	ELSE
		lpb_001_led_b_green_brightness := 0;
	END_IF        
	(* Writing output data *)
	// write LED colors
	Schedule[1].Frame.Data[0] := lpb_001_led_b_green_brightness;
	Schedule[1].Frame.Data[1] := lpb_001_led_b_red_brightness;
	Schedule[1].Frame.Data[2] := lpb_001_led_a_green_brightness;
	Schedule[1].Frame.Data[3] := lpb_001_led_a_red_brightness;
	Schedule[1].Frame.Data[4] := lpb_001_led_b_blue_brightness;
	Schedule[1].Frame.Data[5] := lpb_001_led_a_blue_brightness;
	// switch backlighting
	Schedule[2].Frame.Data[0] := lpb_background_lighting;
	(* Error evaluation *)
	IF CpLinScheduler_0.Error THEN
		nbErrors := nbErrors + 1;
		lastErrorID := CpLinScheduler_0.ErrorID;
	END_IF
 END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM
