// *********************************************************************
//   IQRF HWPIDs                                                       *
// *********************************************************************
// Copyright (c) MICRORISC s.r.o.
//
// File:    $RCSfile: IQRF_HWPID.h,v $
// Version: $Revision: 1.179 $
// Date:    $Date: 2024/12/05 09:32:46 $
//
// Revision history:
//   2024/11/05  Release for DPA 4.32
//   2024/04/17  Release for DPA 4.31
//   2023/03/07  Release for DPA 4.30
//   2022/10/05  Release for DPA 4.18
//   2022/02/24  Release for DPA 4.17
//   2021/08/20  Release for DPA 4.16
//   2020/09/03  Release for DPA 4.15
//   2020/04/03  Release for DPA 4.14
//   2020/02/27  Release for DPA 4.13
//   2020/01/09  Release for DPA 4.12
//   2019/12/11  Release for DPA 4.11
//   2019/10/09  Release for DPA 4.10
//   2019/06/12  Release for DPA 4.03
//   2019/06/03  Release for DPA 4.02
//   2019/03/07  Release for DPA 4.01
//   2019/01/20  Release for DPA 4.00
//   2018/10/25  Release for DPA 3.03
//   2017/11/16  Release for DPA 3.02
//   2017/08/14  Release for DPA 3.01
//
// *********************************************************************

// Online DPA documentation https://doc.iqrf.org/DpaTechGuide/
// IQRF Standards documentation https://doc.iqrf.org/

#ifndef _IQRFSTD_HWPID_
#define _IQRFSTD_HWPID_

//# Class #1 #################################################################################
// Manufacturer: bits:0-9, bit.0=0, bit.3-9=[0000000] (even numbers, but not 0x000)
// Product: bits:10-15 (6 bits)
//############################################################################################
#ifdef __CC5X__
#define HWPID_CLS1(prod,man) \
#if prod < 0 || prod > 0x3F \
#error "HWPID_CLS1: invalid product number" \
#endif \
#if man <= 0 || man > 0x007 || ( man & 1 ) != 0 \
#error "HWPID_CLS1: invalid manufacturer number" \
#endif \
( (uns16)(man) | ( (uns16)(prod) << 10 ) )
#else
#define HWPID_CLS1(prod,man) ( (uns16)(man) | ( (uns16)(prod) << 10 ) )
#endif

// -------------------------------------------------------------------------------------------
// IQRF Tech s.r.o.
#define	HWPID_IQRF_TECH1	  0x002

// DDC-SE-01 sensor example
// (0002_DDC-SE01.c)
#define	HWPID_IQRF_TECH__DEMO_DDC_SE01				  HWPID_CLS1( 0x00, HWPID_IQRF_TECH1 ) // 0x0002

// DDC-SE-01 + DDC-RE-01 sensor example
// (0402_DDC-SE+RE.c)
#define	HWPID_IQRF_TECH__DEMO_DDC_SE01_RE01			  HWPID_CLS1( 0x01, HWPID_IQRF_TECH1 ) // 0x0402

// TR temperature sensor example
// (0802_TrThermometer.c)
#define	HWPID_IQRF_TECH__DEMO_TR_THERMOMETER		  HWPID_CLS1( 0x02, HWPID_IQRF_TECH1 ) // 0x0802

// Binary output example using LEDs and DDC-RE-01
// (0C02_BinaryOutput-Template.c)
#define	HWPID_IQRF_TECH__DEMO_BINARY_OUTPUT			  HWPID_CLS1( 0x03, HWPID_IQRF_TECH1 ) // 0x0C02

// Light example
// (1002_Light-Template.c)
#define	HWPID_IQRF_TECH__DEMO_LIGHT					  HWPID_CLS1( 0x04, HWPID_IQRF_TECH1 ) // 0x1002

// Sensor template
// (1402_Sensor-Template.c)
#define	HWPID_IQRF_TECH__DEMO_SENSOR_TEMPLATE		  HWPID_CLS1( 0x05, HWPID_IQRF_TECH1 ) // 0x1402

// ToDo Description DK-SW2-01
// ToDo (?.c)
#define	HWPID_IQRF_TECH__DK_SW2_01                    HWPID_CLS1( 0x06, HWPID_IQRF_TECH1 ) // 0x1802

// ToDo Description IQD-SW1-01
// ToDo (?.c)
#define	HWPID_IQRF_TECH__IQD_SW1_01                   HWPID_CLS1( 0x07, HWPID_IQRF_TECH1 ) // 0x1C02

// ToDo Description IQD-SW2-01
// ToDo (?.c)
#define	HWPID_IQRF_TECH__IQD_SW2_01                   HWPID_CLS1( 0x08, HWPID_IQRF_TECH1 ) // 0x2002

