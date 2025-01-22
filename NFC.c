// *******************************************************************
//   NFC Library for Custom DPA Handlers, chip is ST25DV04K          *
// *******************************************************************
// Copyright (c) MICRORISC s.r.o.
//
// File:    $RCSfile: NFC.c,v $
// Version: $Revision: 1.23 $
// Date:    $Date: 2024/12/02 17:46:59 $
//
// Revision history:
//   2024/11/29  Release for DPA 4.3x
//   2022/02/24  Release for DPA 4.17
//   2021/08/20  Release for DPA 4.16
//   2020/01/02  Release for DPA 4.11
//
// *********************************************************************

#ifndef __I2C_NFC_LIB__
#define __I2C_NFC_LIB__

//############################################################################################

// Define to avoid deadlock when the NFC chip is not connect to the I2C bus. Pull-up resistors are required anyway!
// #define NFC_UPDATE_IGNORE_IF_MISSING

// I2C chips addresses
#define I2C_ADDRESS_NFC             0b1010.0110
#define I2C_ADDRESS_NFC_SYS         0b1010.1110

// NFC chip ID
#ifndef NFC_IC_REF
#define NFC_IC_REF  0x24  // = ST25DV04K
#endif

// NFC routines
bit NfcIsPresent();
bit NfcUpdateIQRFcode();
bit NfcConfigure();
void NfcWaitIsReady();

// NFC low level routines
uns8 NfcReadByte( uns16 addr, uns8 device );
void NfcSysWriteByte( uns8 addrLow, uns8 data );
// Reads bytes to bufferRF
void NfcReadBytes( uns16 addr, uns8 length, uns8 device );
// Writes bytes from bufferRF
void NfcWriteBytes( uns16 addr, uns8 length, uns8 device );

#ifndef USE_FSRx
void setINDF1inc( uns8 data );
#else
#define setINDF1inc( data ) do { *FSR1++ = data; } while(0)
#endif

#if DPA_VERSION_MASTER >= 0x0416
#define _i2c_start        _DpaApiI2Cstart
#define _i2c_stop         _DpaApiI2Cstop
#define _i2c_read         _DpaApiI2Cread
#define _i2c_write        _DpaApiI2Cwrite
#define _i2c_waitForIdle  _DpaApiI2CwaitForIdle
#define _i2c_shutdown     _DpaApiI2Cshutdown
#else
#define _i2c_start        i2c_start      
#define _i2c_stop         i2c_stop       
#define _i2c_read         i2c_read       
#define _i2c_write        i2c_write      
#define _i2c_waitForIdle  i2c_waitForIdle
#define _i2c_shutdown     i2c_shutdown

#ifndef __I2C_MASTER__
#define __INCLUDE__I2C_MASTER__
#include "lib/I2Cmaster.c"
#endif

#endif

//############################################################################################
#else

#pragma library 1				// Compile only used methods

#ifdef __INCLUDE__I2C_MASTER__
#include "lib/I2Cmaster.c"
#endif

#ifndef USE_FSRx
// ############################################################################################
void setINDF1inc( uns8 data @ W )
// ############################################################################################
{
#pragma updateBank exit = UserBank_01
  setINDF1( data );
  FSR1++;
}
#endif

// ############################################################################################
uns8 NfcCfgByte( uns8 addr @ W )
// ############################################################################################
{
  skip( addr );
#pragma computedGoto 1
  return 0xC6; // GPO-generuje impuls pokud dojde k RF zapisu do EEPROM a RF command EOF to response EOF.
  return 0x00; // IT_TIME-delka pulsu GPO 301us - (0x00 * 37.5us)
  return 0x01; // EH_MODE-energy harvesting 0x01 na vyzadani
  return 0x00; // RF_MNGT-RF komunikace povolena
  return 0x0C; // RFA1SS-Area1 bez hesla a povoleno pouze RF cteni, RF zapis je zakazany (tam prave ulozim IQRF code)
  return 0x03; // ENDA1-Area1 adresa 0 až 127B
  return 0x06; // RFA2SS-Area2 RF cteni bez hesla a RF zapis s heslem RF_PWD1 (zde je mozne zapsat pouze pomoci RF hesla)
  return 0x07; // ENDA2-Area2 adresa 128 až 255B
  return 0x00; // RFA3SS-Area3 RF cteni/RF zapis bez hesla
  return 0x0B; // ENDA3-Area3 adresa 256 až 383B, zbytek je Area4 384 až 512B
  return 0x00; // RFA4SS-Area4 RF cteni/RF zapis bez hesla
  return 0x00; // I2CSS-I2C pristup do pameti bez hesla
#pragma computedGoto 0
}

