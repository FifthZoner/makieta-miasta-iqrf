// *********************************************************************
//   Main Custom DPA Handler header                                    *
// *********************************************************************
// Copyright (c) MICRORISC s.r.o.
//
// File:    $RCSfile: DPAcustomHandler.h,v $
// Version: $Revision: 1.167 $
// Date:    $Date: 2024/12/05 09:28:58 $
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
//   2019/01/10  Release for DPA 4.00
//   2018/10/25  Release for DPA 3.03
//   2017/11/16  Release for DPA 3.02
//   2017/08/14  Release for DPA 3.01
//   2017/03/13  Release for DPA 3.00
//   2016/09/12  Release for DPA 2.28
//   2016/04/14  Release for DPA 2.27
//   2016/03/03  Release for DPA 2.26
//   2016/01/21  Release for DPA 2.25
//   2015/12/01  Release for DPA 2.24
//   2015/10/23  Release for DPA 2.23
//   2015/09/25  Release for DPA 2.22
//   2015/09/03  Release for DPA 2.21
//   2015/08/05  Release for DPA 2.20
//   2014/10/31  Release for DPA 2.10
//   2014/04/30  Release for DPA 2.00
//   2013/10/03  Release for DPA 1.00
//
// *********************************************************************

// Online DPA documentation https://doc.iqrf.org/DpaTechGuide/
// IQRF Standards documentation https://doc.iqrf.org/

#ifndef _CUSTOM_DPA_HANDLER_
#define _CUSTOM_DPA_HANDLER_

//############################################################################################
// 1st include

// Custom DPA Handler routine declaration
bit CustomDpaHandler();

// Various DPA flags shared between DPA and Custom DPA Handler
uns8 DpaFlags @ usedBank4[0];

// [C][N] TRUE if I2C timeout occurred at the last DpaApiI2C?() call
bit I2CwasTimeout @ DpaFlags.0;
// [N] Flag for the 1st DpaApiSleep
bit FirstDpaApiSleep @ DpaFlags.1;

#ifdef COORDINATOR_CUSTOM_HANDLER
// [C] TRUE if interface master is not connected (detected)
bit IFaceMasterNotConnected @ DpaFlags.2;
#endif
// [N] DPA by interface notification is sent also when there was a "reading" like DPA request
bit EnableIFaceNotificationOnRead @ DpaFlags.3;
// [N] TRUE when node was just bonded using default bonding procedure
bit NodeWasBonded @ DpaFlags.4;
// [N] When TRUE, then next call of DpaApiRfTxDpaPacket sends non-routed packet
bit NonroutedRfTxDpaPacket @ DpaFlags.7;

// [C] Ticks (decrementing) counter usable for timing in the coordinator's Customer DPA Handler
uns16 DpaTicks @ usedBank4[1];
// [N] toutRF for LP mode, read from configuration memory after reset
uns8 LPtoutRF @ usedBank4[3];
// DPA Request/Response HWPID
uns16 _HWPID @ usedBank4[4];
// Identifies type of reset (stored at UserReg0 upon module reset). See Reset chapter at IQRF User's Guide for more information
uns8 ResetType @ usedBank4[6];
// User DPA Values to return
uns8 UserDpaValue @ usedBank4[7];
// Network depth of the DPA request/response, increases on bridging, decreases on back-bridging
uns8 NetDepth @ usedBank4[8];
// TRUE when node was at DPA Service Mode after last boot
bit DSMactivated @ usedBank4[9].0;
// If set to TRUE, then LP RX mode in the main loop can be terminated by pin, see _RLPMAT
bit LpRxPinTerminate @ usedBank4[9].1;
// If set to TRUE, then [C] executes asynchronous DPA requests received from [N]
bit AsyncReqAtCoordinator @ usedBank4[9].2;
// RX filter used at the DPA main loop checkRF call
uns8 RxFilter @ usedBank4[11];
// Countdown variable for button bonding before going to deep sleep
uns16 BondingSleepCountdown @ usedBank4[12];
#define BONDING_SLEEP_COUNTDOWN_UNIT  290
// Non-zero pseudo-random value, read-only, updated on every Reset and Idle event, at [N] only.
uns16 Random @ usedBank4[14];
// DPA value from the received packet or just to be sent to the interface.
uns8 DpaValue @ usedBank4[16];
// If non-zero then timeout value for DpaApiI2C?() calls
uns8 I2Ctimeout @ usedBank4[17];