// ToDo Description IQD-RC3-01
// ToDo (?.c)
#define	HWPID_IQRF_TECH__IQD_RC3_01                   HWPID_CLS1( 0x09, HWPID_IQRF_TECH1 ) // 0x2402

// ToDo Description IQD-SM1
// ToDo (2802_IQD-SM1.c)
#define	HWPID_IQRF_TECH__IQD_SM1                      HWPID_CLS1( 0x0A, HWPID_IQRF_TECH1 ) // 0x2802

// ToDo Description IQD-RC4-01
// ToDo (?.c)
#define	HWPID_IQRF_TECH__RC4_01                       HWPID_CLS1( 0x0B, HWPID_IQRF_TECH1 ) // 0x2C02

// ToDo Description IQD-RC4-02
// ToDo (?.c)
#define	HWPID_IQRF_TECH__RC4_02                       HWPID_CLS1( 0x0C, HWPID_IQRF_TECH1 ) // 0x3002

// ToDo Description IQD-REP-01
// ToDo (?.c)
#define	HWPID_IQRF_TECH__REP_01                       HWPID_CLS1( 0x0D, HWPID_IQRF_TECH1 ) // 0x3402

// ToDo Description IQD-SW1-02
// ToDo (?.c)
#define	HWPID_IQRF_TECH__IQD_SW1_02                   HWPID_CLS1( 0x0F, HWPID_IQRF_TECH1 ) // 0x3C02

// DDC-SE-01 + DDC-RE-01 sensor + binary output example - LP version
// (4402_DDC-SE+RE_LP.c)
#define	HWPID_IQRF_TECH__DEMO_DDC_SE01_RE01_LP		  HWPID_CLS1( 0x11, HWPID_IQRF_TECH1 ) // 0x4402

// DDC-RE-01 binary output example - LP version
// (4802_DDC-RE_LP.c)
#define	HWPID_IQRF_TECH__DEMO_DDC_RE01_LP		      HWPID_CLS1( 0x12, HWPID_IQRF_TECH1 ) // 0x4802

// DDC-SE-01 sensor example - LP version
// (4C02_DDC-SE_LP.c)
#define	HWPID_IQRF_TECH__DEMO_DDC_SE01_LP		      HWPID_CLS1( 0x13, HWPID_IQRF_TECH1 ) // 0x4C02

//#define	?			  HWPID_CLS1( 0x14, HWPID_IQRF_TECH1 ) // 0x5002

//#define	?			  HWPID_CLS1( 0x15, HWPID_IQRF_TECH1 ) // 0x5402

// LIGHT_TEMPLATE
// (5802_LIGHT_TEMPLATE.c)
#define	HWPID_IQRF_TECH__LIGHT_TEMPLATE				  HWPID_CLS1( 0x16, HWPID_IQRF_TECH1 ) // 0x5802

// IQD-REP-03
// (5C02_P-IQD-REP-03.c)
#define	HWPID_IQRF_TECH__P_IQD_REP_03 				  HWPID_CLS1( 0x17, HWPID_IQRF_TECH1 ) // 0x5C02

// IQD_REP_02_W2D
// (6002_IQD_REP_02_W2D.c + IQD_REP_02_x1D)
#define	HWPID_IQRF_TECH__IQD_REP_02_W2D				  HWPID_CLS1( 0x18, HWPID_IQRF_TECH1 ) // 0x6002

// IQD_REP_02_S2D
// (6402_IQD_REP_02_S2D.c + IQD_REP_02_x1D)
#define	HWPID_IQRF_TECH__IQD_REP_02_S2D				  HWPID_CLS1( 0x19, HWPID_IQRF_TECH1 ) // 0x6402

// DDC-SE-01 + DDC-RE-01 sensor example G version
// (6802_DDC-SE+RE-G.c)
#define	HWPID_IQRF_TECH__DEMO_DDC_SE01_RE01_G		  HWPID_CLS1( 0x1A, HWPID_IQRF_TECH1 ) // 0x6802


// -------------------------------------------------------------------------------------------
// MICRORISC s.r.o.
#define	HWPID_MICRORISC	  0x004

// IQD_SE04
// (0004_IQD-SE04.c)
#define	HWPID_MICRORISC__IQD_SE04				  HWPID_CLS1( 0x00, HWPID_MICRORISC )     // 0x0004

// IQD-REP-04-1WA.c
// (0404-IQD-REP-04-1WA.c)
#define	HWPID_MICRORISC__IQD_REP_04_1WA			  HWPID_CLS1( 0x01, HWPID_MICRORISC )     // 0x0404

// IQD-DB1M-01
// (0804_IQD-DB1M-01.c)
#define	HWPID_MICRORISC__IQD_DB1M_01			  HWPID_CLS1( 0x02, HWPID_MICRORISC )     // 0x0804

