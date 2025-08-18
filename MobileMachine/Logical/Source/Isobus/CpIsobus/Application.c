//***********************************************************************
// Copyright: B&R Industrial Automation GmbH
// Author: B&R
// Created: 2023
// Description: Application
//***********************************************************************

// INCLUDES=============================================================================================================
#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif
#include <IsoStackCore.h>
#include <IsoStackVt.h>
#include <IsoStackNw.h>
#include <IsoStackDiag.h>
#include <HalText.h>

// Reference to vt-designer visualization. This needs to be changed when the vt-designer project name changes
#include "VT/vt-designer_Project1.main.h"
#include "VT/vt-designer_Project1.iop.h"

// LOCAL VARIABLE DEFINITIONS===========================================================================================

static TName m_tTypicalAppName;
static TLocalCfStorage m_tTypicalAppStorage;

static TVtClientCallbacks m_tVtClientCallbacks;
static TVtClientStorage m_tVtClientStorage;

// SOURCE CODE OF GLOBAL AND LOCAL FUNCTIONS============================================================================

static TVoid m_vApplicationObjectPoolUploadedSuccessfully(ELocalCf eLocalCf, const TLocalSettings *cptLocalSettings)
{
	ClientConnected = 1;
	CpIsobusLog(cpISOBUS_INF_GENERIC, "Client connected");
}

static TVoid m_vApplicationConnectionRequest(ELocalCf eLocalCf, const TVtCapabilities *cptVtCapabilities, EVtConnReqReason eVtConnReqReason)
{
	TEST_ASSERT(boIsoStackVtDoConnect(eLocalCf, &g_ctVtClientObjectPool, NULL));
}

static TVoid m_vApplicationEnterSafeState(ELocalCf eLocalCf)
{
	ClientConnected = 0;
	CpIsobusLog(cpISOBUS_INF_GENERIC, "Client disconnected");
}

static TVoid m_vApplicationVtSoftKeyActivation(ELocalCf eLocalCf, EVtKeyActivationCode eVtKeyActivationCode, TUint16 u16ObjId,
	TUint16 u16ObjIdMask, TUint8 u8KeyCode)
{
}

static TVoid m_vApplicationVtButtonActivation(ELocalCf eLocalCf, EVtKeyActivationCode eVtKeyActivationCode, TUint16 u16ObjId, 
	TUint16 u16ObjIdMask, TUint8 u8KeyCode)
{
//	switch (u16ObjId)
//	{
//		case btn_setTempUp:
//			if (eVtKeyActivationCode == E_VT_KEY_ACTIVATION_CODE_RELEASED)
//			{
//				if (++setTemp > 100) setTemp = 100;
//			}
//			break;
//
//		case btn_setTempDown:
//			if (eVtKeyActivationCode == E_VT_KEY_ACTIVATION_CODE_RELEASED)
//			{
//				if (--setTemp < 10) setTemp = 10;
//			}
//			break;
//	}
}

static TVoid m_vApplicationVtPointingEvent(ELocalCf eLocalCf, TUint16 u16XPos, TUint16 u16YPos)
{
}

static TVoid m_vApplicationVtNumericValue(ELocalCf eLocalCf, TUint16 u16ObjId, TUint32 u32Value)
{
	switch (u16ObjId)
	{
		case InputVar:
			InputVarAS = u32Value;
			break;
	}
	
//	switch (u16ObjId)
//	{
//		case nv_setTemp:
//			setTemp = u32Value;
//			break;
//	}
}

static TVoid m_vApplicationVtStringValue(ELocalCf eLocalCf, TUint16 u16ObjId, TUint8 u8Length, const TChar *cpchValue)
{
}

static TVoid m_vApplicationVtSelectInputObject(ELocalCf eLocalCf, TUint16 u16ObjectId, EVtSelectInputObjectAttributes eVtSelectInputObjectAttributes)
{
}

static TVoid m_vApplicationVtCommandResponse(ELocalCf eLocalCf, TUint8 u8ErrorCode, TUint32 u32UserId)
{
}

static TVoid m_vApplicationVtPropCommandResponse(ELocalCf eLocalCf, const TCU8Buffer *cptCU8Buffer, TUint16 u16UserId)
{
}

static TVoid m_vApplicationVtEventLanguagePgn(ELocalCf eLocalCf, const TLocalSettings *cptLocalSettings)
{
}

static TVoid m_vApplicationDisplayState(ELocalCf eLocalCf, TBoolean boActiveClient, TUint16 u16DamUid, TUint16 u16SkmUid)
{
	if (boActiveClient) {
		CpIsobusLog(cpISOBUS_INF_GENERIC, "Client displayed");
	} else {
		CpIsobusLog(cpISOBUS_INF_GENERIC, "Client not displayed");
	}
}

static TVoid m_vApplicationVtEsc(ELocalCf eLocalCf, TUint16 u16ObjectId)
{
}

static TVoid m_vApplicationMultipleActiveVts(ELocalCf eLocalCf, TBoolean boMultipleVts)
{
}

static TVoid m_vApplicationAux1AssignmentChanged(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TBoolean boAssigned)
{
}

static TVoid m_vApplicationAux1Value(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TUint16 u16Value, TUint16 u16NoOfTransitions)
{
}

static TVoid m_vApplicationAux2AssignmentChanged(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TBoolean boAssigned)
{
}

static TVoid m_vApplicationAux2Value(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TUint16 u16Value1, TUint16 u16Value2)
{
}