//############################################################################################
void nfcConfigureInternal()
//############################################################################################
{
  // Enter I2C password (8x zero)
  clearBufferRF();
  // I2C password validation code between 2 repeated passwords
  bufferRF[8] = 0x09;
  // Write password (password+0x90+password)
  NfcWriteBytes( 0x0900, 8 + 1 + 8, I2C_ADDRESS_NFC_SYS );

  // Check the password was correct (I2C_SSO_Dyn register)
  if ( NfcReadByte( 0x2004, I2C_ADDRESS_NFC ) != 1 )
  {
_NfcError:
    // No, pulse both LEDs
    userReg0 = 0;
    do
    {
      clrwdt();
      pulseLEDR();
      pulseLEDG();
      waitDelay( 20 );
    } while ( --userReg0 != 0 );
    return;
  }

  // Now configure NFC
  uns8 addr = 0; // System configuration memory address
  do {
    uns8 cfgByte = NfcCfgByte( addr );
    NfcSysWriteByte( addr, cfgByte );
    // Check the configuration was written
    if ( NfcReadByte( addr, I2C_ADDRESS_NFC_SYS ) != cfgByte )
      goto _NfcError;
  } while ( ++addr != ( 0x0B /* I2CSS-I2C register */ + 1 ) );
}

//############################################################################################
bit NfcIsPresent()
//############################################################################################
{
  return NfcReadByte( 0x0017 /* IC_REF */, I2C_ADDRESS_NFC_SYS ) == NFC_IC_REF;
}

//############################################################################################
bit NfcConfigure()
//############################################################################################
{
#pragma updateBank exit = UserBank_01

#ifdef NFC_UPDATE_IGNORE_IF_MISSING
  if ( !NfcIsPresent() )
    return Carry;
#endif

  nfcConfigureInternal();
  return TRUE;
}

//############################################################################################
void moduleInfoAndSetFSRs ()
//############################################################################################
{
  moduleInfo();
  setFSR01( _FSR_INFO, _FSR_RF );
}