// P-IQD-TEMP-01
// (0C04_P-IQD-TEMP-01.c)
#define	HWPID_MICRORISC__P_IQD_TEMP_01			  HWPID_CLS1( 0x03, HWPID_MICRORISC )     // 0x0C04

// IQD-TEMP-02 [MSp] - > Recyklovat
// (1004_IQD-TEMP-02.c)
#define	HWPID_MICRORISC__IQD_TEMP_02			  HWPID_CLS1( 0x04, HWPID_MICRORISC )     // 0x1004

// IQD-CNT-01
// (1404_IQD-CNT-01.c)
#define	HWPID_MICRORISC__IQD_CNT_01			      HWPID_CLS1( 0x05, HWPID_MICRORISC )     // 0x1404

// IQD-CNT-02 [MSp] - > Recyklovat
// (1804_IQD-CNT-02.c)
#define	HWPID_MICRORISC__IQD_CNT_02			      HWPID_CLS1( 0x06, HWPID_MICRORISC )     // 0x1804

// IQD-CNT1-01-T-E-01
// (1C04_IQD-CNT1-01-T-E-01.c)
#define HWPID_MICRORISC_IQD_CNT1_01_T_E_01        HWPID_CLS1( 0x07, HWPID_MICRORISC )     // 0x1C04

// IQD-CNT1-01-TH-I-01
// (2004_IQD-CNT1-01-TH-I-01.c)
#define HWPID_MICRORISC_IQD_CNT1_01_TH_I_01       HWPID_CLS1( 0x08, HWPID_MICRORISC )     // 0x2004

// IQD-CNT1-01-TH-F-01
// (2404_IQD-CNT1-01-TH-F-01.c)
#define HWPID_MICRORISC_IQD_CNT1_01_TH_F_01       HWPID_CLS1( 0x09, HWPID_MICRORISC )     // 0x2404

// IQD-REP-02-W1D
// (2804_IQD-REP-02-W1D.c)
#define HWPID_MICRORISC_IQD_REP_02_W1D            HWPID_CLS1( 0x0A, HWPID_MICRORISC )     // 0x2804

// IQD-REP-02-S1D
// (2C04_IQD-REP-02-S1D.c)
#define HWPID_MICRORISC_IQD_REP_02_S1D            HWPID_CLS1( 0x0B, HWPID_MICRORISC )     // 0x2C04

// KON-OPI-02
// (3004_KON-OPI-02.c)
#define HWPID_MICRORISC_KON_OPI_02                HWPID_CLS1( 0x0C, HWPID_MICRORISC )     // 0x3004

// IQD-SW1-06 [MSp] - > Recyklovat
// (3404_IQD-SW1-06.c)
#define HWPID_MICRORISC_IQD_SW1_06                HWPID_CLS1( 0x0D, HWPID_MICRORISC )     // 0x3404

// IQD-SE01-xxR
// (3804_IQD-SE01-xxR.c)
#define HWPID_MICRORISC_IQD_SE01_xxR              HWPID_CLS1( 0x0E, HWPID_MICRORISC )     // 0x3804

// IQD-SE01-xxRT
// (3C04_IQD-SE01-xxRT.c)
#define HWPID_MICRORISC_IQD_SE01_xxRT             HWPID_CLS1( 0x0F, HWPID_MICRORISC )     // 0x3C04

// IQD-SE01-xxVT	[MSp] - > Recyklovat
// (4004_IQD-SE01-xxVT.c)
#define HWPID_MICRORISC_IQD_SE01_xxVT             HWPID_CLS1( 0x10, HWPID_MICRORISC )     // 0x4004

// IQD-SE01-xxLT
// (4404_IQD-SE01-xxLT.c)
#define HWPID_MICRORISC_IQD_SE01_xxLT             HWPID_CLS1( 0x11, HWPID_MICRORISC )     // 0x4404

// IQD-SE03-xxFL
// (4804_IQD-SE03-xxFL.c)
#define HWPID_MICRORISC_IQD_SE03_05FL             HWPID_CLS1( 0x12, HWPID_MICRORISC )     // 0x4804

// IQD-SE03-xxLUX
// (4C04_IQD-SE03-xxLUX.c)
#define HWPID_MICRORISC_IQD_SE03_06LUX            HWPID_CLS1( 0x13, HWPID_MICRORISC )     // 0x4C04

// IQD-CNT2-02, Sensor teploty a vlhkosti, rozšíøená pøesnost, krabièka Italtronic [MSp] - > Recyklovat
// (5004_IQD_CNT2_02_TH.c)
#define HWPID_MICRORISC_IQD_CNT2_02_TH            HWPID_CLS1( 0x14, HWPID_MICRORISC )     // 0x5004