void ApplicationInit(void)
{
	// Set device address
	m_tTypicalAppStorage.u8InitialAddress = 0xda;
	
	m_tVtClientStorage.tPreferredVt.boSpecified = FALSE;

	// Set other device parameters, such as the ISOBUS name…
	vIsoStackNwSetName(&m_tTypicalAppName, 2, 0, 2, 128, 0, 0, 2000, 100000);

	TEST_ASSERT(boIsoStackNwActivateLocalCf(E_LOCAL_CF_1, &m_tTypicalAppName, &m_tTypicalAppStorage, NULL));

	TEST_ASSERT(boIsoStackNwSetMember(E_LOCAL_CF_1, 1, NULL));
	
	// Set diagnostic information
	TEST_ASSERT(boIsoStackDiagSetEcuIdent(E_LOCAL_CF_1, "partNr", "serialNr", "location", "type", "manufacturerName", "hardwareVer"));
	TEST_ASSERT(boIsoStackDiagSetProductIdent(E_LOCAL_CF_1, "code", "brand", "model"));
	TEST_ASSERT(boIsoStackDiagSetSwIdent(E_LOCAL_CF_1, "sw-version*"));
	TEST_ASSERT(boIsoStackDiagSetCertData(E_LOCAL_CF_1, 2015, E_CERT_REV_NOT_AVAILABLE, E_CERT_LAB_NOT_AVAILABLE, 42, 4711));


	m_tVtClientCallbacks.fpvObjectPoolUploadedSuccessfully = m_vApplicationObjectPoolUploadedSuccessfully;
	m_tVtClientCallbacks.fpvConnectionRequest              = m_vApplicationConnectionRequest;
	m_tVtClientCallbacks.fpvEnterSafeState                 = m_vApplicationEnterSafeState;
	m_tVtClientCallbacks.fpvVtSoftKeyActivation            = m_vApplicationVtSoftKeyActivation;
	m_tVtClientCallbacks.fpvVtButtonActivation             = m_vApplicationVtButtonActivation;
	m_tVtClientCallbacks.fpvVtPointingEvent                = m_vApplicationVtPointingEvent;
	m_tVtClientCallbacks.fpvVtNumericValue                 = m_vApplicationVtNumericValue;
	m_tVtClientCallbacks.fpvVtStringValue                  = m_vApplicationVtStringValue;
	m_tVtClientCallbacks.fpvVtSelectInputObject            = m_vApplicationVtSelectInputObject;
	m_tVtClientCallbacks.fpvVtCommandResponse              = m_vApplicationVtCommandResponse;
	m_tVtClientCallbacks.fpvVtPropCommandResponse          = m_vApplicationVtPropCommandResponse;
	m_tVtClientCallbacks.fpvVtEventLanguagePgn             = m_vApplicationVtEventLanguagePgn;
	m_tVtClientCallbacks.fpvDisplayState                   = m_vApplicationDisplayState;
	m_tVtClientCallbacks.fpvVtEsc                          = m_vApplicationVtEsc;
	m_tVtClientCallbacks.fpvMultipleActiveVts              = m_vApplicationMultipleActiveVts;
	m_tVtClientCallbacks.fpvAux1AssignmentChanged          = m_vApplicationAux1AssignmentChanged;
	m_tVtClientCallbacks.fpvAux1Value                      = m_vApplicationAux1Value;
	m_tVtClientCallbacks.fpvAux2AssignmentChanged          = m_vApplicationAux2AssignmentChanged;
	m_tVtClientCallbacks.fpvAux2Value                      = m_vApplicationAux2Value;

	TEST_ASSERT(boIsoStackVtActivateClient( E_LOCAL_CF_1, &g_ctVtClientObjectPool, &m_tVtClientStorage, &m_tVtClientCallbacks));
}

void ApplicationRun(void)
{
//	if (!ClientConnected) {
//		//reset variables
//		setTempOld = 0;
//		actTempOld = 0;
//		return;
//	}
	
	
	
	if (OutputVarAS != InputVarAS) {
		// send number value to visu
		OutputVarAS = InputVarAS;
		TEST_ASSERT(eIsoStackVtQChangeNumericValue(E_LOCAL_CF_1, OutputVar, OutputVarAS, 0) == E_Q_COMMAND_RESULT_SUCCESS);
		
	}
	
//	if (setTemp != setTempOld) {
//		// send number value to visu
//		TEST_ASSERT(eIsoStackVtQChangeNumericValue(E_LOCAL_CF_1, nv_setTemp, setTemp, 0) == E_Q_COMMAND_RESULT_SUCCESS);
//		setTempOld = setTemp;
//	}

//	// do some logic ... actTemp will slowly follow setTemp
//	static INT loop;
//	if (++loop % 50 == 0) {
//		if (actTemp < setTemp) actTemp++;
//		if (actTemp > setTemp) actTemp--;
//	}
//
//	if (actTemp != actTempOld) {
//		// send number value to visu
//		TEST_ASSERT(eIsoStackVtQChangeNumericValue(E_LOCAL_CF_1, nv_actTemp, actTemp, 0) == E_Q_COMMAND_RESULT_SUCCESS);
//	
//		// send string value to visu
//		if (actTemp < 50) {
//			TEST_ASSERT(eIsoStackVtQChangeStringValue(E_LOCAL_CF_1, ops_StatusTextMain, "Temperature is low", 0) == E_Q_COMMAND_RESULT_SUCCESS);
//		} else {
//			TEST_ASSERT(eIsoStackVtQChangeStringValue(E_LOCAL_CF_1, ops_StatusTextMain, "Temperature is high", 0) == E_Q_COMMAND_RESULT_SUCCESS);
//		}
//		actTempOld = actTemp;
//	}
}

void ApplicationExit(void)
{
	TEST_ASSERT(boIsoStackVtDeactivateClient(E_LOCAL_CF_1));
	TEST_ASSERT(boIsoStackNwDeactivateLocalCf(E_LOCAL_CF_1));
}

void ApplicationSafetyNotification(INT eSafetyNotification)
{
}


