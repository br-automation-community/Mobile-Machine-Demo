// Output from vt-designer (ISO 11783 mask designer, version 2.0.1, (C) 2008-2023 OSB connagtive GmbH, Hans-Fischer-Strasse 12, 80339 Munich, Germany)

#include "Sales_demo.main.h"
#include "Sales_demo_vtd_std_new.c.h"
#include <IsoStackCore_types.h>

static const TVtClientCondPoolPart m_catVtClientCondPoolParts[] = {
    { ISO_POOL_VERSION_vtd_std_new, LANGUAGE_CODE_ALL_LANGUAGES, { isoOP_ObjPool_vtd_std_new, ISO_OP_ObjPool_Size_vtd_std_new, 0, ISO_OP_ObjPool_Scale_Offset_vtd_std_new } },
    { 0, 0, { NULL, 0, 0, 0 } } };

const TVtClientObjectPool g_ctVtClientObjectPool = {
    ISO_VERSION_LABEL,
    E_REG_POOL_MODE_MASTER_TO_ANY_VT,
    ISO_MASK_SIZE,
    ISO_DESIGNATOR_WIDTH,
    ISO_DESIGNATOR_HEIGHT,
#if ((ISOAGLIBSE_VERSION_MAJOR > 1U) || ((ISOAGLIBSE_VERSION_MAJOR == 1U) && (ISOAGLIBSE_VERSION_MINOR >= 6U)))
    m_catVtClientCondPoolParts,
    0U };
#else
    m_catVtClientCondPoolParts };
#endif