// IQD-SE01-xxI, Intensita osvìtlení pro detekci polohy žaluzií (v krabièce IQD-SM1)
// (5404_IQD_SE01_xxI.c)
#define HWPID_MICRORISC_IQD_SE01_xxI              HWPID_CLS1( 0x15, HWPID_MICRORISC )     // 0x5404

// IQD-SE03-04IR, Detekce polohy žaluzií, reflexní IR èidlo [MSp] - > Recyklovat
#define HWPID_MICRORISC_IQD_SE03_04IR             HWPID_CLS1( 0x16, HWPID_MICRORISC )     // 0x5804

// IQD-SE04-01PIR, Detekce pohybu, èidlo PIR
// (5C04_IQD-SE04-01PIR.c)
#define HWPID_MICRORISC_IQD_SE04_01PIR            HWPID_CLS1( 0x17, HWPID_MICRORISC )     // 0x5C04

// CHOR-IQ, Kouøový sensor
#define HWPID_MICRORISC_CHOR_IQ                   HWPID_CLS1( 0x18, HWPID_MICRORISC )     // 0x6004

// IQD-CNT-01-TH
// (6404_IQD-CNT-01-TH.c)
#define	HWPID_MICRORISC__IQD_CNT_01_TH		      HWPID_CLS1( 0x19, HWPID_MICRORISC )     // 0x6404

// P-IQD-SM2-T.c
// (6804_P_IQD_SM2_T.c)
#define	HWPID_MICRORISC__P_IQD_SM2_T		      HWPID_CLS1( 0x1A, HWPID_MICRORISC )     // 0x6804

// IQD-REP-04-1W.c
// (6C04_IQD_REP_04_1W.c)
#define	HWPID_MICRORISC__IQD_REP_04_1W 		      HWPID_CLS1( 0x1B, HWPID_MICRORISC )     // 0x6C04

// IQD-REP-02-S1D-T
// (7004_IQD-REP-02-S1D-T.c)
#define HWPID_MICRORISC_IQD_REP_02_S1D_T          HWPID_CLS1( 0x1C, HWPID_MICRORISC )     // 0x7004

// IQD-UPS01
// (7404_IQD_UPS01.c)
#define HWPID_MICRORISC_IQD_UPS01                 HWPID_CLS1( 0x1D, HWPID_MICRORISC )     // 0x7404

// IQD-LCZH-01 (formerly IQD-SL02)
// (7804_IQD-LCZH-01.c)
#define HWPID_MICRORISC_IQD_LCZH_01               HWPID_CLS1( 0x1E, HWPID_MICRORISC )     // 0x7804

// IQD-LCNE-01 (formerly IQD-SL01)
// (7C04_IQD-LCNE-01.c)
#define HWPID_MICRORISC_IQD_LCNE_01               HWPID_CLS1( 0x1F, HWPID_MICRORISC )     // 0x7C04

// IQD-SE01-14RT
// (8004_IQD-SE01-14RT.c)
#define HWPID_MICRORISC_IQD_SE01_14RT             HWPID_CLS1( 0x20, HWPID_MICRORISC )     // 0x8004

// IQD-SE02-0xRTH
// (8404_IQD-SE02-0xRTH.c)
#define HWPID_MICRORISC_IQD_SE02_0xRTH            HWPID_CLS1( 0x21, HWPID_MICRORISC )     // 0x8404

// IQD_SW10_01
// (8804_IQD_SW10_00.c)
#define HWPID_MICRORISC_IQD_SW10_00               HWPID_CLS1( 0x22, HWPID_MICRORISC )     // 0x8804

// KON-OPI-02 G version
// (8C04_KON-OPI-02-G.c)[MSp] - > Recyklovat
#define HWPID_MICRORISC_KON_OPI_02_G              HWPID_CLS1( 0x23, HWPID_MICRORISC )     // 0x8C04

// IQD_SE03_07T
// (9004_IQD_SE03_07T.c)
#define HWPID_MICRORISC_IQD_SE03_07T              HWPID_CLS1( 0x24, HWPID_MICRORISC )     // 0x9004

// IQD-REP-04-1S.c
// (9404_IQD_REP_04_1S.c)
#define	HWPID_MICRORISC__IQD_REP_04_1S 		      HWPID_CLS1( 0x25, HWPID_MICRORISC )     // 0x9404

// KONA-UPI-01
// (9804_KONA-UPI-01.c)
#define HWPID_MICRORISC_KONA_UPI_01               HWPID_CLS1( 0x26, HWPID_MICRORISC )     // 0x9804

// IQD-SE01-10VT
// (9C04_IQD_SE01_10VT.c)
#define HWPID_MICRORISC_IQD_SE01_10VT             HWPID_CLS1( 0x27, HWPID_MICRORISC )     // 0x9C04