//############################################################################################
bit NfcUpdateIQRFcode()
//############################################################################################
{
#if _HWPID_ > 0xFfFf
#error _HWPID_ > 0xFfFf
#endif

#if _HWPIDver_ > 0xFfFf
#error _HWPIDver_ > 0xFfFf
#endif

#ifdef NFC_UPDATE_IGNORE_IF_MISSING
  if ( !NfcIsPresent() )
    return Carry;
#endif

// ----------------------------------------------------
#if !defined( TR7xG ) && !defined( NFC_FULL_IQRF_Code )
  // Old "D" style, when only MID is checked
#define IQRFcodeLength  ( 1/*Nop+tag*/ + sizeof( ModuleInfo.MID ) + 1/*Nop+tag*/ + 16/*IBK*/ + 1/*Nop+tag*/ + sizeof( uns16 )/*HWPID*/ + 1/*End*/ )

  // Check MID for the valid IQRF Code at the NFC EEPROM, read user area from address 1 where the reversed (Big Endian) MID is supposed to be
  uns8 addr = 1 + sizeof( ModuleInfo.MID );
  // My MID address to the FSR1
#if &ModuleInfo.MID[0] == &bufferINFO[0]
  moduleInfoAndSetFSRs();
#else
#error  Cannot optimize FSR to MID address
#endif
  do
  {
    // MID matches?
    if ( NfcReadByte( --addr, I2C_ADDRESS_NFC ) != *FSR0 )
    {
      // No, configure NFC and write IQRF Code
      nfcConfigureInternal();

      // Writes IQRF Code to the EEPROM to the address 0, prepare it at bufferRF

      // Prepare MID reversed, i.e. MSB first
      moduleInfoAndSetFSRs();
      FSR0 += offsetof( TModuleInfo, MID ) + sizeof( ModuleInfo.MID );
      // Example: 0x15 ,0x81,0x11,0x2f,0x0e
      setINDF1inc( 0x15 ); // Nop tag + MID tag
      uns8 loop = sizeof( ModuleInfo.MID );
      do {
        setINDF1inc( *--FSR0 );
      } while ( --loop != 0 );

      // Prepare IBK
      memoryOffsetFrom |= 16;
      moduleInfoAndSetFSRs();
      FSR1 += 1 + sizeof( ModuleInfo.MID );
      // Example: 0x25 ,0xb6,0x03,0x3e,0x8f,0xb0,0x8c,0x9b,0xd1,0x74,0xa1,0x9f,0xc0,0x91,0xb8,0xb9,0xbf
      setINDF1inc( 0x25 ); // Nop tag + IBK tag
      loop |= 16; // IBK size
      do {
        setINDF1inc( *FSR0++ );
      } while ( --loop != 0 );

      // Prepare HWPID
      // Example: 0x35 ,0x50,0x02
      setINDF1inc( 0x35 ); // Nop tag + HWPID tag
      setINDF1inc( _HWPID_ >> 8 );
      setINDF1inc( _HWPID_ & 0xFF );

      // End tag
      setINDF1inc( 0 );

      // Write prepared IQRF Code to NFC EEPROM at address 0
      NfcWriteBytes( 0, IQRFcodeLength, I2C_ADDRESS_NFC );

      break;
    }

    // Note: *FSR0++ cannot be used in the "if" condition above, because CC5X cannot generate code
    FSR0++;
  } while ( addr != 1 );

#else
// ----------------------------------------------------
  // non-D line, full IQRF Code is compared, construct IQRF Code at bufferRF
#define IQRFcodeLength ( 1/*tags HWPID+MID*/ + sizeof( uns16 )/*HWPID*/ + sizeof( ModuleInfo.MID ) + 1/*tags HWPIDver+IBK*/ + sizeof( uns16 )/*HWPIDver*/ + 16/*IBK*/ + 1/*tags Nop+LogicalAddress*/ + sizeof( ntwADDR )/*LogicalAddress*/ + 1/*End*/ )

  moduleInfoAndSetFSRs();

  //// Prepare HWPID
  // Example: HwpId:ABCD => 0xB3, 0xDA, 0x1C
  setINDF1inc( ( ( _HWPID_ >> 4 ) & 0xF0 ) | 0x03 ); // HWPID.8-11 + HWPID tag
  setINDF1inc( ( ( (uns8)_HWPID_ << 4 ) & 0xF0 ) | ( _HWPID_ >> 12 ) );  // HWPID.0-3 + HWPID.12-15
  setINDF1inc( 0x10 | ( ( _HWPID_ >> 4 ) & 0x0F ) );  // MID tag + HWPID.4-7

  //// Prepare MID reversed, i.e. MSB first
  FSR0 += offsetof( TModuleInfo, MID ) + sizeof( ModuleInfo.MID );
  uns8 loop = sizeof( ModuleInfo.MID );
  do {
    setINDF1inc( *--FSR0 );
  } while ( --loop != 0 );

  //// Prepare HWPIDver
  // Example: HwpIdver:ABCDE => 0xB8, 0xDA, 0x2C
  setINDF1inc( ( ( _HWPIDver_ >> 4 ) & 0xF0 ) | 0x08 ); // HWPIDver.8-11 + HWPIDver tag
  setINDF1inc( ( ( (uns8)_HWPIDver_ << 4 ) & 0xF0 ) | ( _HWPIDver_ >> 12 ) );  // HWPIDver.0-3 + HWPIDver.12-15
  setINDF1inc( 0x20 | ( ( _HWPIDver_ >> 4 ) & 0x0F ) );  // IBK tag + HWPIDver.4-7

  //// Prepare IBK
  memoryOffsetFrom |= 16;
  moduleInfoAndSetFSRs();
  FSR1 += 1/*tags HWPID+MID*/ + sizeof( uns16 )/*HWPID*/ + sizeof( ModuleInfo.MID ) + 1/*tags HWPIDver+IBK*/ + sizeof( uns16 )/*HWPIDver*/;
  loop |= 16; // IBK size (loop was 0)
  do {
    setINDF1inc( *FSR0++ );
  } while ( --loop != 0 );

  //// Prepare logical address
  setINDF1inc( 0x45 ); // Nop tag + Logical address tag
  W = 0;  // Coordinator address
  // Not Coordinator( _networkingMode == 1 && _networkTwo == 0 ) ?
  if ( _networkingMode != 1 || _networkTwo != 0 ) // Note: must not modify W
  {
    Carry = amIBonded();
    W = ntwADDR;  // Bonded value, Note: must not modify Carry
    if ( !Carry ) // Note: must not modify W
      W = 0xFF; // Not bonded value
  }
  setINDF1inc( W );

  //// End tag
  setINDF1inc( 0 );
  // FSR1 is behind the end of generated IQRF Code

  // loop used both as counter and NFC address
  loop = IQRFcodeLength;
  do
  {
    FSR1--;
    // IQRF Code matches byte by byte?
    if ( NfcReadByte( --loop, I2C_ADDRESS_NFC ) != *FSR1 )
    {
      // No, set IQRF Code aside
      copyBufferRF2INFO();
      // Configure NFC chip 
      nfcConfigureInternal();
      // Get IQRF Code back
      copyBufferINFO2RF();
      // Write prepared IQRF Code to NFC EEPROM at address 0
      NfcWriteBytes( 0, IQRFcodeLength, I2C_ADDRESS_NFC );
      break;
    }
  } while ( loop != 0 );
#endif
  // ----------------------------------------------------

#undef IQRFcodeLength
  return TRUE;
}

