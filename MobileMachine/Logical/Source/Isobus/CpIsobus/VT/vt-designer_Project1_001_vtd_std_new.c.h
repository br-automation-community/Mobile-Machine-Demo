// Output from vt-designer (ISO 11783 mask designer, version 2.1.2, (C) 2008-2024 OSB connagtive GmbH, Hans-Fischer-Strasse 12, 80339 Munich, Germany)
// Do not change!

// A "HalTypedef.h" include file needs to be available that defines "ISO_OP_MEMORY_CLASS" to something like "" or "__huge" or alike as appropriate.
#include <HalTypedef.h>

#define btn_6000_Offset                                       1
#define btn_6001_Offset                                      20
#define btn_6002_Offset                                      39
#define btn_6003_Offset                                      58
#define btn_6000_2_Offset                                    79
#define btn_6001_2_Offset                                   100
#define btn_6001_3_Offset                                   119
#define btn_6003_2_Offset                                   138
#define btn_6002_2_Offset                                   157
#define InputField_Offset                                   176
#define TimeOutput_Offset                                   214
#define DateOutput_Offset                                   236
#define TimeOutput_2_Offset                                 265
#define DateOutput_2_Offset                                 287
#define HeaderOutputData_Offset                             316
#define TransportedWeightOutput_Offset                      345
#define OutputField_Offset                                  382
#define TransportetWeightVar_Offset                         411
#define rct_14000_Offset                                    440
#define rct_14000_2_Offset                                  453
#define rct_14000_3_Offset                                  466
#define rct_14000_3_2_Offset                                479
#define rct_14000_3_2_2_Offset                              492
#define pic_20000_Offset                                    505
#define pic_20001_Offset                                   6858
#define pic_20002_Offset                                  21423
#define pic_20003_Offset                                  29978
#define wsDesc6x8_Offset                                  39085
#define FontBig_Offset                                    39093
#define lna_24000_Offset                                  39101
#define fla_25000_Offset                                  39109
#define StdWorkingSet_Offset                              39117
#define SwitchToDataPage_Offset                           39133
#define SwitchToStartPage_Offset                          39146
#define StdActiveDataMask_Offset                          39159
#define Data_Offset                                       39221
#define InputVar_Offset                                   39307
#define OutputVar_Offset                                  39314
#define TransportedWeightVar_Offset                       39321
#define Time_2_Offset                                     39328
#define Normal_Offset                                     39345
#define DescriptionWS_Offset                              39353

#ifndef ISO_OP_MEMORY_CLASS
#define ISO_OP_MEMORY_CLASS
#endif

#define ISO_OP_ObjPool_Size_001_vtd_std_new  39385
extern const unsigned char ISO_OP_MEMORY_CLASS isoOP_ObjPool_001_vtd_std_new[];

#define ISO_OP_ObjPool_ObjectNumber_001_vtd_std_new  42
extern const unsigned long ISO_OP_MEMORY_CLASS isoOP_ObjPool_Offset_001_vtd_std_new[];
extern const unsigned long ISO_OP_MEMORY_CLASS isoOP_ObjPool_Offset_Id_001_vtd_std_new[];
#define ISO_OP_ObjPool_Scale_Offset_001_vtd_std_new  39345
#ifndef WTK_MG_COMMON_DEFS
#define WTK_MG_COMMON_DEFS

#define ID_NULL  0xFFFF

