
; CC5X Version 3.8A, Copyright (c) B Knudsen Data
; C compiler for the PICmicro family
; ************  22. Jan 2025  16:58  *************

        processor  16LF18877
        radix  DEC


        GOTO main

  ; FILE C:\customdpa\IQRF.h
                        ;// *********************************************************************
                        ;//                     IQRF OS basic include file                      *
                        ;// *********************************************************************
                        ;//
                        ;// Online IQRF OS Reference Guide: http://www.iqrf.org/IQRF-OS-Reference-guide/
                        ;//
                        ;// Copyright (c) MICRORISC s.r.o.
                        ;//
                        ;// Intended for:
                        ;//   HW: TR-72D, TR-76D, TR-77D, TR-78D, TR-75D, TR-72G, TR-76G, TR-75G, TR-82G
                        ;//   OS: 4.06D, 4.06G
                        ;//
                        ;// File:    IQRF.h
                        ;// Version: v1.00                                   Revision: 03/06/2022
                        ;//
                        ;// Revision history:
                        ;//   v1.00: 03/06/2022  First release for OS 4.06D and 4.06G.
                        ;//
                        ;// *********************************************************************
                        ;
                        ;#if IQRFOS != 406
                        ;    #error Invalid IQRF OS version, v4.06D or v4.06G is expected. Make sure matching header files and project IQRF OS version setting are used.
                        ;#endif
                        ;
                        ;#if __CC5X__ < 3701
                        ;    #warning Insufficient CC5X compiler version, V3.7A or higher is recommended.
                        ;#endif
                        ;
                        ;#define OS_VERSION 0x46
                        ;
                        ;#if defined TR72D
                        ;    #message Compilation for TR-72D modules (PIC16LF1938) and IQRF OS 4.06D.
                        ;    #define TR7xD
                        ;#elif defined TR76D
                        ;    #message Compilation for TR-76D modules (PIC16LF1938) and IQRF OS 4.06D.
                        ;    #define TR7xD
                        ;#elif defined TR77D
                        ;    #message Compilation for TR-77D modules (PIC16LF1938) and IQRF OS 4.06D.
                        ;    #define TR7xD
                        ;#elif defined TR78D
                        ;    #message Compilation for TR-78D modules (PIC16LF1938) and IQRF OS 4.06D.
                        ;    #define TR7xD
                        ;#elif defined TR75D
                        ;    #message Compilation for TR-75D modules (PIC16LF1938) and IQRF OS 4.06D.
                        ;    #define TR7xD
                        ;#elif defined TR72G
                        ;    #message Compilation for TR-72G modules (PIC16LF18877) and IQRF OS 4.06G.
                        ;    #define TR7xG
                        ;#elif defined TR76G
                        ;    #message Compilation for TR-76G modules (PIC16LF18877) and IQRF OS 4.06G.
                        ;    #define TR7xG
                        ;#elif defined TR75G
                        ;    #message Compilation for TR-75G modules (PIC16LF18877) and IQRF OS 4.06G.
                        ;    #define TR7xG
                        ;#elif defined TR82G
                        ;    #message Compilation for TR-82G modules (PIC16LF18877) and IQRF OS 4.06G.
                        ;    #define TR8xG
                        ;#else
                        ;    #error Unsupported TR module type.
                        ;#endif
                        ;
                        ;// TR-7xD
                        ;#if defined TR7xD
                        ;    #if _16LF1938 != 1
                        ;        #pragma chip      PIC16LF1938
                        ;    #endif
                        ;    
                        ;    #define MCU_ID    4
                        ;    #define TR_FAMILY 1 // TR-7xD
                        ;
                        ;    #define _ACKDT    ACKDT
                        ;    #define _ACKEN    ACKEN
                        ;    #define _ACKSTAT  ACKSTAT
                        ;    #define _BAUDCON  BAUDCON
                        ;    #define _BF       BF
                        ;    #define _CKE      CKE
                        ;    #define _DACCON0  DACCON0
                        ;    #define _DACCON1  DACCON1
                        ;    #define _EEADRH   EEADRH
                        ;    #define _EEADRL   EEADRL
                        ;    #define _EECON1   EECON1
                        ;    #define _EECON2   EECON2
                        ;    #define _EEDATH   EEDATH
                        ;    #define _EEDATL   EEDATL
                        ;    #define _GO       GO
                        ;    #define _PEN      PEN
                        ;    #define _PR6      PR6
                        ;    #define _RCEN     RCEN
                        ;    #define _RCREG    RCREG
                        ;    #define _RCSTA    RCSTA
                        ;    #define _RW_      RW_
                        ;    #define _SEN      SEN
                        ;    #define _SMP      SMP
                        ;    #define _SPBRGH   SPBRGH
                        ;    #define _SPBRGL   SPBRGL
                        ;    #define _SSPADD   SSPADD
                        ;    #define _SSPBUF   SSPBUF
                        ;    #define _SSPCON1  SSPCON1
                        ;    #define _SSPCON2  SSPCON2
                        ;    #define _SSPIF    SSPIF
                        ;    #define _SSPEN    SSPEN
                        ;    #define _SSPSTAT  SSPSTAT
                        ;    #define _SWDTEN   SWDTEN
                        ;    #define _T1SYNC_  T1SYNC_
                        ;    #define _TMR1ON   TMR1ON
                        ;    #define _TMR6     TMR6
                        ;    #define _TMR6ON   TMR6ON
                        ;    #define _TXREG    TXREG
                        ;    #define _TXSTA    TXSTA
                        ;    #define _WDTCON   WDTCON
                        ;
                        ;// TR-7xG, TR-8xG
                        ;#elif defined TR7xG || defined TR8xG
                        ;    #if _16LF18877 != 1
                        ;        #pragma chip      PIC16LF18877
                        ;    #endif
                        ;    
                        ;    #define MCU_ID    5
                        ;    
                        ;    #if defined TR7xG
                        ;        #define TR_FAMILY 2 // TR-7xG
                        ;    #else
                        ;        #define TR_FAMILY 3 // TR-8xG
                        ;    #endif
                        ;
                        ;    #define _ACKDT    SSP1CON2.5
                        ;    #define _ACKEN    SSP1CON2.4
                        ;    #define _ACKSTAT  SSP1CON2.6
                        ;    #define _BAUDCON  BAUD1CON
                        ;    #define _BF       SSP1STAT.0
                        ;    #define _CKE      SSP1STAT.6
                        ;    #define _DACCON0  DAC1CON0
                        ;    #define _DACCON1  DAC1CON1
                        ;    #define _EEADRH   NVMADRH
                        ;    #define _EEADRL   NVMADRL
                        ;    #define _EECON1   NVMCON1
                        ;    #define _EECON2   NVMCON2
                        ;    #define _EEDATH   NVMDATH
                        ;    #define _EEDATL   NVMDATL
                        ;    #define _GO       ADGO
                        ;    #define _PEN      SSP1CON2.2
                        ;    #define _PR6      T6PR
                        ;    #define _RCEN     SSP1CON2.3
                        ;    #define _RCREG    RC1REG
                        ;    #define _RCSTA    RC1STA
                        ;    #define _RW_      SSP1STAT.2
                        ;    #define _SEN      SSP1CON2.0
                        ;    #define _SMP      SSP1STAT.7
                        ;    #define _SPBRGH   SP1BRGH
                        ;    #define _SPBRGL   SP1BRGL
                        ;    #define _SSPADD   SSP1ADD
                        ;    #define _SSPBUF   SSP1BUF
                        ;    #define _SSPCON1  SSP1CON1
                        ;    #define _SSPCON2  SSP1CON2
                        ;    #define _SSPIF    SSP1IF
                        ;    #define _SSPEN    SSP1CON1.5
                        ;    #define _SSPSTAT  SSP1STAT
                        ;    #define _SWDTEN   WDTCON0.0
                        ;    #define _T1SYNC_  T1CON.2
                        ;    #define _TMR1ON   T1CON.0
                        ;    #define _TMR6     T6TMR
                        ;    #define _TMR6ON   T6CON.7
                        ;    #define _TXREG    TX1REG
                        ;    #define _TXSTA    TX1STA
                        ;    #define _WDTCON   WDTCON0
                        ;#else
                        ;    #error Unsupported TR module family.
                        ;#endif
                        ;
                        ;#pragma origin 0x100
        ORG 0x0100
                        ;#pragma update_RP 0
                        ;
                        ;void APPLICATION();
                        ;
                        ;void main()                                 // Skipped during Upload
                        ;{
main
                        ;    APPLICATION();
        MOVLP 0x38
        CALL  APPLICATION
        MOVLP 0x00
                        ;}
        SLEEP
        GOTO main

  ; FILE C:\customdpa\IQRF-functions.h
                        ;// *********************************************************************
                        ;//                         IQRF OS functions                           *
                        ;// *********************************************************************
                        ;//
                        ;// Online IQRF OS Reference Guide: http://www.iqrf.org/IQRF-OS-Reference-guide/
                        ;//
                        ;// Copyright (c) MICRORISC s.r.o.
                        ;//
                        ;// Intended for:
                        ;//   HW: TR-72D, TR-76D, TR-77D, TR-78D, TR-75D, TR-72G, TR-76G, TR-75G, TR-82G
                        ;//   OS: 4.06D, 4.06G
                        ;//
                        ;// File:    IQRF-functions.h
                        ;// Version: v1.01                                   Revision: 05/12/2024
                        ;//
                        ;// Revision history:
                        ;//   v1.01: 05/12/2024  The return value of the wasRFICrestarted function is different for TR-7xD and TR-7xG module lines.
                        ;//   v1.00: 03/06/2022  First release for OS 4.06D and 4.06G.
                        ;//
                        ;// *********************************************************************
                        ;
                        ;#pragma optimize 0
                        ;#pragma update_PAGE 0
                        ;#pragma update_RP 0
                        ;
                        ;// Identification header for internal use only
                        ;#pragma cdata[0x3800] = OS_VERSION /* OS Version */, MCU_ID /* MCU ID */, TR_FAMILY | 0x80 /*TR Family*/
                        ;
                        ;#define dummy_address   0x3810
                        ;#pragma origin dummy_address
        ORG 0x3810
                        ;void dummy()
                        ;{
dummy
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define iqrfSleep_address   0x3816
                        ;#pragma origin iqrfSleep_address
        ORG 0x3816
                        ;void iqrfSleep()
                        ;{
iqrfSleep
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define _debug_address  0x3819
                        ;#pragma origin _debug_address
        ORG 0x3819
                        ;void _debug()
                        ;{
_debug
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define debug()     \
                        ;    do {            \
                        ;        _debug();   \
                        ;        nop();      \
                        ;    } while (0)
                        ;
                        ;#define moduleInfo_address  0x381c
                        ;#pragma origin moduleInfo_address
        ORG 0x381C
                        ;void moduleInfo()
                        ;{
moduleInfo
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define pulsingLEDR_address 0x3822
                        ;#pragma origin pulsingLEDR_address
        ORG 0x3822
                        ;void pulsingLEDR()
                        ;{
pulsingLEDR
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define pulseLEDR_address   0x3825
                        ;#pragma origin pulseLEDR_address
        ORG 0x3825
                        ;void pulseLEDR()
                        ;{
pulseLEDR
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define stopLEDR_address    0x3828
                        ;#pragma origin stopLEDR_address
        ORG 0x3828
                        ;void stopLEDR()
                        ;{
stopLEDR
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define pulsingLEDG_address 0x382b
                        ;#pragma origin pulsingLEDG_address
        ORG 0x382B
                        ;void pulsingLEDG()
                        ;{
pulsingLEDG
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define pulseLEDG_address   0x382e
                        ;#pragma origin pulseLEDG_address
        ORG 0x382E
                        ;void pulseLEDG()
                        ;{
pulseLEDG
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define stopLEDG_address    0x3831
                        ;#pragma origin stopLEDG_address
        ORG 0x3831
                        ;void stopLEDG()
                        ;{
stopLEDG
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setOnPulsingLED_address 0x3834
                        ;#pragma origin setOnPulsingLED_address
        ORG 0x3834
                        ;void setOnPulsingLED(uns8 ticks @ W)
                        ;{
setOnPulsingLED
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setOffPulsingLED_address    0x3837
                        ;#pragma origin setOffPulsingLED_address
        ORG 0x3837
                        ;void setOffPulsingLED(uns8 ticks @ W)
                        ;{
setOffPulsingLED
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define eeReadByte_address  0x383a
                        ;#pragma origin eeReadByte_address
        ORG 0x383A
                        ;uns8 eeReadByte(uns8 address @ W)
                        ;{
eeReadByte
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define eeReadData_address  0x383d
                        ;#pragma origin eeReadData_address
        ORG 0x383D
                        ;bit eeReadData(uns8 address @ param2, uns8 length @ W)
                        ;{
eeReadData
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define eeWriteByte_address 0x3840
                        ;#pragma origin eeWriteByte_address
        ORG 0x3840
                        ;void eeWriteByte(uns8 address @ param2, uns8 data @ W)
                        ;{
eeWriteByte
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define eeWriteData_address 0x3843
                        ;#pragma origin eeWriteData_address
        ORG 0x3843
                        ;void eeWriteData(uns8 address @ param2, uns8 length @ W)
                        ;{
eeWriteData
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define readFromRAM_address 0x3846
                        ;#pragma origin readFromRAM_address
        ORG 0x3846
                        ;uns8 readFromRAM(uns16 address @ FSR0)
                        ;{
readFromRAM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define clearBufferINFO_address 0x384c
                        ;#pragma origin clearBufferINFO_address
        ORG 0x384C
                        ;void clearBufferINFO()
                        ;{
clearBufferINFO
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define swapBufferINFO_address  0x384f
                        ;#pragma origin swapBufferINFO_address
        ORG 0x384F
                        ;void swapBufferINFO()
                        ;{
swapBufferINFO
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define compareBufferINFO2RF_address    0x3852
                        ;#pragma origin compareBufferINFO2RF_address
        ORG 0x3852
                        ;bit compareBufferINFO2RF(uns8 length @ W)
                        ;{
compareBufferINFO2RF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define copyBufferINFO2COM_address  0x3855
                        ;#pragma origin copyBufferINFO2COM_address
        ORG 0x3855
                        ;void copyBufferINFO2COM()
                        ;{
copyBufferINFO2COM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define copyBufferINFO2RF_address   0x3858
                        ;#pragma origin copyBufferINFO2RF_address
        ORG 0x3858
                        ;void copyBufferINFO2RF()
                        ;{
copyBufferINFO2RF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define copyBufferRF2COM_address    0x385b
                        ;#pragma origin copyBufferRF2COM_address
        ORG 0x385B
                        ;void copyBufferRF2COM()
                        ;{
copyBufferRF2COM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define copyBufferRF2INFO_address   0x385e
                        ;#pragma origin copyBufferRF2INFO_address
        ORG 0x385E
                        ;void copyBufferRF2INFO()
                        ;{
copyBufferRF2INFO
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define copyBufferCOM2RF_address    0x3861
                        ;#pragma origin copyBufferCOM2RF_address
        ORG 0x3861
                        ;void copyBufferCOM2RF()
                        ;{
copyBufferCOM2RF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define copyBufferCOM2INFO_address  0x3864
                        ;#pragma origin copyBufferCOM2INFO_address
        ORG 0x3864
                        ;void copyBufferCOM2INFO()
                        ;{
copyBufferCOM2INFO
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define copyMemoryBlock_address 0x3867
                        ;#pragma origin copyMemoryBlock_address
        ORG 0x3867
                        ;void copyMemoryBlock(uns16 from @ FSR0, uns16 to @ FSR1, uns8 length @ W)
                        ;{
copyMemoryBlock
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ; #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define startDelay_address  0x386a
                        ;#pragma origin startDelay_address
        ORG 0x386A
                        ;void startDelay(uns8 ticks @ W)
                        ;{
startDelay
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define startLongDelay_address  0x386d
                        ;#pragma origin startLongDelay_address
        ORG 0x386D
                        ;void startLongDelay(uns16 ticks @ param3)
                        ;{
startLongDelay
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define isDelay_address 0x3870
                        ;#pragma origin isDelay_address
        ORG 0x3870
                        ;bit isDelay()
                        ;{
isDelay
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define waitDelay_address   0x3873
                        ;#pragma origin waitDelay_address
        ORG 0x3873
                        ;void waitDelay(uns8 ticks @ W)
                        ;{
waitDelay
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define waitMS_address  0x3876
                        ;#pragma origin waitMS_address
        ORG 0x3876
                        ;void waitMS(uns8 ms @ W)
                        ;{
waitMS
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define startCapture_address    0x3879
                        ;#pragma origin startCapture_address
        ORG 0x3879
                        ;void startCapture()
                        ;{
startCapture
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define captureTicks_address    0x387c
                        ;#pragma origin captureTicks_address
        ORG 0x387C
                        ;void captureTicks()
                        ;{
captureTicks
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define waitNewTick_address 0x3882
                        ;#pragma origin waitNewTick_address
        ORG 0x3882
                        ;void waitNewTick()
                        ;{
waitNewTick
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define enableSPI_address   0x3885
                        ;#pragma origin enableSPI_address
        ORG 0x3885
                        ;void enableSPI()
                        ;{
enableSPI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define disableSPI_address  0x3888
                        ;#pragma origin disableSPI_address
        ORG 0x3888
                        ;void disableSPI()
                        ;{
disableSPI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define startSPI_address    0x388b
                        ;#pragma origin startSPI_address
        ORG 0x388B
                        ;void startSPI(uns8 length @ W)
                        ;{
startSPI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define stopSPI_address 0x388e
                        ;#pragma origin stopSPI_address
        ORG 0x388E
                        ;void stopSPI()
                        ;{
stopSPI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define restartSPI_address  0x3891
                        ;#pragma origin restartSPI_address
        ORG 0x3891
                        ;void restartSPI()
                        ;{
restartSPI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define getStatusSPI_address    0x3894
                        ;#pragma origin getStatusSPI_address
        ORG 0x3894
                        ;bit getStatusSPI()
                        ;{
getStatusSPI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define setRFpower_address  0x3897
                        ;#pragma origin setRFpower_address
        ORG 0x3897
                        ;void setRFpower(uns8 level @ W)
                        ;{
setRFpower
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setLEDG_address 0x389a
                        ;#pragma origin setLEDG_address
        ORG 0x389A
                        ;void setLEDG()
                        ;{
setLEDG
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setRFchannel_address    0x389d
                        ;#pragma origin setRFchannel_address
        ORG 0x389D
                        ;void setRFchannel(uns8 channel @ W)
                        ;{
setRFchannel
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setRFmode_address   0x38a0
                        ;#pragma origin setRFmode_address
        ORG 0x38A0
                        ;void setRFmode(uns8 mode @ W)
                        ;{
setRFmode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setRFspeed_address  0x38a3
                        ;#pragma origin setRFspeed_address
        ORG 0x38A3
                        ;void setRFspeed(uns8 speed @ W)
                        ;{
setRFspeed
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setRFsleep_address  0x38a6
                        ;#pragma origin setRFsleep_address
        ORG 0x38A6
                        ;void setRFsleep()
                        ;{
setRFsleep
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setRFready_address  0x38a9
                        ;#pragma origin setRFready_address
        ORG 0x38A9
                        ;void setRFready()
                        ;{
setRFready
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define RFTXpacket_address  0x38ac
                        ;#pragma origin RFTXpacket_address
        ORG 0x38AC
                        ;void RFTXpacket()
                        ;{
RFTXpacket
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define RFRXpacket_address  0x38af
                        ;#pragma origin RFRXpacket_address
        ORG 0x38AF
                        ;bit RFRXpacket()
                        ;{
RFRXpacket
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define checkRF_address 0x38b2
                        ;#pragma origin checkRF_address
        ORG 0x38B2
                        ;bit checkRF(uns8 level @ W)
                        ;{
checkRF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define amIBonded_address   0x38b8
                        ;#pragma origin amIBonded_address
        ORG 0x38B8
                        ;bit amIBonded()
                        ;{
amIBonded
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define removeBond_address  0x38bb
                        ;#pragma origin removeBond_address
        ORG 0x38BB
                        ;void removeBond()
                        ;{
removeBond
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define bondNewNode_address 0x38be
                        ;#pragma origin bondNewNode_address
        ORG 0x38BE
                        ;bit bondNewNode(uns8 address @ W)
                        ;{
bondNewNode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define isBondedNode_address    0x38c1
                        ;#pragma origin isBondedNode_address
        ORG 0x38C1
                        ;bit isBondedNode(uns8 address @ W)
                        ;{
isBondedNode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define removeBondedNode_address    0x38c4
                        ;#pragma origin removeBondedNode_address
        ORG 0x38C4
                        ;void removeBondedNode(uns8 address @ W)
                        ;{
removeBondedNode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define rebondNode_address  0x38c7
                        ;#pragma origin rebondNode_address
        ORG 0x38C7
                        ;bit rebondNode(uns8 address @ W)
                        ;{
rebondNode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define clearAllBonds_address   0x38ca
                        ;#pragma origin clearAllBonds_address
        ORG 0x38CA
                        ;void clearAllBonds()
                        ;{
clearAllBonds
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setNonetMode_address    0x38cd
                        ;#pragma origin setNonetMode_address
        ORG 0x38CD
                        ;void setNonetMode()
                        ;{
setNonetMode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setCoordinatorMode_address  0x38d0
                        ;#pragma origin setCoordinatorMode_address
        ORG 0x38D0
                        ;void setCoordinatorMode()
                        ;{
setCoordinatorMode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setNodeMode_address 0x38d3
                        ;#pragma origin setNodeMode_address
        ORG 0x38D3
                        ;void setNodeMode()
                        ;{
setNodeMode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setNetworkFilteringOn_address   0x38d6
                        ;#pragma origin setNetworkFilteringOn_address
        ORG 0x38D6
                        ;void setNetworkFilteringOn()
                        ;{
setNetworkFilteringOn
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setNetworkFilteringOff_address  0x38d9
                        ;#pragma origin setNetworkFilteringOff_address
        ORG 0x38D9
                        ;void setNetworkFilteringOff()
                        ;{
setNetworkFilteringOff
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define getNetworkParams_address    0x38dc
                        ;#pragma origin getNetworkParams_address
        ORG 0x38DC
                        ;uns8 getNetworkParams()
                        ;{
getNetworkParams
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define setRoutingOn_address    0x38df
                        ;#pragma origin setRoutingOn_address
        ORG 0x38DF
                        ;void setRoutingOn()
                        ;{
setRoutingOn
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setRoutingOff_address   0x38e2
                        ;#pragma origin setRoutingOff_address
        ORG 0x38E2
                        ;void setRoutingOff()
                        ;{
setRoutingOff
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define answerSystemPacket_address  0x38e8
                        ;#pragma origin answerSystemPacket_address
        ORG 0x38E8
                        ;void answerSystemPacket()
                        ;{
answerSystemPacket
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define discovery_address   0x38eb
                        ;#pragma origin discovery_address
        ORG 0x38EB
                        ;uns8 discovery(uns8 MaxNodeAddress @ W)
                        ;{
discovery
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define wasRouted_address   0x38ee
                        ;#pragma origin wasRouted_address
        ORG 0x38EE
                        ;bit wasRouted()
                        ;{
wasRouted
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define optimizeHops_address    0x38f1
                        ;#pragma origin optimizeHops_address
        ORG 0x38F1
                        ;bit optimizeHops(uns8 method @ W)
                        ;{
optimizeHops
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define getSupplyVoltage_address    0x38f4
                        ;#pragma origin getSupplyVoltage_address
        ORG 0x38F4
                        ;uns8 getSupplyVoltage()
                        ;{
getSupplyVoltage
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define getTemperature_address  0x38f7
                        ;#pragma origin getTemperature_address
        ORG 0x38F7
                        ;int8 getTemperature()
                        ;{
getTemperature
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define clearBufferRF_address   0x38fa
                        ;#pragma origin clearBufferRF_address
        ORG 0x38FA
                        ;void clearBufferRF()
                        ;{
clearBufferRF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define isDiscoveredNode_address    0x3910
                        ;#pragma origin isDiscoveredNode_address
        ORG 0x3910
                        ;bit isDiscoveredNode(uns8 address @ W)
                        ;{
isDiscoveredNode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define enableRFPGM_address 0x3913
                        ;#pragma origin enableRFPGM_address
        ORG 0x3913
                        ;void enableRFPGM()
                        ;{
enableRFPGM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define disableRFPGM_address    0x3916
                        ;#pragma origin disableRFPGM_address
        ORG 0x3916
                        ;void disableRFPGM()
                        ;{
disableRFPGM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setupRFPGM_address  0x3919
                        ;#pragma origin setupRFPGM_address
        ORG 0x3919
                        ;void setupRFPGM(uns8 x @ W)
                        ;{
setupRFPGM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define runRFPGM_address    0x391c
                        ;#pragma origin runRFPGM_address
        ORG 0x391C
                        ;void runRFPGM()
                        ;{
runRFPGM
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define iqrfDeepSleep_address   0x391f
                        ;#pragma origin iqrfDeepSleep_address
        ORG 0x391F
                        ;void iqrfDeepSleep()
                        ;{
iqrfDeepSleep
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define wasRFICrestarted_address    0x3922
                        ;#pragma origin wasRFICrestarted_address
        ORG 0x3922
                        ;#if !defined( TR7xD )
                        ;    bit wasRFICrestarted()
                        ;    {
wasRFICrestarted
                        ;      #asm
                        ;        DW 0x2000
        DW    0x2000
                        ;      #endasm
                        ;      #pragma updateBank exit=UserBank_01
                        ;      return Carry;
        RETURN
                        ;    }
                        ;#else
                        ;    uns8 wasRFICrestarted()
                        ;    {
                        ;      #asm
                        ;        DW 0x2000
                        ;      #endasm
                        ;      #pragma updateBank exit=UserBank_01
                        ;      return W;
                        ;    }
                        ;#endif
                        ;
                        ;#define eeeWriteData_address    0x3925
                        ;#pragma origin eeeWriteData_address
        ORG 0x3925
                        ;bit eeeWriteData(uns16 address @ param3)
                        ;{
eeeWriteData
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define eeeReadData_address 0x3928
                        ;#pragma origin eeeReadData_address
        ORG 0x3928
                        ;bit eeeReadData(uns16 address @ param3)
                        ;{
eeeReadData
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define setINDF0_address    0x3931
                        ;#pragma origin setINDF0_address
        ORG 0x3931
                        ;void setINDF0(uns8 value @ W)
                        ;{
setINDF0
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setINDF1_address    0x3934
                        ;#pragma origin setINDF1_address
        ORG 0x3934
                        ;void setINDF1(uns8 value @ W)
                        ;{
setINDF1
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define getRSSI_address 0x3937
                        ;#pragma origin getRSSI_address
        ORG 0x3937
                        ;uns8 getRSSI()
                        ;{
getRSSI
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define removeBondAddress_address   0x393a
                        ;#pragma origin removeBondAddress_address
        ORG 0x393A
                        ;void removeBondAddress()
                        ;{
removeBondAddress
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define sendFRC_address 0x393d
                        ;#pragma origin sendFRC_address
        ORG 0x393D
                        ;uns8 sendFRC(uns8 command @ W)
                        ;{
sendFRC
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define responseFRC_address 0x3940
                        ;#pragma origin responseFRC_address
        ORG 0x3940
                        ;void responseFRC()
                        ;{
responseFRC
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define bondRequestAdvanced_address 0x3943
                        ;#pragma origin bondRequestAdvanced_address
        ORG 0x3943
                        ;bit bondRequestAdvanced()
                        ;{
bondRequestAdvanced
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define prebondNodeAtNode_address   0x3946
                        ;#pragma origin prebondNodeAtNode_address
        ORG 0x3946
                        ;bit prebondNodeAtNode()
                        ;{
prebondNodeAtNode
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define nodeAuthorization_address   0x3949
                        ;#pragma origin nodeAuthorization_address
        ORG 0x3949
                        ;bit nodeAuthorization(uns8 address @ W)
                        ;{
nodeAuthorization
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define dummy01_address 0x394c
                        ;#pragma origin dummy01_address
        ORG 0x394C
                        ;void dummy01()
                        ;{
dummy01
                        ;  #asm
                        ;  DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setAccessPassword_address   0x3958
                        ;#pragma origin setAccessPassword_address
        ORG 0x3958
                        ;void setAccessPassword()
                        ;{
setAccessPassword
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define setUserKey_address  0x395b
                        ;#pragma origin setUserKey_address
        ORG 0x395B
                        ;void setUserKey()
                        ;{
setUserKey
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define amIRecipientOfFRC_address   0x3961
                        ;#pragma origin amIRecipientOfFRC_address
        ORG 0x3961
                        ;bit amIRecipientOfFRC()
                        ;{
amIRecipientOfFRC
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define setLEDR_address 0x3964
                        ;#pragma origin setLEDR_address
        ORG 0x3964
                        ;void setLEDR()
                        ;{
setLEDR
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define encryptBufferRF_address 0x3967
                        ;#pragma origin encryptBufferRF_address
        ORG 0x3967
                        ;void encryptBufferRF(uns8 blocks @ W)
                        ;{
encryptBufferRF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define decryptBufferRF_address 0x396a
                        ;#pragma origin decryptBufferRF_address
        ORG 0x396A
                        ;void decryptBufferRF(uns8 blocks @ W)
                        ;{
decryptBufferRF
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define prebondNodeAtCoordinator_address    0x396d
                        ;#pragma origin prebondNodeAtCoordinator_address
        ORG 0x396D
                        ;bit prebondNodeAtCoordinator(uns8 address @ W)
                        ;{
prebondNodeAtCoordinator
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define setFSRs_address 0x3970
                        ;#pragma origin setFSRs_address
        ORG 0x3970
                        ;uns8 setFSRs(uns8 fsrs @ W)
                        ;{
setFSRs
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;// For internal usage only
                        ;#define updateCRC16_address 0x3973
                        ;#pragma origin updateCRC16_address
        ORG 0x3973
                        ;void updateCRC16(uns8 value @ W)
                        ;{
updateCRC16
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;}
        RETURN
                        ;
                        ;#define smartConnect_address    0x3976
                        ;#pragma origin smartConnect_address
        ORG 0x3976
                        ;bit smartConnect(uns8 address @ W)
                        ;{
smartConnect
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#define addressBitmap_address   0x3979
                        ;#pragma origin addressBitmap_address
        ORG 0x3979
                        ;uns8 addressBitmap(uns8 bitIndex @ W)
                        ;{
addressBitmap
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return W;
        RETURN
                        ;}
                        ;
                        ;#define setServiceChannel_address   0x397c
                        ;#pragma origin setServiceChannel_address
        ORG 0x397C
                        ;bit setServiceChannel(uns8 channelNumber @ W)
                        ;{
setServiceChannel
                        ;  #asm
                        ;    DW 0x2000
        DW    0x2000
                        ;  #endasm
                        ;  #pragma updateBank exit=UserBank_01
                        ;  return Carry;
        RETURN
                        ;}
                        ;
                        ;#pragma optimize 1
                        ;#pragma update_RP 1
                        ;#pragma update_PAGE 1
                        ;#pragma origin __APPLICATION_ADDRESS
        ORG 0x3A00

  ; FILE C:\customdpa\DPA.h
                        ;// *********************************************************************
                        ;//   General public DPA header file                                    *
                        ;// *********************************************************************
                        ;// Copyright (c) MICRORISC s.r.o.
                        ;//
                        ;// File:    $RCSfile: DPA.h,v $
                        ;// Version: $Revision: 1.329 $
                        ;// Date:    $Date: 2024/12/05 09:28:57 $
                        ;//
                        ;// Revision history:
                        ;//   2024/11/05  Release for DPA 4.32
                        ;//   2024/04/17  Release for DPA 4.31
                        ;//   2023/03/07  Release for DPA 4.30
                        ;//   2022/10/05  Release for DPA 4.18
                        ;//   2022/02/24  Release for DPA 4.17
                        ;//   2021/08/20  Release for DPA 4.16
                        ;//   2020/09/03  Release for DPA 4.15
                        ;//   2020/04/03  Release for DPA 4.14
                        ;//   2020/02/27  Release for DPA 4.13
                        ;//   2020/01/09  Release for DPA 4.12
                        ;//   2019/12/11  Release for DPA 4.11
                        ;//   2019/10/09  Release for DPA 4.10
                        ;//   2019/06/12  Release for DPA 4.03
                        ;//   2019/06/03  Release for DPA 4.02
                        ;//   2019/03/07  Release for DPA 4.01
                        ;//   2019/01/10  Release for DPA 4.00
                        ;//   2018/10/25  Release for DPA 3.03
                        ;//   2017/11/16  Release for DPA 3.02
                        ;//   2017/08/14  Release for DPA 3.01
                        ;//   2017/03/13  Release for DPA 3.00
                        ;//   2016/09/12  Release for DPA 2.28
                        ;//   2016/04/14  Release for DPA 2.27
                        ;//   2016/03/03  Release for DPA 2.26
                        ;//   2016/01/21  Release for DPA 2.25
                        ;//   2015/12/01  Release for DPA 2.24
                        ;//   2015/10/23  Release for DPA 2.23
                        ;//   2015/09/25  Release for DPA 2.22
                        ;//   2015/09/03  Release for DPA 2.21
                        ;//   2015/08/05  Release for DPA 2.20
                        ;//   2014/10/31  Release for DPA 2.10
                        ;//   2014/04/30  Release for DPA 2.00
                        ;//   2013/10/03  Release for DPA 1.00
                        ;//
                        ;// *********************************************************************
                        ;
                        ;// Online DPA documentation https://doc.iqrf.org/DpaTechGuide/
                        ;// IQRF Standards documentation https://doc.iqrf.org/
                        ;
                        ;#ifndef _DPA_HEADER_
                        ;#define _DPA_HEADER_
                        ;
                        ;//############################################################################################
                        ;
                        ;// DPA version
                        ;#define DPA_VERSION_MASTER          0x0432
                        ;
                        ;#if defined( __CC5X__ ) && !defined( CC5XnotDPA )
                        ;// Compiled only at CC5X
                        ;#if __CC5X__ < 3800
                        ;#error Insufficient CC5X compiler version, V3.8 is minimum
                        ;#endif
                        ;
                        ;#if IQRFOS < 406
                        ;#error IQRF OS 4.06+ is required
                        ;#endif
                        ;
                        ;// Bank for custom variables
                        ;#pragma rambank = UserBank_01
                        ;
                        ;// Main DPA API entry address (also start of the licensed FLASH)
                        ;#define DPA_API_ADDRESS             __LICENSED_FLASH
                        ;
                        ;// Main DPA entry address
                        ;#define MAIN_DPA_ADDRESS            ( DPA_API_ADDRESS + 4 )
                        ;
                        ;// Main DPA API entry address stub
                        ;#define DPA_API_ADDRESS_ENTRY       0x3A08
                        ;
                        ;// Address of the DPA Custom Handler
                        ;#define CUSTOM_HANDLER_ADDRESS      0x3A20
                        ;
                        ;// Address of the DPA Custom Handler end + 1
                        ;#if defined TR7xD
                        ;#define CUSTOM_HANDLER_ADDRESS_END  0x3D80
                        ;#else
                        ;#define CUSTOM_HANDLER_ADDRESS_END  __USER_INTERRUPT
                        ;#endif
                        ;
                        ;// DPA API entry function
                        ;uns8  DpaApiEntry( uns8 par1, uns8 par2, uns8 apiIndex );
                        ;
                        ;// DPA API codes
                        ;#define DPA_API_RFTX_DPAPACKET              0
                        ;#define DPA_API_READ_CONFIG_BYTE            1
                        ;#define DPA_API_SEND_TO_IFACEMASTER         2
                        ;#define DPA_API_COORDINATOR_RFTX_DPAPACKET  3
                        ;#define DPA_API_LOCAL_REQUEST               4
                        ;#define DPA_API_SET_PERIPHERAL_ERROR        5
                        ;#define DPA_API_SET_RF_DEFAULTS             6
                        ;#define DPA_API_LOCAL_FRC                   7
                        ;#define DPA_API_CRC8                        8
                        ;#define DPA_API_AGGREGATE_FRC               9
                        ;#define DPA_API_SET_OTK                     10
                        ;#define DPA_API_I2C_INIT                    11
                        ;#define DPA_API_I2C_START                   12
                        ;#define DPA_API_I2C_WRITE                   13
                        ;#define DPA_API_I2C_READ                    14
                        ;#define DPA_API_I2C_STOP                    15
                        ;#define DPA_API_I2C_WAIT_FOR_ACK            16
                        ;#define DPA_API_I2C_SHUTDOWN                17
                        ;#define DPA_API_I2C_WAIT_FOR_IDLE           18
                        ;#define DPA_API_SLEEP                       19
                        ;#define DPA_API_AFTER_SLEEP                 20
                        ;#define DPA_API_RANDOM                      21
                        ;#if !defined( TR7xD )
                        ;#define DPA_API_MENU                        22
                        ;#define DPA_API_MENU_INDICATE_RESULT        23
                        ;#define DPA_API_MENU_EXECUTE                24
                        ;#define DPA_API_DEEP_SLEEP                  25
                        ;#endif
                        ;
                        ;// Used buffer size symbols
                        ;#define sizeofBufferRF                      sizeof( bufferRF )
                        ;#define sizeofBufferAUX                     sizeof( bufferAUX )
                        ;#define sizeofBufferCOM                     sizeof( bufferCOM )
                        ;#define sizeofBufferINFO                    sizeof( bufferINFO )
                        ;
                        ;// Converts conventional address to the linear one at PIC16LF1938
                        ;// Note: This is workaround of CC5X preprocessor bug "No '#endif' detected"
                        ;#define error_ #error Address cannot be linearized
                        ;#define LINEARIZE_ADDRESS( a ) \
                        ;#if ( ((uns16)(a)) - ( ((uns16)(a)) / 0x80 ) * 0x80 ) >= 0x20 && ( ((uns16)(a)) - ( ((uns16)(a)) / 0x80 ) * 0x80 ) <= 0x6F && ( ((uns16)(a)) / 0x80 ) <= 12 \
                        ;( ( ( ((uns16)(a)) / 0x80 ) * 0x50 ) + ( ((uns16)(a)) - 0x20 - ( ((uns16)(a)) / 0x80 ) * 0x80 ) + 0x2000 ) \
                        ;#else \
                        ;error_ \
                        ;#endif
                        ;#undef error_
                        ;
                        ;#define STRUCTATTR
                        ;
                        ;#else //__CC5X__
                        ;// Not compiled at CC5X
                        ;
                        ;#if !defined( CC5XnotDPA )
                        ;// Define CC5X types
                        ;typedef int8_t    int8;
                        ;typedef int16_t   int16;
                        ;typedef uint8_t   uns8;
                        ;typedef uint16_t  uns16;
                        ;// Disables alignment of members of structures
                        ;#define STRUCTATTR  __attribute__((packed))
                        ;#else
                        ;#define STRUCTATTR
                        ;#endif
                        ;
                        ;// Fake buffer sizes
                        ;#define sizeofBufferRF    64
                        ;#define sizeofBufferAUX   64
                        ;#define sizeofBufferCOM   64
                        ;#define sizeofBufferINFO  64
                        ;
                        ;#endif  // __CC5X__
                        ;
                        ;// Indexes of configuration bytes used by DpaApiReadConfigByte( index )
                        ;// Checksum
                        ;#define CFGIND_CHECKSUM         0x00
                        ;// Embedded peripherals
                        ;#define CFGIND_DPA_PERIPHERALS  0x01
                        ;// DPA configuration flags #0
                        ;#define CFGIND_DPA_FLAGS0       0x05
                        ;// Main RF channel, used by the subordinate network
                        ;#define CFGIND_CHANNEL_2ND_A    0x06
                        ;// Second RF channel, used by the subordinate network
                        ;#define CFGIND_CHANNEL_2ND_B    0x07
                        ;// TX power
                        ;#define CFGIND_TXPOWER          0x08
                        ;// RX filter used by checkRF()
                        ;#define CFGIND_RXFILTER         0x09
                        ;// toutRF for LP mode
                        ;#define CFGIND_DPA_LP_TOUTRF    0x0A
                        ;// UART interface baud rate
                        ;#define CFGIND_DPA_UART_IFACE_SPEED 0x0B
                        ;// Alternate DSM channel
                        ;#define CFGIND_ALTERNATE_DSM_CHANNEL 0x0C
                        ;// DPA configuration flags #1
                        ;#define CFGIND_DPA_FLAGS1       0x0D
                        ;// Main RF channel
                        ;#define CFGIND_CHANNEL_A        0x11
                        ;// Second RF channel
                        ;#define CFGIND_CHANNEL_B        0x12
                        ;
                        ;// 0: checks only mandatory precondition in order to prevent critical side-effects
                        ;// 1: as above plus checks meaningful parameter conditions
                        ;// 2: full implemented parameter checking (default)
                        ;#ifndef PARAM_CHECK_LEVEL
                        ;#define PARAM_CHECK_LEVEL 2
                        ;#endif
                        ;
                        ;// "foursome" at IFace structure
                        ;typedef struct
                        ;{
                        ;  // Node address low byte
                        ;  uns8  NADRlow;
                        ;  // Node address high byte
                        ;  uns8  NADRhigh;
                        ;  // Peripheral number
                        ;  uns8  PNUM;
                        ;  // Peripheral command
                        ;  uns8  PCMD;
                        ;  // HWPID
                        ;  uns16 HWPID;
                        ;} STRUCTATTR TDpaIFaceHeader;
                        ;
                        ;// Maximum command PCMD value (except reserved 0x3F = CMD_GET_PER_INFO)
                        ;#define PCMD_MAX                    0x7f
                        ;// Bit mask at PCMD that indicates DPA Response message
                        ;#define RESPONSE_FLAG               0x80
                        ;
                        ;// IQMESH coordinator address
                        ;#define COORDINATOR_ADDRESS         0x00
                        ;// IQMESH broadcast address
                        ;#define BROADCAST_ADDRESS           0xff
                        ;// IQMESH temporary address, assigned by pre-bonding before authorization is done
                        ;#define TEMPORARY_ADDRESS           0xfe
                        ;// Address of the local device addressed by IFace
                        ;#define LOCAL_ADDRESS               0xfc
                        ;// Maximum IQMESH network device address
                        ;#define MAX_ADDRESS                 ( 240 - 1 )
                        ;
                        ;// Time slots lengths in 10 ms
                        ;#define MIN_STD_TIMESLOT    4
                        ;#define MAX_STD_TIMESLOT    6
                        ;
                        ;#define MIN_LP_TIMESLOT     8
                        ;#define MAX_LP_TIMESLOT     10
                        ;
                        ;// Maximum number of DPA PData bytes ( minus 8 = 6B foursome + 8b error code + 8b DpaValue )
                        ;#define DPA_MAX_DATA_LENGTH         ( sizeofBufferCOM - sizeof( TDpaIFaceHeader ) - 2 * sizeof( uns8 ) )
                        ;
                        ;// Maximum number of peripherals info that can fit in the message
                        ;#define MAX_PERIPHERALS_PER_BLOCK_INFO  ( DPA_MAX_DATA_LENGTH / sizeof( TPeripheralInfoAnswer ) )
                        ;
                        ;// Embedded peripheral numbers
                        ;#define PNUM_COORDINATOR    0x00
                        ;#define PNUM_NODE           0x01
                        ;#define PNUM_OS             0x02
                        ;#define PNUM_EEPROM         0x03
                        ;#define PNUM_EEEPROM        0x04
                        ;#define PNUM_RAM            0x05
                        ;#define PNUM_LEDR           0x06
                        ;#define PNUM_LEDG           0x07
                        ;#define PNUM_IO             0x09
                        ;#define PNUM_THERMOMETER    0x0A
                        ;#define PNUM_UART           0x0C
                        ;#define PNUM_FRC            0x0D
                        ;
                        ;// Number of the 1st user peripheral
                        ;#define PNUM_USER           0x20
                        ;// Number of the last user peripheral
                        ;#define PNUM_USER_MAX       0x3E
                        ;// Maximum peripheral number
                        ;#define PNUM_MAX            0x7F
                        ;
                        ;// Fake peripheral number used to flag DPA response with error sent by RF
                        ;#define PNUM_ERROR_FLAG     0xFE
                        ;// Special peripheral used for enumeration
                        ;#define PNUM_ENUMERATION    0xFF
                        ;
                        ;// DPA Commands for embedded peripherals
                        ;#define CMD_COORDINATOR_ADDR_INFO  0
                        ;#define CMD_COORDINATOR_DISCOVERED_DEVICES 1
                        ;#define CMD_COORDINATOR_BONDED_DEVICES 2
                        ;#define CMD_COORDINATOR_CLEAR_ALL_BONDS 3
                        ;#define CMD_COORDINATOR_BOND_NODE 4
                        ;#define CMD_COORDINATOR_REMOVE_BOND 5
                        ;#define CMD_COORDINATOR_DISCOVERY 7
                        ;#define CMD_COORDINATOR_SET_DPAPARAMS 8
                        ;#define CMD_COORDINATOR_SET_HOPS 9
                        ;#define CMD_COORDINATOR_BACKUP 11
                        ;#define CMD_COORDINATOR_RESTORE 12
                        ;#define CMD_COORDINATOR_AUTHORIZE_BOND 13
                        ;#define CMD_COORDINATOR_BRIDGE 14
                        ;#define CMD_COORDINATOR_SMART_CONNECT 18
                        ;#define CMD_COORDINATOR_SET_MID 19
                        ;
                        ;#define CMD_NODE_READ 0
                        ;#define CMD_NODE_REMOVE_BOND 1
                        ;#define CMD_NODE_BACKUP 6
                        ;#define CMD_NODE_RESTORE 7
                        ;#define CMD_NODE_VALIDATE_BONDS 8
                        ;
                        ;#define CMD_OS_READ 0
                        ;#define CMD_OS_RESET 1
                        ;#define CMD_OS_READ_CFG 2
                        ;#define CMD_OS_RFPGM 3
                        ;#define CMD_OS_SLEEP 4
                        ;#define CMD_OS_BATCH 5
                        ;#define CMD_OS_SET_SECURITY 6
                        ;#define CMD_OS_INDICATE 7
                        ;#define CMD_OS_RESTART 8
                        ;#define CMD_OS_WRITE_CFG_BYTE 9
                        ;#define CMD_OS_LOAD_CODE 10
                        ;#define CMD_OS_SELECTIVE_BATCH 11
                        ;#define CMD_OS_TEST_RF_SIGNAL 12
                        ;#define CMD_OS_FACTORY_SETTINGS 13
                        ;#define CMD_OS_WRITE_CFG 15
                        ;
                        ;#define CMD_RAM_READ 0
                        ;#define CMD_RAM_WRITE 1
                        ;#define CMD_RAM_READ_ANY    15
                        ;
                        ;#define CMD_EEPROM_READ CMD_RAM_READ
                        ;#define CMD_EEPROM_WRITE CMD_RAM_WRITE
                        ;
                        ;#define CMD_EEEPROM_XREAD ( CMD_RAM_READ + 2 )
                        ;#define CMD_EEEPROM_XWRITE ( CMD_RAM_WRITE + 2 )
                        ;
                        ;#define CMD_LED_SET_OFF 0
                        ;#define CMD_LED_SET_ON 1
                        ;#define CMD_LED_PULSE 3
                        ;#define CMD_LED_FLASHING 4
                        ;
                        ;#define CMD_IO_DIRECTION  0
                        ;#define CMD_IO_SET  1
                        ;#define CMD_IO_GET  2
                        ;
                        ;#define CMD_THERMOMETER_READ 0
                        ;
                        ;#define CMD_UART_OPEN 0
                        ;#define CMD_UART_CLOSE 1
                        ;#define CMD_UART_WRITE_READ 2
                        ;#define CMD_UART_CLEAR_WRITE_READ 3
                        ;
                        ;#define CMD_FRC_SEND 0
                        ;#define CMD_FRC_EXTRARESULT 1
                        ;#define CMD_FRC_SEND_SELECTIVE 2
                        ;#define CMD_FRC_SET_PARAMS 3
                        ;
                        ;#define CMD_GET_PER_INFO  0x3f
                        ;
                        ;// DPA peripheral type
                        ;typedef enum
                        ;{
                        ;  PERIPHERAL_TYPE_DUMMY = 0x00,
                        ;  PERIPHERAL_TYPE_COORDINATOR = 0x01,
                        ;  PERIPHERAL_TYPE_NODE = 0x02,
                        ;  PERIPHERAL_TYPE_OS = 0x03,
                        ;  PERIPHERAL_TYPE_EEPROM = 0x04,
                        ;  PERIPHERAL_TYPE_BLOCK_EEPROM = 0x05,
                        ;  PERIPHERAL_TYPE_RAM = 0x06,
                        ;  PERIPHERAL_TYPE_LED = 0x07,
                        ;  PERIPHERAL_TYPE_SPI = 0x08,
                        ;  PERIPHERAL_TYPE_IO = 0x09,
                        ;  PERIPHERAL_TYPE_UART = 0x0a,
                        ;  PERIPHERAL_TYPE_THERMOMETER = 0x0b,
                        ;  PERIPHERAL_TYPE_ADC = 0x0c,
                        ;  PERIPHERAL_TYPE_PWM = 0x0d,
                        ;  PERIPHERAL_TYPE_FRC = 0x0e,
                        ;  // Starts peripheral type number interval for user peripherals
                        ;  PERIPHERAL_TYPE_USER_AREA = 0x80
                        ;} TDpaPeripheralType;
                        ;
                        ;// Peripheral extended information
                        ;typedef enum
                        ;{
                        ;  PERIPHERAL_TYPE_EXTENDED_DEFAULT = 0x00,
                        ;  PERIPHERAL_TYPE_EXTENDED_READ = 0x01,
                        ;  PERIPHERAL_TYPE_EXTENDED_WRITE = 0x02,
                        ;  PERIPHERAL_TYPE_EXTENDED_READ_WRITE = PERIPHERAL_TYPE_EXTENDED_READ | PERIPHERAL_TYPE_EXTENDED_WRITE
                        ;} TDpaPeripheralTypeExtended;
                        ;
                        ;// Response packet error codes
                        ;typedef enum
                        ;{
                        ;  // No error
                        ;  STATUS_NO_ERROR = 0,
                        ;
                        ;  // General fail
                        ;  ERROR_FAIL = 1,
                        ;  // Incorrect PCMD
                        ;  ERROR_PCMD = 2,
                        ;  // Incorrect PNUM or PCMD
                        ;  ERROR_PNUM = 3,
                        ;  // Incorrect Address value when addressing memory type peripherals
                        ;  ERROR_ADDR = 4,
                        ;  // Incorrect Data length
                        ;  ERROR_DATA_LEN = 5,
                        ;  // Incorrect Data
                        ;  ERROR_DATA = 6,
                        ;  // Incorrect HWPID used
                        ;  ERROR_HWPID = 7,
                        ;  // Incorrect NADR
                        ;  ERROR_NADR = 8,
                        ;  // IFACE data consumed by Custom DPA Handler
                        ;  ERROR_IFACE_CUSTOM_HANDLER = 9,
                        ;  // Custom DPA Handler is missing
                        ;  ERROR_MISSING_CUSTOM_DPA_HANDLER = 10,
                        ;
                        ;  // Beginning of the user code error interval
                        ;  ERROR_USER_FROM = 0x20,
                        ;  // End of the user code error interval
                        ;  ERROR_USER_TO = 0x3f,
                        ;
                        ;  // Bit/flag reserved for a future use
                        ;  STATUS_RESERVED_FLAG = 0x40,
                        ;  // Bit to flag asynchronous DPA Response from [N]
                        ;  STATUS_ASYNC_RESPONSE = 0x80,
                        ;  // Error code used to mark DPA Confirmation
                        ;  STATUS_CONFIRMATION = 0xff
                        ;} TErrorCodes;
                        ;
                        ;// Embedded FRC commands
                        ;typedef enum
                        ;{
                        ;  // 2 bits
                        ;  FRC_Ping = 0x00,
                        ;  FRC_AcknowledgedBroadcastBits = 0x02,
                        ;  FRC_PrebondedAlive = 0x03,
                        ;  FRC_SupplyVoltage = 0x04,
                        ;  FRC_PrebondedMemoryCompare2B = 0x05,
                        ;  // 1 byte
                        ;  FRC_Temperature = 0x80,
                        ;  FRC_AcknowledgedBroadcastBytes = 0x81,
                        ;  FRC_MemoryRead = 0x82,
                        ;  FRC_MemoryReadPlus1 = 0x83,
                        ;  FRC_FrcResponseTime = 0x84,
                        ;  FRC_TestRFsignal = 0x85,
                        ;  // 4 bytes
                        ;  FRC_PrebondedMemoryRead4BPlus1 = 0xF8,
                        ;  FRC_MemoryRead4B = 0xFA
                        ;} TFRCommands;
                        ;
                        ;// Intervals of user FRC codes
                        ;#define FRC_USER_BIT_FROM     0x40
                        ;#define FRC_USER_BIT_TO       0x7F
                        ;#define FRC_USER_BYTE_FROM    0xC0
                        ;#define FRC_USER_BYTE_TO      0xDF
                        ;#define FRC_USER_2BYTE_FROM   0xF0
                        ;#define FRC_USER_2BYTE_TO     0xF7
                        ;#define FRC_USER_4BYTE_FROM   0xFC
                        ;#define FRC_USER_4BYTE_TO     0xFF
                        ;
                        ;// No HWPID specified
                        ;#define HWPID_Default         0x0000
                        ;// Use this type to override HWPID check
                        ;#define HWPID_DoNotCheck      0xFfFf
                        ;
                        ;// RAM peripheral block definitions
                        ;#ifdef TR7xD
                        ;#define PERIPHERAL_RAM_LENGTH 48
                        ;#else
                        ;#define PERIPHERAL_RAM_LENGTH 80
                        ;#endif
                        ;
                        ;// Start address of EEPROM peripheral in the real EEPROM
                        ;#ifndef COORDINATOR_CUSTOM_HANDLER // Node
                        ;#define PERIPHERAL_EEPROM_START     ( (uns8)0x00 )
                        ;#else // Coordinator
                        ;#define PERIPHERAL_EEPROM_START     ( (uns8)0x80 )
                        ;#endif
                        ;
                        ;// Length of the internal EEPROM peripheral array
                        ;#define PERIPHERAL_EEPROM_LENGTH            ( (uns8)( 0xC0 - PERIPHERAL_EEPROM_START ) )
                        ;
                        ;// Length of the readable area of serial EEEPROM from the EEEPROM DPA peripheral write point of view.
                        ;#define EEEPROM_READ_LENGTH                 0x8000
                        ;// Length of the writable area of serial EEEPROM from the EEEPROM DPA peripheral write point of view.
                        ;#define EEEPROM_WRITE_LENGTH                0x4000
                        ;
                        ;// Starting address of the IO Setup DPA storage at external EEPROM
                        ;#define IOSETUP_EEEPROM_ADDR                ( 0x0000 + sizeofBufferAUX )
                        ;// Length of the IO setup memory block
                        ;#define IOSETUP_LENGTH                      sizeofBufferAUX
                        ;
                        ;#if !defined( TR7xD )
                        ;// Parameter at [_]DpaApi[Deep]Sleep() for not using Watchdog timer wakeup
                        ;#define DpaApiSleep_WdtOff                  0b00000.0
                        ;#endif
                        ;
                        ;// ---------------------------------------------------------
                        ;
                        ;// Enumerate peripherals structure
                        ;typedef struct
                        ;{
                        ;  uns16 DpaVersion;
                        ;  uns8  UserPerNr;
                        ;  uns8  EmbeddedPers[PNUM_USER / 8];
                        ;  uns16 HWPID;
                        ;  uns16 HWPIDver;
                        ;  uns8  Flags;
                        ;  uns8  UserPer[( PNUM_MAX - PNUM_USER + 1 + 7 ) / 8];
                        ;} STRUCTATTR TEnumPeripheralsAnswer;
                        ;
                        ;#define FlagUserPer(UserPersArray,UserPerNumber)    UserPersArray[((UserPerNumber)-PNUM_USER) / 8] |= (uns8)0x01 << (((UserPerNumber)-PNUM_USER) % 8);
                        ;
                        ;// Get peripheral info structure (CMD_GET_PER_INFO)
                        ;typedef struct
                        ;{
                        ;  uns8  PerTE;
                        ;  uns8  PerT;
                        ;  uns8  Par1;
                        ;  uns8  Par2;
                        ;} STRUCTATTR TPeripheralInfoAnswer;
                        ;
                        ;// Error DPA response (PNUM_ERROR_FLAG)
                        ;typedef struct
                        ;{
                        ;  uns8  ErrN;
                        ;  uns8  PNUMoriginal;
                        ;} STRUCTATTR TErrorAnswer;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_ADDR_INFO
                        ;typedef struct
                        ;{
                        ;  uns8  DevNr;
                        ;  uns8  DID;
                        ;} STRUCTATTR TPerCoordinatorAddrInfo_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_BOND_NODE
                        ;typedef struct
                        ;{
                        ;  uns8  ReqAddr;
                        ;  uns8  BondingTestRetries;
                        ;} STRUCTATTR TPerCoordinatorBondNode_Request;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_BOND_NODE or CMD_COORDINATOR_SMART_CONNECT
                        ;typedef struct
                        ;{
                        ;  uns8  BondAddr;
                        ;  uns8  DevNr;
                        ;} STRUCTATTR TPerCoordinatorBondNodeSmartConnect_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_REMOVE_BOND
                        ;typedef struct
                        ;{
                        ;  uns8  BondAddr;
                        ;} STRUCTATTR TPerCoordinatorRemoveBond_Request;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_REMOVE_BOND
                        ;typedef struct
                        ;{
                        ;  uns8  DevNr;
                        ;} STRUCTATTR TPerCoordinatorRemoveBond_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_DISCOVERY
                        ;typedef struct
                        ;{
                        ;  uns8  TxPower;
                        ;  uns8  MaxAddr;
                        ;} STRUCTATTR TPerCoordinatorDiscovery_Request;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_DISCOVERY
                        ;typedef struct
                        ;{
                        ;  uns8  DiscNr;
                        ;} STRUCTATTR TPerCoordinatorDiscovery_Response;
                        ;
                        ;// Structure for and also returned by CMD_COORDINATOR_SET_DPAPARAMS
                        ;typedef struct
                        ;{
                        ;  uns8  DpaParam;
                        ;} STRUCTATTR TPerCoordinatorSetDpaParams_Request_Response;
                        ;
                        ;// Structure for and also returned by CMD_COORDINATOR_SET_HOPS
                        ;typedef struct
                        ;{
                        ;  uns8  RequestHops;
                        ;  uns8  ResponseHops;
                        ;} STRUCTATTR TPerCoordinatorSetHops_Request_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_BACKUP and CMD_NODE_BACKUP
                        ;typedef struct
                        ;{
                        ;  uns8  Index;
                        ;} STRUCTATTR TPerCoordinatorNodeBackup_Request;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_BACKUP and CMD_NODE_BACKUP
                        ;typedef struct
                        ;{
                        ;  uns8  NetworkData[49];
                        ;} STRUCTATTR TPerCoordinatorNodeBackup_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_RESTORE and CMD_NODE_RESTORE
                        ;typedef struct
                        ;{
                        ;  uns8  NetworkData[49];
                        ;} STRUCTATTR TPerCoordinatorNodeRestore_Request;
                        ;
                        ;// Structure for CMD_COORDINATOR_AUTHORIZE_BOND
                        ;typedef struct
                        ;{
                        ;  uns8  ReqAddr;
                        ;  uns8  MID[4];
                        ;} STRUCTATTR TPerCoordinatorAuthorizeBond_Request;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_AUTHORIZE_BOND
                        ;typedef struct
                        ;{
                        ;  uns8  BondAddr;
                        ;  uns8  DevNr;
                        ;} STRUCTATTR TPerCoordinatorAuthorizeBond_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_BRIDGE
                        ;typedef struct
                        ;{
                        ;  TDpaIFaceHeader subHeader;
                        ;  uns8  subPData[DPA_MAX_DATA_LENGTH - sizeof( TDpaIFaceHeader )];
                        ;} STRUCTATTR TPerCoordinatorBridge_Request;
                        ;
                        ;// Structure returned by CMD_COORDINATOR_BRIDGE
                        ;typedef struct
                        ;{
                        ;  TDpaIFaceHeader subHeader;
                        ;  uns8  subRespCode;
                        ;  uns8  subDpaValue;
                        ;  uns8  subPData[DPA_MAX_DATA_LENGTH - sizeof( TDpaIFaceHeader ) - 2 * sizeof( uns8 )];
                        ;} STRUCTATTR TPerCoordinatorBridge_Response;
                        ;
                        ;// Structure for CMD_COORDINATOR_SMART_CONNECT
                        ;typedef struct
                        ;{
                        ;  uns8  ReqAddr;
                        ;  uns8  BondingTestRetries;
                        ;  uns8  IBK[16];
                        ;  uns8  MID[4];
                        ;  uns8  reserved0;
                        ;  uns8  VirtualDeviceAddress;
                        ;  uns8  UserData[4];
                        ;  uns8  reserved1[10];
                        ;} STRUCTATTR TPerCoordinatorSmartConnect_Request;
                        ;
                        ;// Structure for CMD_COORDINATOR_SET_MID
                        ;typedef struct
                        ;{
                        ;  uns8  MID[4];
                        ;  uns8  BondAddr;
                        ;} STRUCTATTR TPerCoordinatorSetMID_Request;
                        ;
                        ;// Structure returned by CMD_NODE_READ
                        ;typedef struct
                        ;{
                        ;  uns8  ntwADDR;
                        ;  uns8  ntwVRN;
                        ;  uns8  ntwZIN;
                        ;  uns8  ntwDID;
                        ;  uns8  ntwPVRN;
                        ;  uns16 ntwUSERADDRESS;
                        ;  uns16 ntwID;
                        ;  uns8  ntwVRNFNZ;
                        ;  uns8  ntwCFG;
                        ;  uns8  Flags;
                        ;} STRUCTATTR TPerNodeRead_Response;
                        ;
                        ;// Structures for CMD_NODE_VALIDATE_BONDS
                        ;typedef struct
                        ;{
                        ;  uns8  Address;
                        ;  uns8  MID[4];
                        ;} STRUCTATTR TPerNodeValidateBondsItem;
                        ;
                        ;// Structure for CMD_NODE_VALIDATE_BONDS
                        ;typedef struct
                        ;{
                        ;  TPerNodeValidateBondsItem Bonds[DPA_MAX_DATA_LENGTH / sizeof( TPerNodeValidateBondsItem )];
                        ;} STRUCTATTR TPerNodeValidateBonds_Request;
                        ;
                        ;// Structure returned by CMD_OS_READ
                        ;typedef struct
                        ;{
                        ;  uns8  MID[4];
                        ;  uns8  OsVersion;
                        ;  uns8  TrType;
                        ;  uns16 OsBuild;
                        ;  uns8  Rssi;
                        ;  uns8  SupplyVoltage;
                        ;  uns8  Flags;
                        ;  uns8  SlotLimits;
                        ;  uns8  IBK[16];
                        ;  // Enumerate peripherals part, variable length because of UserPer field
                        ;  uns16 DpaVersion;
                        ;  uns8  UserPerNr;
                        ;  uns8  EmbeddedPers[PNUM_USER / 8];
                        ;  uns16 HWPID;
                        ;  uns16 HWPIDver;
                        ;  uns8  FlagsEnum;
                        ;  uns8  UserPer[( PNUM_MAX - PNUM_USER + 1 + 7 ) / 8];
                        ;} STRUCTATTR TPerOSRead_Response;
                        ;
                        ;// Structure returned by CMD_OS_READ_CFG
                        ;typedef struct
                        ;{
                        ;  uns8  Checksum;
                        ;  uns8  Configuration[31];
                        ;  uns8  RFPGM;
                        ;  uns8  Undocumented[1];
                        ;} STRUCTATTR TPerOSReadCfg_Response;
                        ;
                        ;// Structure for CMD_OS_WRITE_CFG
                        ;typedef struct
                        ;{
                        ;  uns8  Undefined;
                        ;  uns8  Configuration[31];
                        ;  uns8  RFPGM;
                        ;} STRUCTATTR TPerOSWriteCfg_Request;
                        ;
                        ;// Structures for CMD_OS_WRITE_CFG_BYTE
                        ;typedef struct
                        ;{
                        ;  uns8  Address;
                        ;  uns8  Value;
                        ;  uns8  Mask;
                        ;} STRUCTATTR TPerOSWriteCfgByteTriplet;
                        ;
                        ;// Structure for CMD_OS_WRITE_CFG_BYTE
                        ;typedef struct
                        ;{
                        ;  TPerOSWriteCfgByteTriplet Triplets[DPA_MAX_DATA_LENGTH / sizeof( TPerOSWriteCfgByteTriplet )];
                        ;} STRUCTATTR TPerOSWriteCfgByte_Request;
                        ;
                        ;// Structure for CMD_OS_SET_SECURITY
                        ;typedef struct
                        ;{
                        ;  uns8  Type;
                        ;  uns8  Data[16];
                        ;} STRUCTATTR TPerOSSetSecurity_Request;
                        ;
                        ;// Structure for CMD_OS_LOAD_CODE
                        ;typedef struct
                        ;{
                        ;  uns8  Flags;
                        ;  uns16 Address;
                        ;  uns16 Length;
                        ;  uns16 CheckSum;
                        ;} STRUCTATTR TPerOSLoadCode_Request;
                        ;
                        ;// Structure for CMD_OS_SLEEP
                        ;typedef struct
                        ;{
                        ;  uns16 Time;
                        ;  uns8  Control;
                        ;} STRUCTATTR TPerOSSleep_Request;
                        ;
                        ;// Structure for CMD_OS_SELECTIVE_BATCH
                        ;typedef struct
                        ;{
                        ;  uns8  SelectedNodes[30];
                        ;  uns8  Requests[DPA_MAX_DATA_LENGTH - 30];
                        ;} STRUCTATTR TPerOSSelectiveBatch_Request;
                        ;
                        ;// Structure for CMD_OS_TEST_RF_SIGNAL request
                        ;typedef struct
                        ;{
                        ;  uns8  Channel;
                        ;  uns8  RXfilter;
                        ;  uns16 Time;
                        ;} STRUCTATTR TPerOSTestRfSignal_Request;
                        ;
                        ;// Structure for CMD_OS_TEST_RF_SIGNAL response
                        ;typedef struct
                        ;{
                        ;  uns8  Counter;
                        ;} STRUCTATTR TPerOSTestRfSignal_Response;
                        ;
                        ;// Structure for CMD_OS_INDICATE request
                        ;typedef struct
                        ;{
                        ;  uns8  Control;
                        ;} STRUCTATTR TPerOSIndicate_Request;
                        ;
                        ;// Structure for general memory request
                        ;typedef struct
                        ;{
                        ;  // Address of data to write or read
                        ;  uns8  Address;
                        ;
                        ;  union
                        ;  {
                        ;    // Memory read request
                        ;    struct
                        ;    {
                        ;      // Length of data to read
                        ;      uns8  Length;
                        ;    } Read;
                        ;
                        ;    // Size of Address field
                        ;#define MEMORY_WRITE_REQUEST_OVERHEAD   ( sizeof( uns8 ) )
                        ;
                        ;    // Memory write request
                        ;    struct
                        ;    {
                        ;      uns8  PData[DPA_MAX_DATA_LENGTH - MEMORY_WRITE_REQUEST_OVERHEAD];
                        ;    } Write;
                        ;
                        ;  } ReadWrite;
                        ;} STRUCTATTR TPerMemoryRequest;
                        ;
                        ;// Structure for general extended memory request
                        ;typedef struct
                        ;{
                        ;  // Address of data to write or read
                        ;  uns16 Address;
                        ;
                        ;  union
                        ;  {
                        ;    // Memory read request
                        ;    struct
                        ;    {
                        ;      // Length of data to read
                        ;      uns8  Length;
                        ;    } Read;
                        ;
                        ;    // Size of Address field
                        ;#define XMEMORY_WRITE_REQUEST_OVERHEAD  ( sizeof( uns16 ) )
                        ;
                        ;    // Memory write request
                        ;    struct
                        ;    {
                        ;      uns8  PData[DPA_MAX_DATA_LENGTH - XMEMORY_WRITE_REQUEST_OVERHEAD];
                        ;    } Write;
                        ;
                        ;  } ReadWrite;
                        ;} STRUCTATTR TPerXMemoryRequest;
                        ;
                        ;// Structure for CMD_IO requests
                        ;typedef struct
                        ;{
                        ;  uns8  Port;
                        ;  uns8  Mask;
                        ;  uns8  Value;
                        ;} STRUCTATTR TPerIOTriplet;
                        ;
                        ;typedef struct
                        ;{
                        ;  uns8  Header; // == PNUM_IO_DELAY
                        ;  uns16 Delay;
                        ;} STRUCTATTR TPerIODelay;
                        ;
                        ;// Union for CMD_IO_SET and CMD_IO_DIRECTION requests
                        ;typedef union
                        ;{
                        ;  TPerIOTriplet Triplets[DPA_MAX_DATA_LENGTH / sizeof( TPerIOTriplet )];
                        ;  TPerIODelay   Delays[DPA_MAX_DATA_LENGTH / sizeof( TPerIODelay )];
                        ;} STRUCTATTR TPerIoDirectionAndSet_Request;
                        ;
                        ;// Structure returned by CMD_THERMOMETER_READ
                        ;typedef struct
                        ;{
                        ;  int8  IntegerValue;
                        ;  int16 SixteenthValue;
                        ;} STRUCTATTR TPerThermometerRead_Response;
                        ;
                        ;// Structure for CMD_UART_OPEN
                        ;typedef struct
                        ;{
                        ;  uns8  BaudRate;
                        ;} STRUCTATTR TPerUartOpen_Request;
                        ;
                        ;// Structure for CMD_UART_[CLEAR_]WRITE_READ
                        ;typedef struct
                        ;{
                        ;  uns8  ReadTimeout;
                        ;  uns8  WrittenData[DPA_MAX_DATA_LENGTH - sizeof( uns8 )];
                        ;} STRUCTATTR TPerUartWriteRead_Request;
                        ;
                        ;// Structure for CMD_FRC_SEND
                        ;typedef struct
                        ;{
                        ;  uns8  FrcCommand;
                        ;  uns8  UserData[30];
                        ;} STRUCTATTR TPerFrcSend_Request;
                        ;
                        ;// Structure for CMD_FRC_SEND_SELECTIVE
                        ;typedef struct
                        ;{
                        ;  uns8  FrcCommand;
                        ;  uns8  SelectedNodes[30];
                        ;  uns8  UserData[25];
                        ;} STRUCTATTR TPerFrcSendSelective_Request;
                        ;
                        ;// Structure returned by CMD_FRC_SEND and CMD_FRC_SEND_SELECTIVE
                        ;typedef struct
                        ;{
                        ;  uns8  Status;
                        ;  uns8  FrcData[DPA_MAX_DATA_LENGTH - sizeof( uns8 )];
                        ;} STRUCTATTR TPerFrcSend_Response;
                        ;
                        ;// Structure for request and response of CMD_FRC_SET_PARAMS
                        ;typedef struct
                        ;{
                        ;  uns8  FrcParams;
                        ;} STRUCTATTR TPerFrcSetParams_RequestResponse;
                        ;
                        ;// Interface and CMD_COORDINATOR_BRIDGE confirmation structure
                        ;typedef struct
                        ;{
                        ;  // Number of hops
                        ;  uns8  Hops;
                        ;  // Time slot length in 10ms
                        ;  uns8  TimeSlotLength;
                        ;  // Number of hops for response
                        ;  uns8  HopsResponse;
                        ;} STRUCTATTR TIFaceConfirmation;
                        ;
                        ;// ---------------------------------------------------------
                        ;
                        ;// DPA Message data structure (packet w/o NADR, PNUM, PCMD, HWPID)
                        ;typedef union
                        ;{
                        ;  // General DPA request
                        ;  struct
                        ;  {
                        ;    uns8    PData[DPA_MAX_DATA_LENGTH];
                        ;  } Request;
                        ;
                        ;  // General DPA response
                        ;  struct
                        ;  {
                        ;    uns8    PData[DPA_MAX_DATA_LENGTH];
                        ;  } Response;
                        ;
                        ;  // Enumerate peripherals structure
                        ;  TEnumPeripheralsAnswer EnumPeripheralsAnswer;
                        ;
                        ;  // Get peripheral info structure (CMD_GET_PER_INFO)
                        ;  TPeripheralInfoAnswer PeripheralInfoAnswer;
                        ;
                        ;  // Get peripheral info structure (CMD_GET_PER_INFO) for more peripherals
                        ;  TPeripheralInfoAnswer PeripheralInfoAnswers[MAX_PERIPHERALS_PER_BLOCK_INFO];
                        ;
                        ;  // Error DPA response (PNUM_ERROR_FLAG)
                        ;  TErrorAnswer ErrorAnswer;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_ADDR_INFO
                        ;  TPerCoordinatorAddrInfo_Response PerCoordinatorAddrInfo_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_BOND_NODE
                        ;  TPerCoordinatorBondNode_Request PerCoordinatorBondNode_Request;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_BOND_NODE or CMD_COORDINATOR_SMART_CONNECT
                        ;  TPerCoordinatorBondNodeSmartConnect_Response PerCoordinatorBondNodeSmartConnect_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_REMOVE_BOND
                        ;  TPerCoordinatorRemoveBond_Request PerCoordinatorRemoveBond_Request;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_REMOVE_BOND
                        ;  TPerCoordinatorRemoveBond_Response PerCoordinatorRemoveBond_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_DISCOVERY
                        ;  TPerCoordinatorDiscovery_Request PerCoordinatorDiscovery_Request;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_DISCOVERY
                        ;  TPerCoordinatorDiscovery_Response PerCoordinatorDiscovery_Response;
                        ;
                        ;  // Structure for and also returned by CMD_COORDINATOR_SET_DPAPARAMS
                        ;  TPerCoordinatorSetDpaParams_Request_Response PerCoordinatorSetDpaParams_Request_Response;
                        ;
                        ;  // Structure for and also returned by CMD_COORDINATOR_SET_HOPS
                        ;  TPerCoordinatorSetHops_Request_Response PerCoordinatorSetHops_Request_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_BACKUP and CMD_NODE_BACKUP
                        ;  TPerCoordinatorNodeBackup_Request PerCoordinatorNodeBackup_Request;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_BACKUP and CMD_NODE_BACKUP
                        ;  TPerCoordinatorNodeBackup_Response PerCoordinatorNodeBackup_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_RESTORE and CMD_NODE_RESTORE
                        ;  TPerCoordinatorNodeRestore_Request PerCoordinatorNodeRestore_Request;
                        ;
                        ;  // Structure for CMD_COORDINATOR_AUTHORIZE_BOND
                        ;  TPerCoordinatorAuthorizeBond_Request PerCoordinatorAuthorizeBond_Request;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_AUTHORIZE_BOND
                        ;  TPerCoordinatorAuthorizeBond_Response PerCoordinatorAuthorizeBond_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_BRIDGE
                        ;  TPerCoordinatorBridge_Request PerCoordinatorBridge_Request;
                        ;
                        ;  // Structure returned by CMD_COORDINATOR_BRIDGE
                        ;  TPerCoordinatorBridge_Response PerCoordinatorBridge_Response;
                        ;
                        ;  // Structure for CMD_COORDINATOR_SMART_CONNECT
                        ;  TPerCoordinatorSmartConnect_Request PerCoordinatorSmartConnect_Request;
                        ;
                        ;  // Structure for CMD_COORDINATOR_SET_MID
                        ;  TPerCoordinatorSetMID_Request PerCoordinatorSetMID_Request;
                        ;
                        ;  // Structure returned by CMD_NODE_READ
                        ;  TPerNodeRead_Response PerNodeRead_Response;
                        ;
                        ;  // Structure for CMD_NODE_VALIDATE_BONDS
                        ;  TPerNodeValidateBonds_Request PerNodeValidateBonds_Request;
                        ;
                        ;  // Structure returned by CMD_OS_READ
                        ;  TPerOSRead_Response PerOSRead_Response;
                        ;
                        ;  // Structure returned by CMD_OS_READ_CFG
                        ;  TPerOSReadCfg_Response PerOSReadCfg_Response;
                        ;
                        ;  // Structure for CMD_OS_WRITE_CFG
                        ;  TPerOSWriteCfg_Request PerOSWriteCfg_Request;
                        ;
                        ;  // Structure for CMD_OS_WRITE_CFG_BYTE
                        ;  TPerOSWriteCfgByte_Request PerOSWriteCfgByte_Request;
                        ;
                        ;  // Structure for CMD_OS_SET_SECURITY
                        ;  TPerOSSetSecurity_Request PerOSSetSecurity_Request;
                        ;
                        ;  // Structure for CMD_OS_LOAD_CODE
                        ;  TPerOSLoadCode_Request PerOSLoadCode_Request;
                        ;
                        ;  // Structure for CMD_OS_SLEEP
                        ;  TPerOSSleep_Request PerOSSleep_Request;
                        ;
                        ;  // Structure for CMD_OS_SELECTIVE_BATCH
                        ;  TPerOSSelectiveBatch_Request PerOSSelectiveBatch_Request;
                        ;
                        ;  // Structure for CMD_OS_TEST_RF_SIGNAL request
                        ;  TPerOSTestRfSignal_Request PerOSTestRfSignal_Request;
                        ;
                        ;  // Structure for CMD_OS_INDICATE request
                        ;  TPerOSIndicate_Request PerOSIndicate_Request;
                        ;
                        ;  // Structure for CMD_OS_TEST_RF_SIGNAL response
                        ;  TPerOSTestRfSignal_Response PerOSTestRfSignal_Response;
                        ;
                        ;  // Structure for general memory request
                        ;  TPerMemoryRequest MemoryRequest;
                        ;
                        ;  // Structure for general extended memory request
                        ;  TPerXMemoryRequest XMemoryRequest;
                        ;
                        ;  // Structure for CMD_IO requests
                        ;  TPerIoDirectionAndSet_Request PerIoDirectionAndSet_Request;
                        ;
                        ;  // Structure returned by CMD_THERMOMETER_READ
                        ;  TPerThermometerRead_Response PerThermometerRead_Response;
                        ;
                        ;  // Structure for CMD_UART_OPEN
                        ;  TPerUartOpen_Request PerUartOpen_Request;
                        ;
                        ;  // Structure for CMD_UART_[CLEAR_]WRITE_READ
                        ;  TPerUartWriteRead_Request PerUartWriteRead_Request;
                        ;
                        ;  // Structure for CMD_FRC_SEND
                        ;  TPerFrcSend_Request PerFrcSend_Request;
                        ;
                        ;  // Structure returned by CMD_FRC_SEND and CMD_FRC_SEND_SELECTIVE
                        ;  TPerFrcSend_Response PerFrcSend_Response;
                        ;
                        ;  // Structure for CMD_FRC_SEND_SELECTIVE
                        ;  TPerFrcSendSelective_Request PerFrcSendSelective_Request;
                        ;
                        ;  // Structure for request and response of CMD_FRC_SET_PARAMS
                        ;  TPerFrcSetParams_RequestResponse PerFrcSetParams_RequestResponse;
                        ;
                        ;  // Interface and CMD_COORDINATOR_BRIDGE confirmation structure
                        ;  TIFaceConfirmation IFaceConfirmation;
                        ;} TDpaMessage;
                        ;
                        ;// Custom DPA Handler events
                        ;#define DpaEvent_DpaRequest               0
                        ;#define DpaEvent_Interrupt                1
                        ;#define DpaEvent_Idle                     2
                        ;#define DpaEvent_Init                     3
                        ;#define DpaEvent_Notification             4
                        ;#define DpaEvent_AfterRouting             5
                        ;#define DpaEvent_BeforeSleep              6
                        ;#define DpaEvent_AfterSleep               7
                        ;#define DpaEvent_Reset                    8
                        ;#define DpaEvent_DisableInterrupts        9
                        ;#define DpaEvent_FrcValue                 10
                        ;#define DpaEvent_ReceiveDpaResponse       11
                        ;#define DpaEvent_IFaceReceive             12
                        ;#define DpaEvent_ReceiveDpaRequest        13
                        ;#define DpaEvent_BeforeSendingDpaResponse 14
                        ;#define DpaEvent_PeerToPeer               15
                        ;#define DpaEvent_UserDpaValue             17
                        ;#define DpaEvent_FrcResponseTime          18
                        ;#if defined( TR7xD )
                        ;#define DpaEvent_BondingButton            19
                        ;#endif
                        ;#define DpaEvent_Indicate                 20
                        ;#define DpaEvent_VerifyLocalFrc           21
                        ;#if !defined( TR7xD )
                        ;#define DpaEvent_MenuActivated            22
                        ;#define DpaEvent_MenuItemSelected         23
                        ;#define DpaEvent_MenuItemFinalize         24
                        ;#define DpaEvent_InStandby                25
                        ;#endif
                        ;
                        ;#if defined( TR7xD )
                        ;#define DpaEvent_LAST                     DpaEvent_VerifyLocalFrc
                        ;#else
                        ;#define DpaEvent_LAST                     DpaEvent_InStandby
                        ;#endif
                        ;
                        ;// Types of the diagnostic DPA Value that is returned inside DPA response
                        ;typedef enum
                        ;{
                        ;  DpaValueType_RSSI = 0,
                        ;  DpaValueType_SupplyVoltage = 1,
                        ;  DpaValueType_System = 2,
                        ;  DpaValueType_User = 3
                        ;} TDpaValueType;
                        ;
                        ;// Type (color) of LED peripheral
                        ;typedef enum
                        ;{
                        ;  LED_COLOR_RED = 0,
                        ;  LED_COLOR_GREEN = 1,
                        ;  LED_COLOR_BLUE = 2,
                        ;  LED_COLOR_YELLOW = 3,
                        ;  LED_COLOR_WHITE = 4,
                        ;  LED_COLOR_UNKNOWN = 0xff
                        ;} TLedColor;
                        ;
                        ;// Baud rates
                        ;typedef enum
                        ;{
                        ;  DpaBaud_1200 = 0x00,
                        ;  DpaBaud_2400 = 0x01,
                        ;  DpaBaud_4800 = 0x02,
                        ;  DpaBaud_9600 = 0x03,
                        ;  DpaBaud_19200 = 0x04,
                        ;  DpaBaud_38400 = 0x05,
                        ;  DpaBaud_57600 = 0x06,
                        ;  DpaBaud_115200 = 0x07,
                        ;  DpaBaud_230400 = 0x08
                        ;} TBaudRates;
                        ;
                        ;// Useful PNUM_IO definitions
                        ;typedef enum
                        ;{
                        ;  PNUM_IO_PORTA = 0x00,
                        ;  PNUM_IO_TRISA = 0x00,
                        ;
                        ;  PNUM_IO_PORTB = 0x01,
                        ;  PNUM_IO_TRISB = 0x01,
                        ;
                        ;  PNUM_IO_PORTC = 0x02,
                        ;  PNUM_IO_TRISC = 0x02,
                        ;
                        ;  PNUM_IO_PORTE = 0x04,
                        ;  PNUM_IO_TRISE = 0x04,
                        ;
                        ;  PNUM_IO_WPUB = 0x11,
                        ;#if !defined( TR7xD )
                        ;  PNUM_IO_WPUA = 0x10,
                        ;  PNUM_IO_WPUC = 0x12,
                        ;  PNUM_IO_WPUE = 0x14,
                        ;#endif
                        ;  PNUM_IO_DELAY = 0xff,
                        ;} PNUM_IO_Definitions;
                        ;
                        ;// To test for enumeration peripherals request
                        ;#define IsDpaEnumPeripheralsRequestNoSize() ( _PNUM == PNUM_ENUMERATION && _PCMD == CMD_GET_PER_INFO )
                        ;
                        ;#if PARAM_CHECK_LEVEL >= 2
                        ;#define IsDpaEnumPeripheralsRequest() ( IsDpaEnumPeripheralsRequestNoSize() && _DpaDataLength == 0 )
                        ;#else
                        ;#define IsDpaEnumPeripheralsRequest() IsDpaEnumPeripheralsRequestNoSize()
                        ;#endif
                        ;
                        ;// To test for peripherals information request
                        ;#define IsDpaPeripheralInfoRequestNoSize()  ( _PNUM != PNUM_ENUMERATION && _PCMD == CMD_GET_PER_INFO )
                        ;
                        ;#if PARAM_CHECK_LEVEL >= 2
                        ;#define IsDpaPeripheralInfoRequest()  ( IsDpaPeripheralInfoRequestNoSize() && _DpaDataLength == 0 )
                        ;#else
                        ;#define IsDpaPeripheralInfoRequest()  IsDpaPeripheralInfoRequestNoSize()
                        ;#endif
                        ;
                        ;// Optimized macro for both testing enumeration peripherals ELSE peripherals information. See examples
                        ;#define IfDpaEnumPeripherals_Else_PeripheralInfo_Else_PeripheralRequestNoSize() if ( _PCMD == CMD_GET_PER_INFO ) if ( _PNUM == PNUM_ENUMERATION )
                        ;
                        ;#if PARAM_CHECK_LEVEL >= 2
                        ;#define IfDpaEnumPeripherals_Else_PeripheralInfo_Else_PeripheralRequest() if ( _DpaDataLength == 0 && _PCMD == CMD_GET_PER_INFO ) if ( _PNUM == PNUM_ENUMERATION )
                        ;#else
                        ;#define IfDpaEnumPeripherals_Else_PeripheralInfo_Else_PeripheralRequest() IfDpaEnumPeripherals_Else_PeripheralInfo_Else_PeripheralRequestNoSize()
                        ;#endif
                        ;
                        ;#if defined( __CC5X__ ) && !defined( CC5XnotDPA )
                        ;
                        ;// DPA message at bufferRF
                        ;TDpaMessage DpaRfMessage @bufferRF;
                        ;
                        ;// Note: Works only, because _DpaMessage.Request.PData is at the same location as bufferRF!
                        ;#define _FSR_DPA    _FSR_RF
                        ;
                        ;// Actual allocation of the RAM Peripheral memory block @ UserBank_02
                        ;bank12 uns8  PeripheralRam[PERIPHERAL_RAM_LENGTH] @ 0x620;
                        ;
                        ;// Actual DPA message parameters at memory
                        ;#define _NADR           RX
                        ;#define _NADRhigh       RTAUX
                        ;#define _PNUM           PNUM
                        ;#define _PCMD           PCMD
                        ;#define _DpaDataLength  DLEN
                        ;#define _DpaMessage     DpaRfMessage
                        ;
                        ;// Return actual DPA user routine event
                        ;#define GetDpaEvent()   userReg0
                        ;
                        ;// Stores DPA Params inside DPA request/response
                        ;#define _DpaParams      PPAR
                        ;// Get DPA Value type out of the DPA Params
                        ;#define DpaValueType()  ( _DpaParams & 0b11 )
                        ;
                        ;// When TRUE then encryptBufferRF/decryptBufferRF is done by AccessPassord
                        ;bit encryptByAccessPassword @ usedBank0[0x23].7;
                        ;
                        ;// DP2P response time-slot time in 10 ms
                        ;#define DP2P_TIMESLOT   11
                        ;
                        ;// DP2P request packet. Fills out the whole bufferRF.
                        ;typedef struct
                        ;{
                        ;  uns8  Header[3];  // 0x000000
                        ;  uns8  SelectedNodes[30];
                        ;  uns8  SlotLength;
                        ;  uns8  ResponseTxPower;
                        ;  uns8  Reserved;
                        ;  uns16 HWPID;
                        ;  uns8  PDATA[sizeofBufferRF - ( 3 + 30 + 1 + 1 + 1 ) * sizeof( uns8 ) - ( 1 ) * sizeof( uns16 )]; // size is 26 bytes
                        ;} STRUCTATTR TDP2Prequest;
                        ;
                        ;// DP2P invite packet.
                        ;typedef struct
                        ;{
                        ;  uns8  Header[3];  // 0x000001
                        ;  uns8  NADR;
                        ;  uns8  Rand[12];
                        ;} STRUCTATTR TDP2Invite;
                        ;
                        ;// DP2P confirm packet.
                        ;typedef struct
                        ;{
                        ;  uns8  Header[3];  // 0x000003
                        ;  uns8  NADR;
                        ;  uns8  Rand[12];
                        ;} STRUCTATTR TDP2Confirm;
                        ;
                        ;// DP2P response packet.
                        ;typedef struct
                        ;{
                        ;  uns8  Header[3];  // 0xFfFfFf
                        ;  uns8  NADR;
                        ;  uns8  PDATA[DPA_MAX_DATA_LENGTH];
                        ;} STRUCTATTR TDP2Presponse;
                        ;
                        ;#ifndef TR7xD
                        ;
                        ;// Menus
                        ;#define DMENU_Online                                  0x0
                        ;#define DMENU_ReadyToBond                             0x1
                        ;#define DMENU_Beaming                                 0x2
                        ;#define DMENU_Standby                                 0x3
                        ;
                        ;// Menu items
                        ;#define DMENU_Item_None                               0x0
                        ;#define DMENU_Item_Beaming                            ( DMENU_Online + 1 )
                        ;#define DMENU_Item_BondRequest                        ( DMENU_ReadyToBond + 1 )
                        ;#define DMENU_Item_ConnectivityCheck                  ( DMENU_Beaming + 1 )
                        ;#define DMENU_Item_ExitStandby                        ( DMENU_Standby + 1 )
                        ;#define DMENU_Item_StateIndication                    ( DMENU_Item_ExitStandby + 1 )
                        ;#define DMENU_Item_User1                              ( DMENU_Item_StateIndication + 1 )
                        ;#define DMENU_Item_User2                              ( DMENU_Item_User1 + 1 )
                        ;#define DMENU_Item_Standby                            ( DMENU_Item_User2 + 1 )
                        ;#define DMENU_Item_Reset                              ( DMENU_Item_Standby + 1 )
                        ;#define DMENU_Item_UnbondAndRestart                   ( DMENU_Item_Reset + 2 )
                        ;#define DMENU_Item_UnbondFactorySettingsAndRestart    ( DMENU_Item_UnbondAndRestart + 1 )
                        ;
                        ;// Flags for enabling/disabling menu items at event DpaEvent_MenuActivated (when TRUE is returned) and at DpaApiMenu call
                        ;#define DMENU_Item_Implemented_Beaming                            0b0000.0001
                        ;#define DMENU_Item_Implemented_User1                              0b0000.0100
                        ;#define DMENU_Item_Implemented_User1Confirmed                     ( DMENU_Item_Implemented_User1 | DMENU_Item_Confirm_User1 )
                        ;#define DMENU_Item_Implemented_User2                              0b0000.1000
                        ;#define DMENU_Item_Implemented_User2Confirmed                     ( DMENU_Item_Implemented_User2 | DMENU_Item_Confirm_User2 )
                        ;
                        ;#define DMENU_Item_Unimplemented_Standby                          0b0001.0000
                        ;#define DMENU_Item_Unimplemented_UnbondAndRestart                 0b0100.0000
                        ;#define DMENU_Item_Unimplemented_UnbondFactorySettingsAndRestart  0b1000.0000
                        ;
                        ;#define DMENU_Item_Confirm_User1                                  0b0000.0010
                        ;#define DMENU_Item_Confirm_User2                                  0b0010.0000
                        ;
                        ;// Flags for DpaEvent_MenuActivated when FALSE is returned
                        ;#define DMENU_MenuActivated_DoNotOpen                             0b1000.0000
                        ;
                        ;// Macro to construct value containing both menu and item values
                        ;#define MakeDMenuAndItem( menu, menuItem )            ( ((menu) << 4 ) | (menuItem) )
                        ;// Macro to get menu from menu&item value
                        ;#define GetDMenu( menuAndItem )                       ( (menuAndItem) >> 4 )
                        ;// Macro to get menu item from menu&item value
                        ;#define GetDMenuItem( menuAndItem )                   ( (menuAndItem) & 0x0F )
                        ;
                        ;#endif
                        ;// Include assembler definitions
                        ;#include "HexCodes.h"
                        ;// CC5X fix
                        ;#if __CC5X__ <= 3800 && _16LF18877 == 1
                        ;#undef  __MOVLB
                        ;#define __MOVLB(k)    (0x0140+((k)&0x3F))
                        ;#endif
                        ;
                        ;// Next code must start at the IQRF APPLICATION routine entry point
                        ;#pragma origin __APPLICATION_ADDRESS
        ORG 0x3A00

  ; FILE C:\customdpa\DPAcustomHandler.h
                        ;// *********************************************************************
                        ;//   Main Custom DPA Handler header                                    *
                        ;// *********************************************************************
                        ;// Copyright (c) MICRORISC s.r.o.
                        ;//
                        ;// File:    $RCSfile: DPAcustomHandler.h,v $
                        ;// Version: $Revision: 1.167 $
                        ;// Date:    $Date: 2024/12/05 09:28:58 $
                        ;//
                        ;// Revision history:
                        ;//   2024/11/05  Release for DPA 4.32
                        ;//   2024/04/17  Release for DPA 4.31
                        ;//   2023/03/07  Release for DPA 4.30
                        ;//   2022/10/05  Release for DPA 4.18
                        ;//   2022/02/24  Release for DPA 4.17
                        ;//   2021/08/20  Release for DPA 4.16
                        ;//   2020/09/03  Release for DPA 4.15
                        ;//   2020/04/03  Release for DPA 4.14
                        ;//   2020/02/27  Release for DPA 4.13
                        ;//   2020/01/09  Release for DPA 4.12
                        ;//   2019/12/11  Release for DPA 4.11
                        ;//   2019/10/09  Release for DPA 4.10
                        ;//   2019/06/12  Release for DPA 4.03
                        ;//   2019/06/03  Release for DPA 4.02
                        ;//   2019/03/07  Release for DPA 4.01
                        ;//   2019/01/10  Release for DPA 4.00
                        ;//   2018/10/25  Release for DPA 3.03
                        ;//   2017/11/16  Release for DPA 3.02
                        ;//   2017/08/14  Release for DPA 3.01
                        ;//   2017/03/13  Release for DPA 3.00
                        ;//   2016/09/12  Release for DPA 2.28
                        ;//   2016/04/14  Release for DPA 2.27
                        ;//   2016/03/03  Release for DPA 2.26
                        ;//   2016/01/21  Release for DPA 2.25
                        ;//   2015/12/01  Release for DPA 2.24
                        ;//   2015/10/23  Release for DPA 2.23
                        ;//   2015/09/25  Release for DPA 2.22
                        ;//   2015/09/03  Release for DPA 2.21
                        ;//   2015/08/05  Release for DPA 2.20
                        ;//   2014/10/31  Release for DPA 2.10
                        ;//   2014/04/30  Release for DPA 2.00
                        ;//   2013/10/03  Release for DPA 1.00
                        ;//
                        ;// *********************************************************************
                        ;
                        ;// Online DPA documentation https://doc.iqrf.org/DpaTechGuide/
                        ;// IQRF Standards documentation https://doc.iqrf.org/
                        ;
                        ;#ifndef _CUSTOM_DPA_HANDLER_
                        ;#define _CUSTOM_DPA_HANDLER_
                        ;
                        ;//############################################################################################
                        ;// 1st include
                        ;
                        ;// Custom DPA Handler routine declaration
                        ;bit CustomDpaHandler();
                        ;
                        ;// Various DPA flags shared between DPA and Custom DPA Handler
                        ;uns8 DpaFlags @ usedBank4[0];
                        ;
                        ;// [C][N] TRUE if I2C timeout occurred at the last DpaApiI2C?() call
                        ;bit I2CwasTimeout @ DpaFlags.0;
                        ;// [N] Flag for the 1st DpaApiSleep
                        ;bit FirstDpaApiSleep @ DpaFlags.1;
                        ;
                        ;#ifdef COORDINATOR_CUSTOM_HANDLER
                        ;// [C] TRUE if interface master is not connected (detected)
                        ;bit IFaceMasterNotConnected @ DpaFlags.2;
                        ;#endif
                        ;// [N] DPA by interface notification is sent also when there was a "reading" like DPA request
                        ;bit EnableIFaceNotificationOnRead @ DpaFlags.3;
                        ;// [N] TRUE when node was just bonded using default bonding procedure
                        ;bit NodeWasBonded @ DpaFlags.4;
                        ;// [N] When TRUE, then next call of DpaApiRfTxDpaPacket sends non-routed packet
                        ;bit NonroutedRfTxDpaPacket @ DpaFlags.7;
                        ;
                        ;// [C] Ticks (decrementing) counter usable for timing in the coordinator's Customer DPA Handler
                        ;uns16 DpaTicks @ usedBank4[1];
                        ;// [N] toutRF for LP mode, read from configuration memory after reset
                        ;uns8 LPtoutRF @ usedBank4[3];
                        ;// DPA Request/Response HWPID
                        ;uns16 _HWPID @ usedBank4[4];
                        ;// Identifies type of reset (stored at UserReg0 upon module reset). See Reset chapter at IQRF User's Guide for more information
                        ;uns8 ResetType @ usedBank4[6];
                        ;// User DPA Values to return
                        ;uns8 UserDpaValue @ usedBank4[7];
                        ;// Network depth of the DPA request/response, increases on bridging, decreases on back-bridging
                        ;uns8 NetDepth @ usedBank4[8];
                        ;// TRUE when node was at DPA Service Mode after last boot
                        ;bit DSMactivated @ usedBank4[9].0;
                        ;// If set to TRUE, then LP RX mode in the main loop can be terminated by pin, see _RLPMAT
                        ;bit LpRxPinTerminate @ usedBank4[9].1;
                        ;// If set to TRUE, then [C] executes asynchronous DPA requests received from [N]
                        ;bit AsyncReqAtCoordinator @ usedBank4[9].2;
                        ;// RX filter used at the DPA main loop checkRF call
                        ;uns8 RxFilter @ usedBank4[11];
                        ;// Countdown variable for button bonding before going to deep sleep
                        ;uns16 BondingSleepCountdown @ usedBank4[12];
                        ;#define BONDING_SLEEP_COUNTDOWN_UNIT  290
                        ;// Non-zero pseudo-random value, read-only, updated on every Reset and Idle event, at [N] only.
                        ;uns16 Random @ usedBank4[14];
                        ;// DPA value from the received packet or just to be sent to the interface.
                        ;uns8 DpaValue @ usedBank4[16];
                        ;// If non-zero then timeout value for DpaApiI2C?() calls
                        ;uns8 I2Ctimeout @ usedBank4[17];
                        ;
                        ;// Macro to return an error from the peripheral handler. If the code size is not an issue this macro is the right choice.
                        ;#define DpaApiReturnPeripheralError(error) do { \
                        ;    DpaApiSetPeripheralError( error ); \
                        ;    return Carry; \
                        ;  } while( 0 )
                        ;
                        ;// DPA API functions, see documentation for details
                        ;#define DpaApiRfTxDpaPacket( dpaValue, netDepthAndFlags ) DpaApiEntry( dpaValue, netDepthAndFlags, DPA_API_RFTX_DPAPACKET )
                        ;#define DpaApiReadConfigByte( index )                     DpaApiEntry( index, param3.low8, DPA_API_READ_CONFIG_BYTE )
                        ;#define DpaApiLocalRequest()                              DpaApiEntry( param2, param3.low8, DPA_API_LOCAL_REQUEST )
                        ;#define DpaApiSetPeripheralError( error )                 DpaApiEntry( error, param3.low8, DPA_API_SET_PERIPHERAL_ERROR )
                        ;#define DpaApiSendToIFaceMaster( dpaValue, flags )        DpaApiEntry( dpaValue, flags, DPA_API_SEND_TO_IFACEMASTER )
                        ;#define DpaApiSetRfDefaults()                             DpaApiEntry( param2, param3.low8, DPA_API_SET_RF_DEFAULTS )
                        ;#define DpaApiLocalFrc( frcCommand, replyTxPower )        DpaApiEntry( frcCommand, replyTxPower, DPA_API_LOCAL_FRC )
                        ;#define DpaApiCrc8( crc8, data )                          DpaApiEntry( crc8, data, DPA_API_CRC8 )
                        ;#define DpaApiAggregateFrc()                              DpaApiEntry( param2, param3.low8, DPA_API_AGGREGATE_FRC )
                        ;#define DpaApiSetOTK()                                    DpaApiEntry( param2, param3.low8, DPA_API_SET_OTK )
                        ;#define DpaApiI2Cinit( frequency )                        DpaApiEntry( frequency, param3.low8, DPA_API_I2C_INIT )
                        ;#define DpaApiI2Cstart( address )                         DpaApiEntry( address, param3.low8, DPA_API_I2C_START )
                        ;#define DpaApiI2Cwrite( data )                            DpaApiEntry( data, param3.low8, DPA_API_I2C_WRITE )
                        ;#define DpaApiI2Cread( ack )                              DpaApiEntry( ack, param3.low8, DPA_API_I2C_READ )
                        ;#define DpaApiI2Cstop()                                   DpaApiEntry( param2, param3.low8, DPA_API_I2C_STOP )
                        ;#define DpaApiI2CwaitForACK( address )                    DpaApiEntry( address, param3.low8, DPA_API_I2C_WAIT_FOR_ACK )
                        ;#define DpaApiI2Cshutdown()                               DpaApiEntry( param2, param3.low8, DPA_API_I2C_SHUTDOWN )
                        ;#define DpaApiI2CwaitForIdle()                            DpaApiEntry( param2, param3.low8, DPA_API_I2C_WAIT_FOR_IDLE )
                        ;#define DpaApiSleep( wdtcon )                             DpaApiEntry( wdtcon, param3.low8, DPA_API_SLEEP )
                        ;#define DpaApiAfterSleep()                                DpaApiEntry( param2, param3.low8, DPA_API_AFTER_SLEEP )
                        ;#define DpaApiRandom()                                    DpaApiEntry( param2, param3.low8, DPA_API_RANDOM )
                        ;
                        ;#ifdef COORDINATOR_CUSTOM_HANDLER
                        ;#define DpaApiRfTxDpaPacketCoordinator()                  DpaApiEntry( param2, param3.low8, DPA_API_COORDINATOR_RFTX_DPAPACKET )
                        ;#endif
                        ;
                        ;#if !defined( TR7xD )
                        ;#define DpaApiMenu( menu, flags )                         DpaApiEntry( menu, flags, DPA_API_MENU )
                        ;#define DpaApiMenuIndicateResult( ok )                    DpaApiEntry( ok, param3.low8, DPA_API_MENU_INDICATE_RESULT )
                        ;#define DpaApiMenuExecute( menuAndItem )                  DpaApiEntry( menuAndItem, param3.low8, DPA_API_MENU_EXECUTE )
                        ;#define DpaApiDeepSleep( wdtcon )                         DpaApiEntry( wdtcon, param3.low8, DPA_API_DEEP_SLEEP )
                        ;#endif
                        ;
                        ;#define DpaApiLocalFrc_StackSaver( frcCommand, replyTxPower ) \
                        ;  param2 = frcCommand; \
                        ;  param3.low8 = replyTxPower; \
                        ;  W = DPA_API_LOCAL_FRC; \
                        ;  #asm \
                        ;    DW  __MOVLP( DPA_API_ADDRESS >> 8 ); \
                        ;    DW  __CALL( DPA_API_ADDRESS ); \
                        ;    DW  __MOVLP( CUSTOM_HANDLER_ADDRESS >> 8 ); \
                        ;  #endasm \
                        ;
                        ;#define I2CcomputeFrequency( I2Cfrequency)                ( ( ( F_OSC ) / ( ( I2Cfrequency ) * 4 ) ) - 1 )
                        ;
                        ;// Wrapper routines to be called instead of DpaApi??? macros to decrease code size if more than ~2 calls are needed
                        ;void _DpaApiI2Cinit( uns8 frequency );
                        ;void _DpaApiI2Cstart( uns8 address );
                        ;void _DpaApiI2Cwrite( uns8 data );
                        ;uns8 _DpaApiI2Cread( uns8 ack );
                        ;void _DpaApiI2Cstop();
                        ;void _DpaApiI2CwaitForACK( uns8 address );
                        ;void _DpaApiI2Cshutdown();
                        ;void _DpaApiI2CwaitForIdle();
                        ;void _DpaApiSleep( uns8 wdtcon );
                        ;#if !defined( TR7xD )
                        ;void _DpaApiDeepSleep( uns8 wdtcon );
                        ;#endif
                        ;void _DpaApiSleepFirst( uns8 wdtcon );
                        ;void _DpaApiAfterSleep();
                        ;uns8 _DpaApiRandom();
                        ;void _DpaApiSetRfDefaults();
                        ;
                        ;// Helper "multi" function to decrease code size if used more times
                        ;void _DpaApiI2Cwrite0();
                        ;void _DpaApiI2CwriteAndStop( uns8 data );
                        ;uns8 _DpaApiI2CreadACK();
                        ;uns8 _DpaApiI2CreadNACK();
                        ;uns8 _DpaApiI2CreadNACKandStop();
                        ;
                        ;#ifdef COORDINATOR_CUSTOM_HANDLER
                        ;#undef  DpaEvent_Interrupt
                        ;#undef  DpaEvent_BeforeSleep
                        ;#undef  DpaEvent_AfterSleep
                        ;#undef  DpaEvent_FrcValue
                        ;#undef  DpaEvent_FrcResponseTime
                        ;#else
                        ;#undef  DpaEvent_ReceiveDpaResponse
                        ;#undef  DpaEvent_IFaceReceive
                        ;#endif
                        ;
                        ;// To detect overlapping code in case someone would put some code before this header by mistake
                        ;#pragma origin __APPLICATION_ADDRESS
        ORG 0x3A00
                        ;#pragma updateBank 0
                        ;
                        ;//############################################################################################
                        ;// Main IQRF entry point jumps to the main DPA entry point
                        ;void APPLICATION()
                        ;//############################################################################################
                        ;{
APPLICATION
                        ;  #asm
                        ;    DW  __MOVLP( MAIN_DPA_ADDRESS >> 8 );
        DW    0x31AC
                        ;  DW  __GOTO( MAIN_DPA_ADDRESS );
        DW    0x2C04
                        ;  #endasm
                        ;
                        ;#ifndef NO_CUSTOM_DPA_HANDLER
                        ;    // Fake call to force CustomDpaHandler() compilation
                        ;    CustomDpaHandler();
                        ;#endif
                        ;
                        ;  // Fake call to force DpaApiEntry() compilation
                        ;  DpaApiEntry( param2, param3.low8, W );
        GOTO  DpaApiEntry
                        ;}
                        ;
                        ;//############################################################################################
                        ;// Entry stub to the real DPA API entry
                        ;#pragma origin DPA_API_ADDRESS_ENTRY
        ORG 0x3A08
                        ;uns8  DpaApiEntry( uns8 par1 @ param2, uns8 par2 @ param3.low8, uns8 apiIndex @ W )
                        ;//############################################################################################
                        ;{
DpaApiEntry
                        ;  #asm
                        ;    DW  __MOVLP( DPA_API_ADDRESS >> 8 );
        DW    0x31AC
                        ;  DW  __CALL( DPA_API_ADDRESS );
        DW    0x2400
                        ;  DW  __MOVLP( DPA_API_ADDRESS_ENTRY >> 8 );
        DW    0x31BA
                        ;  #endasm
                        ;
                        ;    return W;
        RETURN
                        ;}
                        ;
                        ;//############################################################################################
                        ;#pragma origin DPA_API_ADDRESS_ENTRY + 0x08
        ORG 0x3A10
                        ;
                        ;//############################################################################################
                        ;
                        ;#ifndef NO_CUSTOM_DPA_HANDLER
                        ;// Next comes Custom DPA handler routine
                        ;#pragma origin CUSTOM_HANDLER_ADDRESS
                        ;#endif
                        ;
                        ;#pragma updateBank 1

        ORG 0x3800
        DATA 0046H
        DATA 0005H
        DATA 0082H
        ORG 0x0240
        DATA 0008H
        DATA 0009H
        DATA 0000H
        DATA 00FFH
        DATA 00FFH
        DATA 0001H
        DATA 0080H
        DATA 0000H
        DATA 0011H
        DATA 0009H
        DATA 0001H
        DATA 00FFH
        DATA 00FFH
        DATA 0001H
        DATA 0080H
        DATA 0080H
        DATA 00FFH
        DATA 00E8H
        DATA 0003H
        DATA 0001H
        DATA 0080H
        DATA 0000H
        DATA 00FFH
        DATA 00E8H
        DATA 0003H
        DATA 0000H
        END


; *** KEY INFO ***

; 0x0100 P0    5 word(s)  0 % : main

; 0x3A00 P7    3 word(s)  0 % : APPLICATION
; 0x3810 P7    2 word(s)  0 % : dummy
; 0x3816 P7    2 word(s)  0 % : iqrfSleep
; 0x3819 P7    2 word(s)  0 % : _debug
; 0x381C P7    2 word(s)  0 % : moduleInfo
; 0x3822 P7    2 word(s)  0 % : pulsingLEDR
; 0x3825 P7    2 word(s)  0 % : pulseLEDR
; 0x3828 P7    2 word(s)  0 % : stopLEDR
; 0x382B P7    2 word(s)  0 % : pulsingLEDG
; 0x382E P7    2 word(s)  0 % : pulseLEDG
; 0x3831 P7    2 word(s)  0 % : stopLEDG
; 0x3834 P7    2 word(s)  0 % : setOnPulsingLED
; 0x3837 P7    2 word(s)  0 % : setOffPulsingLED
; 0x383A P7    2 word(s)  0 % : eeReadByte
; 0x383D P7    2 word(s)  0 % : eeReadData
; 0x3840 P7    2 word(s)  0 % : eeWriteByte
; 0x3843 P7    2 word(s)  0 % : eeWriteData
; 0x3846 P7    2 word(s)  0 % : readFromRAM
; 0x384C P7    2 word(s)  0 % : clearBufferINFO
; 0x384F P7    2 word(s)  0 % : swapBufferINFO
; 0x3852 P7    2 word(s)  0 % : compareBufferINFO2RF
; 0x3855 P7    2 word(s)  0 % : copyBufferINFO2COM
; 0x3858 P7    2 word(s)  0 % : copyBufferINFO2RF
; 0x385B P7    2 word(s)  0 % : copyBufferRF2COM
; 0x385E P7    2 word(s)  0 % : copyBufferRF2INFO
; 0x3861 P7    2 word(s)  0 % : copyBufferCOM2RF
; 0x3864 P7    2 word(s)  0 % : copyBufferCOM2INFO
; 0x3867 P7    2 word(s)  0 % : copyMemoryBlock
; 0x386A P7    2 word(s)  0 % : startDelay
; 0x386D P7    2 word(s)  0 % : startLongDelay
; 0x3870 P7    2 word(s)  0 % : isDelay
; 0x3873 P7    2 word(s)  0 % : waitDelay
; 0x3876 P7    2 word(s)  0 % : waitMS
; 0x3879 P7    2 word(s)  0 % : startCapture
; 0x387C P7    2 word(s)  0 % : captureTicks
; 0x3882 P7    2 word(s)  0 % : waitNewTick
; 0x3885 P7    2 word(s)  0 % : enableSPI
; 0x3888 P7    2 word(s)  0 % : disableSPI
; 0x388B P7    2 word(s)  0 % : startSPI
; 0x388E P7    2 word(s)  0 % : stopSPI
; 0x3891 P7    2 word(s)  0 % : restartSPI
; 0x3894 P7    2 word(s)  0 % : getStatusSPI
; 0x3897 P7    2 word(s)  0 % : setRFpower
; 0x389A P7    2 word(s)  0 % : setLEDG
; 0x389D P7    2 word(s)  0 % : setRFchannel
; 0x38A0 P7    2 word(s)  0 % : setRFmode
; 0x38A3 P7    2 word(s)  0 % : setRFspeed
; 0x38A6 P7    2 word(s)  0 % : setRFsleep
; 0x38A9 P7    2 word(s)  0 % : setRFready
; 0x38AC P7    2 word(s)  0 % : RFTXpacket
; 0x38AF P7    2 word(s)  0 % : RFRXpacket
; 0x38B2 P7    2 word(s)  0 % : checkRF
; 0x38B8 P7    2 word(s)  0 % : amIBonded
; 0x38BB P7    2 word(s)  0 % : removeBond
; 0x38BE P7    2 word(s)  0 % : bondNewNode
; 0x38C1 P7    2 word(s)  0 % : isBondedNode
; 0x38C4 P7    2 word(s)  0 % : removeBondedNode
; 0x38C7 P7    2 word(s)  0 % : rebondNode
; 0x38CA P7    2 word(s)  0 % : clearAllBonds
; 0x38CD P7    2 word(s)  0 % : setNonetMode
; 0x38D0 P7    2 word(s)  0 % : setCoordinatorMode
; 0x38D3 P7    2 word(s)  0 % : setNodeMode
; 0x38D6 P7    2 word(s)  0 % : setNetworkFilteringOn
; 0x38D9 P7    2 word(s)  0 % : setNetworkFilteringOff
; 0x38DC P7    2 word(s)  0 % : getNetworkParams
; 0x38DF P7    2 word(s)  0 % : setRoutingOn
; 0x38E2 P7    2 word(s)  0 % : setRoutingOff
; 0x38E8 P7    2 word(s)  0 % : answerSystemPacket
; 0x38EB P7    2 word(s)  0 % : discovery
; 0x38EE P7    2 word(s)  0 % : wasRouted
; 0x38F1 P7    2 word(s)  0 % : optimizeHops
; 0x38F4 P7    2 word(s)  0 % : getSupplyVoltage
; 0x38F7 P7    2 word(s)  0 % : getTemperature
; 0x38FA P7    2 word(s)  0 % : clearBufferRF
; 0x3910 P7    2 word(s)  0 % : isDiscoveredNode
; 0x3913 P7    2 word(s)  0 % : enableRFPGM
; 0x3916 P7    2 word(s)  0 % : disableRFPGM
; 0x3919 P7    2 word(s)  0 % : setupRFPGM
; 0x391C P7    2 word(s)  0 % : runRFPGM
; 0x391F P7    2 word(s)  0 % : iqrfDeepSleep
; 0x3922 P7    2 word(s)  0 % : wasRFICrestarted
; 0x3925 P7    2 word(s)  0 % : eeeWriteData
; 0x3928 P7    2 word(s)  0 % : eeeReadData
; 0x3931 P7    2 word(s)  0 % : setINDF0
; 0x3934 P7    2 word(s)  0 % : setINDF1
; 0x3937 P7    2 word(s)  0 % : getRSSI
; 0x393A P7    2 word(s)  0 % : removeBondAddress
; 0x393D P7    2 word(s)  0 % : sendFRC
; 0x3940 P7    2 word(s)  0 % : responseFRC
; 0x3943 P7    2 word(s)  0 % : bondRequestAdvanced
; 0x3946 P7    2 word(s)  0 % : prebondNodeAtNode
; 0x3949 P7    2 word(s)  0 % : nodeAuthorization
; 0x394C P7    2 word(s)  0 % : dummy01
; 0x3958 P7    2 word(s)  0 % : setAccessPassword
; 0x395B P7    2 word(s)  0 % : setUserKey
; 0x3961 P7    2 word(s)  0 % : amIRecipientOfFRC
; 0x3964 P7    2 word(s)  0 % : setLEDR
; 0x3967 P7    2 word(s)  0 % : encryptBufferRF
; 0x396A P7    2 word(s)  0 % : decryptBufferRF
; 0x396D P7    2 word(s)  0 % : prebondNodeAtCoordinator
; 0x3970 P7    2 word(s)  0 % : setFSRs
; 0x3973 P7    2 word(s)  0 % : updateCRC16
; 0x3976 P7    2 word(s)  0 % : smartConnect
; 0x3979 P7    2 word(s)  0 % : addressBitmap
; 0x397C P7    2 word(s)  0 % : setServiceChannel
; 0x3A08 P7    4 word(s)  0 % : DpaApiEntry

; RAM usage: 1088 bytes (0 local), 3008 bytes free
; Maximum call level: 1
;  Codepage 0 has   32 word(s) :   1 %
;  Codepage 1 has    0 word(s) :   0 %
;  Codepage 2 has    0 word(s) :   0 %
;  Codepage 3 has    0 word(s) :   0 %
;  Codepage 4 has    0 word(s) :   0 %
;  Codepage 5 has    0 word(s) :   0 %
;  Codepage 6 has    0 word(s) :   0 %
;  Codepage 7 has  218 word(s) :  10 %
;  Codepage 8 has    0 word(s) :   0 %
;  Codepage 9 has    0 word(s) :   0 %
;  Codepage 10 has    0 word(s) :   0 %
;  Codepage 11 has    0 word(s) :   0 %
;  Codepage 12 has    0 word(s) :   0 %
;  Codepage 13 has    0 word(s) :   0 %
;  Codepage 14 has    0 word(s) :   0 %
;  Codepage 15 has    0 word(s) :   0 %
; Total of 250 code words (0 %)
