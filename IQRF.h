// *********************************************************************
//                     IQRF OS basic include file                      *
// *********************************************************************
//
// Online IQRF OS Reference Guide: http://www.iqrf.org/IQRF-OS-Reference-guide/
//
// Copyright (c) MICRORISC s.r.o.
//
// Intended for:
//   HW: TR-72D, TR-76D, TR-77D, TR-78D, TR-75D, TR-72G, TR-76G, TR-75G, TR-82G
//   OS: 4.06D, 4.06G
//
// File:    IQRF.h
// Version: v1.00                                   Revision: 03/06/2022
//
// Revision history:
//   v1.00: 03/06/2022  First release for OS 4.06D and 4.06G.
//
// *********************************************************************

#if IQRFOS != 406
    #error Invalid IQRF OS version, v4.06D or v4.06G is expected. Make sure matching header files and project IQRF OS version setting are used.
#endif

#if __CC5X__ < 3701
    #warning Insufficient CC5X compiler version, V3.7A or higher is recommended.
#endif

#define OS_VERSION 0x46

#if defined TR72D
    #message Compilation for TR-72D modules (PIC16LF1938) and IQRF OS 4.06D.
    #define TR7xD
#elif defined TR76D
    #message Compilation for TR-76D modules (PIC16LF1938) and IQRF OS 4.06D.
    #define TR7xD
#elif defined TR77D
    #message Compilation for TR-77D modules (PIC16LF1938) and IQRF OS 4.06D.
    #define TR7xD
#elif defined TR78D
    #message Compilation for TR-78D modules (PIC16LF1938) and IQRF OS 4.06D.
    #define TR7xD
#elif defined TR75D
    #message Compilation for TR-75D modules (PIC16LF1938) and IQRF OS 4.06D.
    #define TR7xD
#elif defined TR72G
    #message Compilation for TR-72G modules (PIC16LF18877) and IQRF OS 4.06G.
    #define TR7xG
#elif defined TR76G
    #message Compilation for TR-76G modules (PIC16LF18877) and IQRF OS 4.06G.
    #define TR7xG
#elif defined TR75G
    #message Compilation for TR-75G modules (PIC16LF18877) and IQRF OS 4.06G.
    #define TR7xG
#elif defined TR82G
    #message Compilation for TR-82G modules (PIC16LF18877) and IQRF OS 4.06G.
    #define TR8xG
#else
    #error Unsupported TR module type.
#endif

// TR-7xD
#if defined TR7xD
    #if _16LF1938 != 1
        #pragma chip      PIC16LF1938
    #endif
    
    #define MCU_ID    4
    #define TR_FAMILY 1 // TR-7xD

    #define _ACKDT    ACKDT
    #define _ACKEN    ACKEN
    #define _ACKSTAT  ACKSTAT
    #define _BAUDCON  BAUDCON
    #define _BF       BF
    #define _CKE      CKE
    #define _DACCON0  DACCON0
    #define _DACCON1  DACCON1
    #define _EEADRH   EEADRH
    #define _EEADRL   EEADRL
    #define _EECON1   EECON1
    #define _EECON2   EECON2
    #define _EEDATH   EEDATH
    #define _EEDATL   EEDATL
    #define _GO       GO
    #define _PEN      PEN
    #define _PR6      PR6
    #define _RCEN     RCEN
    #define _RCREG    RCREG
    #define _RCSTA    RCSTA
    #define _RW_      RW_
    #define _SEN      SEN
    #define _SMP      SMP
    #define _SPBRGH   SPBRGH
    #define _SPBRGL   SPBRGL
    #define _SSPADD   SSPADD
    #define _SSPBUF   SSPBUF
    #define _SSPCON1  SSPCON1
    #define _SSPCON2  SSPCON2
    #define _SSPIF    SSPIF
    #define _SSPEN    SSPEN
    #define _SSPSTAT  SSPSTAT
    #define _SWDTEN   SWDTEN
    #define _T1SYNC_  T1SYNC_
    #define _TMR1ON   TMR1ON
    #define _TMR6     TMR6
    #define _TMR6ON   TMR6ON
    #define _TXREG    TXREG
    #define _TXSTA    TXSTA
    #define _WDTCON   WDTCON

// TR-7xG, TR-8xG
#elif defined TR7xG || defined TR8xG
    #if _16LF18877 != 1
        #pragma chip      PIC16LF18877
    #endif
    
    #define MCU_ID    5
    
    #if defined TR7xG
        #define TR_FAMILY 2 // TR-7xG
    #else
        #define TR_FAMILY 3 // TR-8xG
    #endif

    #define _ACKDT    SSP1CON2.5
    #define _ACKEN    SSP1CON2.4
    #define _ACKSTAT  SSP1CON2.6
    #define _BAUDCON  BAUD1CON
    #define _BF       SSP1STAT.0
    #define _CKE      SSP1STAT.6
    #define _DACCON0  DAC1CON0
    #define _DACCON1  DAC1CON1
    #define _EEADRH   NVMADRH
    #define _EEADRL   NVMADRL
    #define _EECON1   NVMCON1
    #define _EECON2   NVMCON2
    #define _EEDATH   NVMDATH
    #define _EEDATL   NVMDATL
    #define _GO       ADGO
    #define _PEN      SSP1CON2.2
    #define _PR6      T6PR
    #define _RCEN     SSP1CON2.3
    #define _RCREG    RC1REG
    #define _RCSTA    RC1STA
    #define _RW_      SSP1STAT.2
    #define _SEN      SSP1CON2.0
    #define _SMP      SSP1STAT.7
    #define _SPBRGH   SP1BRGH
    #define _SPBRGL   SP1BRGL
    #define _SSPADD   SSP1ADD
    #define _SSPBUF   SSP1BUF
    #define _SSPCON1  SSP1CON1
    #define _SSPCON2  SSP1CON2
    #define _SSPIF    SSP1IF
    #define _SSPEN    SSP1CON1.5
    #define _SSPSTAT  SSP1STAT
    #define _SWDTEN   WDTCON0.0
    #define _T1SYNC_  T1CON.2
    #define _TMR1ON   T1CON.0
    #define _TMR6     T6TMR
    #define _TMR6ON   T6CON.7
    #define _TXREG    TX1REG
    #define _TXSTA    TX1STA
    #define _WDTCON   WDTCON0
#else
    #error Unsupported TR module family.
#endif

#pragma origin 0x100
#pragma update_RP 0

void APPLICATION();

void main()                                 // Skipped during Upload
{
    APPLICATION();
}

#include "IQRF-memory.h"                    // Memory definitions
#include "IQRF-functions.h"                 // Functions definitions
#include "IQRF-macros.h"

// *********************************************************************