// IQD-SE01-10LT
// (A004_IQD-SE01-10LT.c)
#define HWPID_MICRORISC_IQD_SE01_10LT             HWPID_CLS1( 0x28, HWPID_MICRORISC )     // 0xA004

// IQD-GW04
// (A404_IQD-GW04.c)
#define HWPID_MICRORISC_IQD_GW04                  HWPID_CLS1( 0x29, HWPID_MICRORISC )     // 0xA404

// IQD-PIR02-01
// (A804_IQD-PIR02-01.c)
#define HWPID_MICRORISC_IQD_PIR02_01              HWPID_CLS1( 0x2A, HWPID_MICRORISC )     // 0xA804

// IQD-PIR02-02
// (AC04_IQD-PIR02-02.c)
#define HWPID_MICRORISC_IQD_PIR02_02              HWPID_CLS1( 0x2B, HWPID_MICRORISC )     // 0xAC04

// KONA-RASP04
// (B004_KONA-RASP04.c)
#define HWPID_MICRORISC_KONA_RASP04               HWPID_CLS1( 0x2C, HWPID_MICRORISC )     // 0xB004

// IQD-PIR01-01
// (B404_IQD-PIR01-01.c)
#define HWPID_MICRORISC_IQD_PIR01_01              HWPID_CLS1( 0x2D, HWPID_MICRORISC )     // 0xB404

// IQD-SE02-04B
// (B804_IQD-SE02-04B.c)
#define HWPID_MICRORISC_IQD_SE02_04B              HWPID_CLS1( 0x2E, HWPID_MICRORISC )     // 0xB804

// IQD-SE02-05A
// (BC04_IQD-SE02-05A.c)
#define HWPID_MICRORISC_IQD_SE02_05A              HWPID_CLS1( 0x2F, HWPID_MICRORISC )     // 0xBC04

// IQD-LCZH-02-05A
// (C004_IQD-LCZH-02-05A.c)
#define HWPID_MICRORISC_IQD_LCZH_02_05A           HWPID_CLS1( 0x30, HWPID_MICRORISC )     // 0xC004

// IQD-LCZH-02-01A
// (C404_IQD-LCZH-02-01A.c)
#define HWPID_MICRORISC_IQD_LCZH_02_01A           HWPID_CLS1( 0x31, HWPID_MICRORISC )     // 0xC404

// IQD-LCZH-02-02B
// (C804_IQD-LCZH-02-02B.c)
#define HWPID_MICRORISC_IQD_LCZH_02_02B           HWPID_CLS1( 0x32, HWPID_MICRORISC )     // 0xC804

// IQD-LCZH-02-06B
// (CC04_IQD-LCZH-02-06B.c)
#define HWPID_MICRORISC_IQD_LCZH_02_06B           HWPID_CLS1( 0x33, HWPID_MICRORISC )     // 0xCC04

// IQHUBS-01
// (D004_IQHUBS-01.c)
#define HWPID_MICRORISC_IQHUBS_01                 HWPID_CLS1( 0x34, HWPID_MICRORISC )     // 0xD004

// IQD-GW04-02
// (D404_IQD-GW04-02.c)
#define HWPID_MICRORISC_IQD_GW04_02               HWPID_CLS1( 0x35, HWPID_MICRORISC )     // 0xD404

// IQD-REP-04-1SA.c
// (D804-IQD-REP-04-1SA.c)
#define	HWPID_MICRORISC__IQD_REP_04_1SA			  HWPID_CLS1( 0x36, HWPID_MICRORISC )     // 0xD804

// IQD-LCZH-02-03C
// (DC04_IQD-LCZH-02-03C.c)
#define HWPID_MICRORISC_IQD_LCZH_02_03C           HWPID_CLS1( 0x37, HWPID_MICRORISC )     // 0xDC04

// IQD-LCZH-02-04D
// (E004_IQD-LCZH-02-04D.c)
#define HWPID_MICRORISC_IQD_LCZH_02_04D           HWPID_CLS1( 0x38, HWPID_MICRORISC )     // 0xE004

// IQD-LCZH-02-07C
// (E404_IQD-LCZH-02-07C.c)
#define HWPID_MICRORISC_IQD_LCZH_02_07C           HWPID_CLS1( 0x39, HWPID_MICRORISC )     // 0xE404

// IQD-LCZH-02-08D
// (E804_IQD-LCZH-02-08D.c)
#define HWPID_MICRORISC_IQD_LCZH_02_08D           HWPID_CLS1( 0x3A, HWPID_MICRORISC )     // 0xE804

// IQD-DB1M-02A
// (EC04_IQD-DB1M-02A.c)
#define	HWPID_MICRORISC__IQD_DB1M_02A			  HWPID_CLS1( 0x3B, HWPID_MICRORISC )     // 0xEC04