#define TYPEID_WORKSET      0
#define TYPEID_DATAMASK     1
#define TYPEID_ALARMMASK    2
#define TYPEID_CONTAINER    3
#define TYPEID_SKEYMASK     4
#define TYPEID_SOFTKEY      5
#define TYPEID_BUTTON       6
#define TYPEID_INBOOL       7
#define TYPEID_INSTR        8
#define TYPEID_INNUM        9
#define TYPEID_INLIST      10
#define TYPEID_OUTSTR      11
#define TYPEID_OUTNUM      12
#define TYPEID_OUTLINE     13
#define TYPEID_OUTRECT     14
#define TYPEID_OUTELLIPSE  15
#define TYPEID_OUTPOLY     16
#define TYPEID_OUTMETER    17
#define TYPEID_OUTLINBAR   18
#define TYPEID_OUTARCBAR   19
#define TYPEID_OUTPICT     20
#define TYPEID_VARNUM      21
#define TYPEID_VARSTR      22
#define TYPEID_FONTATTR    23
#define TYPEID_LINEATTR    24
#define TYPEID_FILLATTR    25
#define TYPEID_INPATTR     26
#define TYPEID_OBJPTR      27
#define TYPEID_MACRO       28
#define TYPEID_AUXFUNC     29
#define TYPEID_AUXINP      30
#define TYPEID_AUXFUNC2    31
#define TYPEID_AUXINP2     32
#define TYPEID_AUXASSIGN   33
#define TYPEID_AUXCTLDOP   34
#define TYPEID_COLOURMAP   35
#define TYPEID_GRAPHCOBJ   36
#define TYPEID_OUTLIST     37
#define TYPEID_EXTINATTR   38

#define EV_REFRESH          0
#define EV_ACT              1
#define EV_DEACT            2
#define EV_SHOW             3
#define EV_HIDE             4
#define EV_ENABLE           5
#define EV_DISABLE          6
#define EV_CHGACTMASK       7
#define EV_CHGSKEYMASK      8
#define EV_CHGATTR          9
#define EV_CHGBKCOLOR      10
#define EV_CHGFONTATTR     11
#define EV_CHGLINEATTR     12
#define EV_CHGFILLATTR     13
#define EV_CHGCHILDLOC     14
#define EV_CHGSIZE         15
#define EV_CHGVAL          16
#define EV_CHGPRIOR        17
#define EV_CHGENDPNT       18
#define EV_SELINPUT        19
#define EV_DESELINPUT      20
#define EV_ESC             21
#define EV_ENTERVAL        22
#define EV_ENTERCHGVAL     23
#define EV_KEYPRESS        24
#define EV_KEYRELEASE      25
#define EV_CHGCHILDPOS     26

#define CMD_HIDE_SHOW               160
#define CMD_ENABLE_DISABLE          161
#define CMD_SELECT_INPUT_OBJECT     162
#define CMD_CONTROL_AUDIO_DEVICE    163
#define CMD_SET_AUDIO_VOLUME        164
#define CMD_CHANGE_CHILD_LOCATION   165
#define CMD_CHANGE_SIZE             166
#define CMD_CHANGE_BACKGROUND_COLOR 167
#define CMD_CHANGE_NUMERIC_VALUE    168
#define CMD_CHANGE_END_POINT        169
#define CMD_CHANGE_FONT_ATTRIBUTES  170
#define CMD_CHANGE_LINE_ATTRIBUTES  171
#define CMD_CHANGE_FILL_ATTRIBUTES  172
#define CMD_CHANGE_ACTIVE_MASK      173
#define CMD_CHANGE_SOFT_KEY_MASK    174
#define CMD_CHANGE_ATTRIBUTE        175
#define CMD_CHANGE_PRIORITY         176
#define CMD_CHANGE_LIST_ITEM        177
#define CMD_CHANGE_STRING_VALUE     179
#define CMD_CHANGE_CHILD_POSITION   180

#define COLOR_BLACK     0
#define COLOR_WHITE     1
#define COLOR_GREEN     2
#define COLOR_TEAL      3
#define COLOR_MAROON    4
#define COLOR_PURPLE    5
#define COLOR_OLIVE     6
#define COLOR_SILVER    7
#define COLOR_GREY      8
#define COLOR_BLUE      9
#define COLOR_LIME     10
#define COLOR_CYAN     11
#define COLOR_RED      12
#define COLOR_MAGENTA  13
#define COLOR_YELLOW   14
#define COLOR_NAVY     15

#define FLOAT_1      0x00, 0x00, 0x80, 0x3F
#define FLOAT_10     0x00, 0x00, 0x20, 0x41
#define FLOAT_100    0x00, 0x00, 0xC8, 0x42
#define FLOAT_1000   0x00, 0x00, 0x7A, 0x44
#define FLOAT_0_1    0xCD, 0xCC, 0xCC, 0x3D
#define FLOAT_0_01   0x0A, 0xD7, 0x23, 0x3C
#define FLOAT_0_001  0x6F, 0x12, 0x83, 0x3A

#endif
