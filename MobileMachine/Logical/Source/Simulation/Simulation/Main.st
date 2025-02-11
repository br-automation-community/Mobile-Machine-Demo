(***********************************************************************************************************************
* Copyright: B&R Industrial Automation GmbH
* Author: B&R
* Date: 09/01/2025
* Description: 	Used for simulation with robot studio
				To enable live demonstartion activate simulation in AS and start simulation in robot studio
***********************************************************************************************************************)
PROGRAM _INIT

END_PROGRAM

PROGRAM _CYCLIC
	
	IF (JointPosition.J1 > JOINT_LIMITS.J1_MAX AND Joystick.J1 > 0) OR (JointPosition.J1 < JOINT_LIMITS.J1_MIN AND Joystick.J1 < 0) THEN
		//status message
	ELSE
		JointPosition.J1 := JointPosition.J1 + (Joystick.J1/ScalingFactor.J1);	
	END_IF
	
	IF (JointPosition.J2 >= JOINT_LIMITS.J2_MAX AND Joystick.J2 < 0) OR (JointPosition.J2 < JOINT_LIMITS.J2_MIN AND Joystick.J2 > 0) THEN
	
	ELSE
		JointPosition.J2 := JointPosition.J2 - (Joystick.J2/ScalingFactor.J2);
	END_IF
	
	IF (JointPosition.J3 >= JOINT_LIMITS.J3_MAX AND Joystick.J3 < 0) OR (JointPosition.J3 < JOINT_LIMITS.J3_MIN AND Joystick.J3 > 0) THEN
	
	ELSE
		JointPosition.J3 := JointPosition.J3 - (Joystick.J3/ScalingFactor.J3);
	END_IF
	
	IF (JointPosition.J5 >= JOINT_LIMITS.J5_MAX AND Joystick.J5 < 0) OR (JointPosition.J5 < JOINT_LIMITS.J5_MIN AND Joystick.J5 > 0) THEN
	
	ELSE
		JointPosition.J5 := JointPosition.J5 - (Joystick.J5/ScalingFactor.J5);
	END_IF
	
	 
END_PROGRAM

PROGRAM _EXIT

END_PROGRAM