// IQD-RC05-00A
// (F004_IQD-RC05-00A.c)
#define	HWPID_MICRORISC__IQD_RC05_00A			  HWPID_CLS1( 0x3C, HWPID_MICRORISC )     // 0xF004

// IQD-SE01-14RT
// (F404_IQD-SE01-14RT_A.c)
#define HWPID_MICRORISC_IQD_SE01_14RT_A           HWPID_CLS1( 0x3D, HWPID_MICRORISC )     // 0xF404

// GW-OFFGRID01
// (F804_GW-OFFGRID01.c)
#define HWPID_MICRORISC_GW_OFFGRID01              HWPID_CLS1( 0x3E, HWPID_MICRORISC )     // 0xF804

// IQD-SE02-07C
// (FC04_IQD-SE02-07C.c)
#define HWPID_MICRORISC_IQD_SE02_07C              HWPID_CLS1( 0x3F, HWPID_MICRORISC )     // 0xFC04

//# Class #2 #################################################################################
// Manufacturer: bits:0-11, bit.0=1, bit.5-11=[0000000] (odd numbers, never value 0x??F)
// Product: bits:12-15 (4 bits)
//############################################################################################
#ifdef __CC5X__
#define HWPID_CLS2(prod,man) \
#if prod < 0 || prod > 0xF \
#error "HWPID_CLS2: invalid product number" \
#endif \
#if man < 0 || man > 0x01F || ( man & 1 ) == 0 || ( man & 0xF ) == 0xF \
#error "HWPID_CLS2: invalid manufacturer number" \
#endif \
( (uns16)(man) | ( (uns16)(prod) << 12 ) )
#else
#define HWPID_CLS2(prod,man) ( (uns16)(man) | ( (uns16)(prod) << 12 ) )
#endif
// -------------------------------------------------------------------------------------------
// PROTRONIX s.r.o.
#define	HWPID_PROTRONIX	  0x001

// Temperature+Humidity+CO2 sensor
// (0001_Protronix-T+RH+CO2.c)
#define	HWPID_PROTRONIX__TEMP_HUM_CO2				  HWPID_CLS2( 0x0, HWPID_PROTRONIX ) // 0x0001

// Temperature+Humidity+VOC sensor
// (1001_Protronix-T+RH+VOC.c)
#define	HWPID_PROTRONIX__TEMP_HUM_VOC				  HWPID_CLS2( 0x1, HWPID_PROTRONIX ) // 0x1001

// 2001_Protronix__IL_PM40
#define	HWPID_PROTRONIX__IL_PM40			          HWPID_CLS2( 0x2, HWPID_PROTRONIX ) // 0x2001

// Temperature+Humidity sensor
// (3001_Protronix-T+RH.c)
#define	HWPID_PROTRONIX__TEMP_HUM					  HWPID_CLS2( 0x3, HWPID_PROTRONIX ) // 0x3001

// Temperature+Humidity+CO2 sensor [LP]
// (4001_Protronix-LP-T+RH+CO2.c)
#define	HWPID_PROTRONIX__LP_TEMP_HUM_CO2			  HWPID_CLS2( 0x4, HWPID_PROTRONIX ) // 0x4001

// Temperature+Humidity sensor [LP]
// (5001_Protronix-LP-T+RH.c)
#define	HWPID_PROTRONIX__LP_TEMP_HUM				  HWPID_CLS2( 0x5, HWPID_PROTRONIX ) // 0x5001

// PM 2,5 sensor [LP]
// (6001_Protronix-NLII_PM25.c)
#define	HWPID_PROTRONIX__NLII_PM25  				  HWPID_CLS2( 0x6, HWPID_PROTRONIX ) // 0x6001

// Temperature+Humidity+CO2 sensor Beaming
// (7001_Protronix-NLB-CO2+RH+T-Beaming.c)
#define	HWPID_PROTRONIX__NLB_CO2_R_T_Beaming          HWPID_CLS2( 0x7, HWPID_PROTRONIX ) // 0x7001

// TVOX+RH+T
#define	HWPID_PROTRONIX__NLII_TVOC_RH_T  			  HWPID_CLS2( 0x8, HWPID_PROTRONIX ) // 0x8001

// NOX
#define	HWPID_PROTRONIX__NLII_NOX  				      HWPID_CLS2( 0x9, HWPID_PROTRONIX ) // 0x9001

// OL-NOX-IQRF
#define	HWPID_PROTRONIX__OL_NOX_IQRF  			      HWPID_CLS2( 0xA, HWPID_PROTRONIX ) // 0xA001

// NLII-CO2+TVOC-5-IQRF
#define	HWPID_PROTRONIX__NLII_CO2_TVOC_5_IQRF		  HWPID_CLS2( 0xB, HWPID_PROTRONIX ) // 0xB001