// Macro to return an error from the peripheral handler. If the code size is not an issue this macro is the right choice.
#define DpaApiReturnPeripheralError(error) do { \
    DpaApiSetPeripheralError( error ); \
    return Carry; \
  } while( 0 )

// DPA API functions, see documentation for details
#define DpaApiRfTxDpaPacket( dpaValue, netDepthAndFlags ) DpaApiEntry( dpaValue, netDepthAndFlags, DPA_API_RFTX_DPAPACKET )
#define DpaApiReadConfigByte( index )                     DpaApiEntry( index, param3.low8, DPA_API_READ_CONFIG_BYTE )
#define DpaApiLocalRequest()                              DpaApiEntry( param2, param3.low8, DPA_API_LOCAL_REQUEST )
#define DpaApiSetPeripheralError( error )                 DpaApiEntry( error, param3.low8, DPA_API_SET_PERIPHERAL_ERROR )
#define DpaApiSendToIFaceMaster( dpaValue, flags )        DpaApiEntry( dpaValue, flags, DPA_API_SEND_TO_IFACEMASTER )
#define DpaApiSetRfDefaults()                             DpaApiEntry( param2, param3.low8, DPA_API_SET_RF_DEFAULTS )
#define DpaApiLocalFrc( frcCommand, replyTxPower )        DpaApiEntry( frcCommand, replyTxPower, DPA_API_LOCAL_FRC )
#define DpaApiCrc8( crc8, data )                          DpaApiEntry( crc8, data, DPA_API_CRC8 )
#define DpaApiAggregateFrc()                              DpaApiEntry( param2, param3.low8, DPA_API_AGGREGATE_FRC )
#define DpaApiSetOTK()                                    DpaApiEntry( param2, param3.low8, DPA_API_SET_OTK )
#define DpaApiI2Cinit( frequency )                        DpaApiEntry( frequency, param3.low8, DPA_API_I2C_INIT )
#define DpaApiI2Cstart( address )                         DpaApiEntry( address, param3.low8, DPA_API_I2C_START )
#define DpaApiI2Cwrite( data )                            DpaApiEntry( data, param3.low8, DPA_API_I2C_WRITE )
#define DpaApiI2Cread( ack )                              DpaApiEntry( ack, param3.low8, DPA_API_I2C_READ )
#define DpaApiI2Cstop()                                   DpaApiEntry( param2, param3.low8, DPA_API_I2C_STOP )
#define DpaApiI2CwaitForACK( address )                    DpaApiEntry( address, param3.low8, DPA_API_I2C_WAIT_FOR_ACK )
#define DpaApiI2Cshutdown()                               DpaApiEntry( param2, param3.low8, DPA_API_I2C_SHUTDOWN )
#define DpaApiI2CwaitForIdle()                            DpaApiEntry( param2, param3.low8, DPA_API_I2C_WAIT_FOR_IDLE )
#define DpaApiSleep( wdtcon )                             DpaApiEntry( wdtcon, param3.low8, DPA_API_SLEEP )
#define DpaApiAfterSleep()                                DpaApiEntry( param2, param3.low8, DPA_API_AFTER_SLEEP )
#define DpaApiRandom()                                    DpaApiEntry( param2, param3.low8, DPA_API_RANDOM )

#ifdef COORDINATOR_CUSTOM_HANDLER
#define DpaApiRfTxDpaPacketCoordinator()                  DpaApiEntry( param2, param3.low8, DPA_API_COORDINATOR_RFTX_DPAPACKET )
#endif

