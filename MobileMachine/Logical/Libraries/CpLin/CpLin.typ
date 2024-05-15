
TYPE
	CpLinErrorEnum : 
		( (*Error numbers*)
		cpLIN_ERR_MAX_PORTS_REACHED := -1070582446, (*Maximum number of opened ports reached*)
		cpLIN_ERR_ILLEGAL_FRAME_LENGTH := -1070582445, (*Frame length is outside the valid range*)
		cpLIN_ERR_ILLEGAL_FRAME_ID := -1070582444, (*Frame ID is outside the valid range*)
		cpLIN_ERR_MULTIPLE_INSTANCES := -1070582443, (*Multiple FUB instances are not allowed*)
		cpLIN_ERR_NO_SCHEDULE := -1070582442 (*No schedule is set*)
		);
	CpLinChecksumEnum : 
		( (*Frame checksum type*)
		cpLIN_CS_AUTO, (*Auto checksum*)
		cpLIN_CS_CLASSIC, (*Classic checksum*)
		cpLIN_CS_ENHANCED (*Enhanced checksum*)
		);
	CpLinErrorFlagsEnum : 
		( (*Error flags of received frame*)
		cpLIN_EF_NO_ERROR := 0, (*No error*)
		cpLIN_EF_INCONSISTENT_SYNC := 1, (*Error on Synchronization field*)
		cpLIN_EF_ID_PARITY_BIT6 := 2, (*Wrong parity Bit 6*)
		cpLIN_EF_ID_PARITY_BIT7 := 4, (*Wrong parity Bit 7*)
		cpLIN_EF_CHECKSUM := 8, (*Wrong checksum*)
		cpLIN_EF_ILLEGAL_LENGTH := 16, (*Illegal frame length*)
		cpLIN_EF_NO_RESPONSE := 32 (*No response from slave*)
		);
	CpLinFubStateEnum : 
		(
		cpLIN_FS_DISABLED,
		cpLIN_FS_INIT,
		cpLIN_FS_ACTIVE,
		cpLIN_FS_DEINIT
		);
	CpLinReceiveFrameType : 	STRUCT  (*Received frame*)
		FrameId : USINT; (*Frame ID (0..63)*)
		Length : USINT; (*Frame length (0..8)*)
		Data : ARRAY[0..7]OF USINT; (*Up to 8 data bytes*)
		ChecksumType : CpLinChecksumEnum; (*Frame Checksum type*)
		Checksum : USINT; (*Checksum of received frame*)
		ErrorFlags : CpLinErrorFlagsEnum; (*Error flags of received frame*)
	END_STRUCT;
	CpLinReceiveInternalType : 	STRUCT 
		FubState : CpLinFubStateEnum;
		PortData : UDINT;
	END_STRUCT;
	CpLinBusStateEnum : 
		( (*Bus/Scheduler state*)
		cpLIN_BS_SLEEP, (*Bus is in sleep mode*)
		cpLIN_BS_WAKING_UP, (*Bus is waking up*)
		cpLIN_BS_ACTIVE (*Bus is active*)
		);
	CpLinRunEnum : 
		( (*Command to run Scheduler*)
		cpLIN_RUN_OFF,
		cpLIN_RUN_CYCLIC,
		cpLIN_RUN_ONCE
		);
	CpLinScheduleItemType : 	STRUCT  (*Schedule table item to be sent by Scheduler*)
		Duration : UINT; (*Frame slot duration [ms]*)
		Frame : CpLinSendFrameType; (*Frame to be sent*)
	END_STRUCT;
	CpLinSchedulerInternalType : 	STRUCT 
		FubState : CpLinFubStateEnum;
		PortData : UDINT;
		CycleTime : UINT;
		SlotTimer : DINT;
		InitTimer : DINT;
		WakeupTimer : DINT;
		BusInactivityTimer : DINT;
		CpLinReceive_0 : CpLinReceive;
		CpLinSend_0 : CpLinSend;
	END_STRUCT;
	CpLinSendFrameType : 	STRUCT  (*Frame to be sent*)
		FrameId : USINT; (*Frame ID (0..63)*)
		Length : USINT; (*Frame length (0..8)*)
		Data : ARRAY[0..7]OF USINT; (*Up to 8 data bytes*)
		ChecksumType : CpLinChecksumEnum; (*Checksum of sent frame*)
	END_STRUCT;
	CpLinSendInternalType : 	STRUCT 
		FubState : CpLinFubStateEnum;
		PortData : UDINT;
	END_STRUCT;
END_TYPE