// Temperature+Humidity+TVOC-PC01
// (C001_Protronix-T+RH+TVOC-PC01.c)
#define HWPID_PROTRONIX__TEMP_HUM_TVOC_PC01           HWPID_CLS2( 0xC, HWPID_PROTRONIX ) // 0xC001

// PM 2,5 sensor-PC01
// (D001_Protronix-NLII_PM25-PC01.c)
#define HWPID_PROTRONIX__NLII_PM25_PC01               HWPID_CLS2( 0xD, HWPID_PROTRONIX ) // 0xD001

// NLB-RH+T-Beaming
// (E001_Protronix-NLB-RH+T-Beaming.c)
#define HWPID_PROTRONIX__NLB_RH_T_Beaming             HWPID_CLS2( 0xE, HWPID_PROTRONIX ) // 0xE001

// ADS-RN
#define HWPID_PROTRONIX__ADS_RN                       HWPID_CLS2( 0xF, HWPID_PROTRONIX ) // 0xF001

// -------------------------------------------------------------------------------------------
// NETIO products a.s.
#define	HWPID_NETIO		  0x003

// Cobra 1 - 1x power plug
// (0003_Netio-Cobra1.c)
#define	HWPID_NETIO__COBRA1							  HWPID_CLS2( 0x0, HWPID_NETIO )	 // 0x0003

// Cobra 1 - 1x power plug [LP]
// (1003_Netio-LP-Cobra1.c)
#define	HWPID_NETIO__LP_COBRA1						  HWPID_CLS2( 0x1, HWPID_NETIO )	 // 0x1003

// -------------------------------------------------------------------------------------------
// DATmoLUX a.s.
#define	HWPID_DATMOLUX	  0x005

// DATmoLUX Light
// 0005_DATmoLUX-Light.*
#define	HWPID_DATMOLUX__LIGHT						  HWPID_CLS2( 0x0, HWPID_DATMOLUX )	 // 0x0005

// -------------------------------------------------------------------------------------------
// CITIQ s.r.o.
#define	HWPID_CITIQ		  0x007

// -------------------------------------------------------------------------------------------
// Austyn International s.r.o.
#define	HWPID_AUSTYN	  0x009

// Room temperature controller
// (0009_RoomTemperatureController.c)
#define	HWPID_AUSTYN__ROOM_CONTROLLER				  HWPID_CLS2( 0x0, HWPID_AUSTYN )	 // 0x0009

// Austyn repeater for radiator heads
// (1009_RepHlaAust-02.c)
#define	HWPID_AUSTYN__RepHlaAust_02                   HWPID_CLS2( 0x1, HWPID_AUSTYN )	 // 0x1009

// Austyn radiator head
// (2009_HlaAust-02.c)
#define	HWPID_AUSTYN__HlaAust_02		              HWPID_CLS2( 0x2, HWPID_AUSTYN )	 // 0x2009

// Austyn repeater for radiator heads + SET01
// (3009_RepHlaAust-02-T.c)
#define	HWPID_AUSTYN__RepHlaAust_02_T                 HWPID_CLS2( 0x3, HWPID_AUSTYN )	 // 0x3009

// Austyn repeater for radiator heads, new version + TR-G
// (4009_IQD-REP-04-05C.c)
#define	HWPID_AUSTYN__IQD_REP_04_05C                  HWPID_CLS2( 0x4, HWPID_AUSTYN )	 // 0x4009

// Austyn repeater for radiator heads, new version + TR-G, no temperature sensor
// (5009_IQD-REP-04-03D.c)
#define	HWPID_AUSTYN__IQD_REP_04_03D                  HWPID_CLS2( 0x5, HWPID_AUSTYN )	 // 0x5009

// Austyn radiator head with G module (added by MŠp)
// (6009_HlaAust-02.c)
#define	HWPID_AUSTYN__HLA-AUST02-02A	              HWPID_CLS2( 0x6, HWPID_AUSTYN )	 // 0x6009

// -------------------------------------------------------------------------------------------
// Aledo s.r.o.
#define	HWPID_ALEDO		  0x00B

// Room temperature controller
// (000B_Aledo-Reader_R02A230.c)
#define	HWPID_ALEDO__READER_R02A230					  HWPID_CLS2( 0x0, HWPID_ALEDO )	 // 0x000B

// -------------------------------------------------------------------------------------------
// SANELA spol. s r. o.
#define	HWPID_SANELA	  0x00D

// Sanela SL626 Person presence sensor
// (000D_Sanela-SL626.c)
#define	HWPID_SANELA__SL626							  HWPID_CLS2( 0x0, HWPID_SANELA )	 // 0x000D

// Sanela SL626A sink sensor
// (100D_Sanela-SL626A.c)
#define	HWPID_SANELA__SL626A					      HWPID_CLS2( 0x1, HWPID_SANELA )	 // 0x100D