//############################################################################################
void NfcWaitIsReady()
//############################################################################################
{
  _i2c_stop();
  do
  {
    _i2c_start( I2C_ADDRESS_NFC );
    _i2c_waitForIdle();
#if defined( TR7xG ) || defined( TR8xG )
  } while ( SSP1CON2.6 /*ACKSTAT*/ );
#else
} while ( ACKSTAT );
#endif
  _i2c_stop();
}

//############################################################################################
void NfcSysWriteByte( uns8 addrLow, uns8 data )
//############################################################################################
{
  _i2c_start( I2C_ADDRESS_NFC_SYS );
  _i2c_write( 0 );
  _i2c_write( addrLow );
  _i2c_write( data );
  NfcWaitIsReady();
}

//############################################################################################
uns8 NfcReadByte( uns16 addr, uns8 device )
//############################################################################################
{
#pragma updateBank exit = UserBank_01
  _i2c_start( device );
  _i2c_write( addr.high8 );
  _i2c_write( addr.low8 );
  _i2c_start( device | 1 );
  uns8 data = _i2c_read( FALSE );
  _i2c_stop();
  return data;
}

//############################################################################################
void NfcWriteBytes( uns16 addr, uns8 length, uns8 device @ W )
//############################################################################################
{
  _i2c_start( device );
  _i2c_write( addr.high8 );
  _i2c_write( addr.low8 );
  setFSR1( _FSR_RF );
  do {
    _i2c_write( *FSR1++ );
  } while ( --length != 0 );
  NfcWaitIsReady();
}

//############################################################################################
void NfcReadBytes( uns16 addr, uns8 length, uns8 device )
//############################################################################################
{
  _i2c_start( device );
  _i2c_write( addr.high8 );
  _i2c_write( addr.low8 );
  _i2c_start( device | 1 );
  setFSR1( _FSR_RF );
  do {
    setINDF1inc( _i2c_read( length != 1 ) );
  } while ( --length != 0 );
  _i2c_stop();
}
//############################################################################################

#pragma library 0

#endif
//############################################################################################