#if !defined( TR7xD )
#define DpaApiMenu( menu, flags )                         DpaApiEntry( menu, flags, DPA_API_MENU )
#define DpaApiMenuIndicateResult( ok )                    DpaApiEntry( ok, param3.low8, DPA_API_MENU_INDICATE_RESULT )
#define DpaApiMenuExecute( menuAndItem )                  DpaApiEntry( menuAndItem, param3.low8, DPA_API_MENU_EXECUTE )
#define DpaApiDeepSleep( wdtcon )                         DpaApiEntry( wdtcon, param3.low8, DPA_API_DEEP_SLEEP )
#endif

#define DpaApiLocalFrc_StackSaver( frcCommand, replyTxPower ) \
  param2 = frcCommand; \
  param3.low8 = replyTxPower; \
  W = DPA_API_LOCAL_FRC; \
  #asm \
    DW  __MOVLP( DPA_API_ADDRESS >> 8 ); \
    DW  __CALL( DPA_API_ADDRESS ); \
    DW  __MOVLP( CUSTOM_HANDLER_ADDRESS >> 8 ); \
  #endasm \

#define I2CcomputeFrequency( I2Cfrequency)                ( ( ( F_OSC ) / ( ( I2Cfrequency ) * 4 ) ) - 1 )

// Wrapper routines to be called instead of DpaApi??? macros to decrease code size if more than ~2 calls are needed
void _DpaApiI2Cinit( uns8 frequency );
void _DpaApiI2Cstart( uns8 address );
void _DpaApiI2Cwrite( uns8 data );
uns8 _DpaApiI2Cread( uns8 ack );
void _DpaApiI2Cstop();
void _DpaApiI2CwaitForACK( uns8 address );
void _DpaApiI2Cshutdown();
void _DpaApiI2CwaitForIdle();
void _DpaApiSleep( uns8 wdtcon );
#if !defined( TR7xD )
void _DpaApiDeepSleep( uns8 wdtcon );
#endif
void _DpaApiSleepFirst( uns8 wdtcon );
void _DpaApiAfterSleep();
uns8 _DpaApiRandom();
void _DpaApiSetRfDefaults();

// Helper "multi" function to decrease code size if used more times
void _DpaApiI2Cwrite0();
void _DpaApiI2CwriteAndStop( uns8 data );
uns8 _DpaApiI2CreadACK();
uns8 _DpaApiI2CreadNACK();
uns8 _DpaApiI2CreadNACKandStop();

#ifdef COORDINATOR_CUSTOM_HANDLER
#undef  DpaEvent_Interrupt
#undef  DpaEvent_BeforeSleep
#undef  DpaEvent_AfterSleep
#undef  DpaEvent_FrcValue
#undef  DpaEvent_FrcResponseTime
#else
#undef  DpaEvent_ReceiveDpaResponse
#undef  DpaEvent_IFaceReceive
#endif

// To detect overlapping code in case someone would put some code before this header by mistake
#pragma origin __APPLICATION_ADDRESS
#pragma updateBank 0

//############################################################################################
// Main IQRF entry point jumps to the main DPA entry point
void APPLICATION()
//############################################################################################
{
  #asm
    DW  __MOVLP( MAIN_DPA_ADDRESS >> 8 );
  DW  __GOTO( MAIN_DPA_ADDRESS );
  #endasm

#ifndef NO_CUSTOM_DPA_HANDLER
    // Fake call to force CustomDpaHandler() compilation
    CustomDpaHandler();
#endif

  // Fake call to force DpaApiEntry() compilation
  DpaApiEntry( param2, param3.low8, W );
}

//############################################################################################
// Entry stub to the real DPA API entry
#pragma origin DPA_API_ADDRESS_ENTRY
uns8  DpaApiEntry( uns8 par1 @ param2, uns8 par2 @ param3.low8, uns8 apiIndex @ W )
//############################################################################################
{
  #asm
    DW  __MOVLP( DPA_API_ADDRESS >> 8 );
  DW  __CALL( DPA_API_ADDRESS );
  DW  __MOVLP( DPA_API_ADDRESS_ENTRY >> 8 );
  #endasm

    return W;
}