// -------------------------------------------------------------------------------------------
// TESLA Blatná, a.s.
#define	HWPID_TESLA_BLATNA  0x011

// TESLA Blatná Smart City environmental module
// (0011_TESLA_Blatna-EnvironmentalModule.c)
#define	HWPID_TESLA_BLATNA__EnvironmentalModule		  HWPID_CLS2( 0x0, HWPID_TESLA_BLATNA )	 // 0x0011

// -------------------------------------------------------------------------------------------
// JoTio Tech s.r.o.
#define	HWPID_JOTIO_TECH  0x013

// IRIS
#define	HWPID_JOTIO_TECH__IRIS              		  HWPID_CLS2( 0x0, HWPID_JOTIO_TECH )	 // 0x0013

// ALTAIR
#define	HWPID_JOTIO_TECH__ALTAIR            		  HWPID_CLS2( 0x1, HWPID_JOTIO_TECH )	 // 0x1013

// -------------------------------------------------------------------------------------------
// HARDWARIO s.r.o. (BigClown)
#define	HWPID_HARDWARIO  0x015

// Presence sensor
#define	HWPID_HARDWARIO_PRESENCE_SENSOR		          HWPID_CLS2( 0x0, HWPID_HARDWARIO )	 // 0x0015

// COOPER
// (1015_HARDWARIO-COPPER.c)
#define	HWPID_HARDWARIO_COOPER      		          HWPID_CLS2( 0x1, HWPID_HARDWARIO )	 // 0x1015

// -------------------------------------------------------------------------------------------
// 4IOTECH s.r.o.
#define	HWPID_4IOTECH  0x017

// 4IOT-SEN-01
#define	HWPID_4IOTECH_4IOT_SEN_01    		          HWPID_CLS2( 0x0, HWPID_4IOTECH )	     // 0x0017

// -------------------------------------------------------------------------------------------
// Liteplan Ltd.
#define	HWPID_LITEPLAN  0x019

// IQD-DALI-01
#define	HWPID_LITEPLAN_IQD_DALI_01    		          HWPID_CLS2( 0x0, HWPID_LITEPLAN )	     // 0x0019

// -------------------------------------------------------------------------------------------
// Danlers https://www.danlers.co.uk/
#define	HWPID_DANLERS  0x01B

// DANLERS-PIR
// (001B_DANLERS-PIR.c)
#define	HWPID_DANLERS_PIR              		          HWPID_CLS2( 0x0, HWPID_DANLERS )	     // 0x001B

//# Class #3 #################################################################################
// Manufacturer: bits:0-11, bit.0=0, bit.3-9 != [0000000] (even numbers, but not 0x000)
// Product: bits:12-15 (4 bits)
//############################################################################################
#ifdef __CC5X__
#define HWPID_CLS3(prod,man) \
#if prod < 0 || prod > 0xF \
#error "HWPID_CLS3: invalid product number" \
#endif \
#if man <= 0 || man > 0xFFF || ( man & 0x3F8 ) == 0 || ( man & 1 ) != 0 \
#error "HWPID_CLS3: invalid manufacturer number" \
#endif \
( (uns16)(man) | ( (uns16)(prod) << 12 ) )
#else
#define HWPID_CLS3(prod,man) ( (uns16)(man) | ( (uns16)(prod) << 12 ) )
#endif

// -------------------------------------------------------------------------------------------
// IQRF Tech s.r.o.
#define	HWPID_IQRF_TECH3	  0x05E
// For the fixed HWPID=C05E used by a special handler

// (CustomDpaHandler-ChangeIQRFOS.c)
#define	HWPID_IQRF_TECH_ChangeIQRFOS   		          HWPID_CLS3( 0xC, HWPID_IQRF_TECH3 ) // 0xC05E

//# Class #4 #################################################################################
// Manufacturer: bits:0-13, bit.0=1, bit.5-11 != [0000000] (odd numbers, never value 0x??F)
// Product: bits:14-15 (2 bits)
//############################################################################################
#ifdef __CC5X__
#define HWPID_CLS4(prod,man) \
#if prod < 0 || prod > 0x3 \
#error "HWPID_CLS4: invalid product number" \
#endif \
#if man < 0 || man > 0x3FFF || ( man & 1 ) == 0  || ( man & 0xFE0 ) == 0 || ( man & 0xF ) == 0xF \
#error "HWPID_CLS4: invalid manufacturer number" \
#endif \
( (uns16)(man) | ( (uns16)(prod) << 14 ) )
#else
#define HWPID_CLS4(prod,man) ( (uns16)(man) | ( (uns16)(prod) << 14 ) )
#endif

// -------------------------------------------------------------------------------------------

//############################################################################################
#endif	// _IQRFSTD_HWPID_
//############################################################################################