//############################################################################################
#pragma origin DPA_API_ADDRESS_ENTRY + 0x08

//############################################################################################

#ifndef NO_CUSTOM_DPA_HANDLER
// Next comes Custom DPA handler routine
#pragma origin CUSTOM_HANDLER_ADDRESS
#endif

#pragma updateBank 1

//############################################################################################
#else // _CUSTOM_DPA_HANDLER_
//############################################################################################
// 2nd include

#ifndef NO_CUSTOM_DPA_HANDLER

// Library wrappers and helpers to decrease code size
//############################################################################################
#pragma library 1
//############################################################################################
uns8 _DpaApiUserBank_01( uns8 apiIndex @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  return DpaApiEntry( param2, param3.low8, apiIndex );
}
//############################################################################################
void _DpaApiI2Cinit( uns8 frequency @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = frequency;
  _DpaApiUserBank_01( DPA_API_I2C_INIT );
}
//############################################################################################
void _DpaApiI2Cstart( uns8 address @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = address;
  _DpaApiUserBank_01( DPA_API_I2C_START );
}
//############################################################################################
void _DpaApiI2Cwrite0()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiI2Cwrite( 0 );
}
//############################################################################################
void _DpaApiI2Cwrite( uns8 data @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = data;
  _DpaApiUserBank_01( DPA_API_I2C_WRITE );
}
//############################################################################################
uns8 _DpaApiI2CreadNACKandStop()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = _DpaApiI2CreadNACK();
  _DpaApiI2Cstop(); /* Must not use param2 */
  return param2;
}
//############################################################################################
uns8 _DpaApiI2CreadACK()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  return _DpaApiI2Cread( 1 );
}
//############################################################################################
uns8 _DpaApiI2CreadNACK()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  return _DpaApiI2Cread( 0 );
}
//############################################################################################
uns8 _DpaApiI2Cread( uns8 ack @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = ack;
  return _DpaApiUserBank_01( DPA_API_I2C_READ );
}
//############################################################################################
void _DpaApiI2CwriteAndStop( uns8 data @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiI2Cwrite( data );
  _DpaApiI2Cstop();
}
//############################################################################################
void _DpaApiI2Cstop()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiUserBank_01( DPA_API_I2C_STOP );
}
//############################################################################################
void _DpaApiI2CwaitForACK( uns8 address @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  DpaApiI2CwaitForACK( address );
}
//############################################################################################
void _DpaApiI2Cshutdown()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiUserBank_01( DPA_API_I2C_SHUTDOWN );
}
//############################################################################################
void _DpaApiI2CwaitForIdle()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiUserBank_01( DPA_API_I2C_WAIT_FOR_IDLE );
}
//############################################################################################
void _DpaApiSleep( uns8 wdtcon @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = wdtcon;
  _DpaApiUserBank_01( DPA_API_SLEEP );
}
#if !defined( TR7xD )
//############################################################################################
void _DpaApiDeepSleep( uns8 wdtcon @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  param2 = wdtcon;
  _DpaApiUserBank_01( DPA_API_DEEP_SLEEP );
}
#endif
//############################################################################################
void _DpaApiSleepFirst( uns8 wdtcon @ W )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  FirstDpaApiSleep = TRUE;
  _DpaApiSleep( wdtcon );
}
//############################################################################################
void _DpaApiAfterSleep()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiUserBank_01( DPA_API_AFTER_SLEEP );
}
//############################################################################################
uns8 _DpaApiRandom()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  return _DpaApiUserBank_01( DPA_API_RANDOM );
}
//############################################################################################
void _DpaApiSetRfDefaults()
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _DpaApiUserBank_01( DPA_API_SET_RF_DEFAULTS );
}
//############################################################################################

// Code bumper to detect too long code of Custom DPA handler + other routines
#pragma origin CUSTOM_HANDLER_ADDRESS_END
// To avoid adding some code after handler by mistake
#pragma origin __MAX_FLASH_ADDRESS
#endif

#endif  // _CUSTOM_DPA_HANDLER_
//############################################################################################
