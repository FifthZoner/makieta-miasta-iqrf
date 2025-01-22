// *******************************************************************
//   I2C Master Library for Custom DPA Handlers                      *
// *******************************************************************
// Copyright (c) MICRORISC s.r.o.
//
// File:    $RCSfile: I2Cmaster.c,v $
// Version: $Revision: 1.14 $
// Date:    $Date: 2024/09/13 07:35:05 $
//
// Revision history:
//   2021/08/20  Release for DPA 4.16
//   2020/01/02  Release for DPA 4.11
//
// *********************************************************************

#ifndef __I2C_MASTER__
#define __I2C_MASTER__

#if DPA_VERSION_MASTER >= 0x0416
#warning I2Cmaster.c is obsolete, use DPA API calls DpaApiI2C ? ? ? instead
#endif

//############################################################################################

// Default I2C speed value. Redefine at your code if needed.
// #define I2Cfrequency      100000

// Define to keep value read by i2c_read???() in the global variable i2cReadData
// i2cReadData_GLOBAL

// I2C routines. Note: routines do not modify FSR1
void i2c_init();
void i2c_shutdown();
void i2c_waitForIdle();
void i2c_start( uns8 address );
void i2c_startAndWrite( uns8 i2cWriteData, uns8 address );
void i2c_stop();
uns8 i2c_read( bit ack );
uns8 i2c_readACK();
uns8 i2c_readNACK();
uns8 i2c_readNACKandStop();
void i2c_write( uns8 i2cWriteData );  // Note: also does not modify FSR0
void i2c_write0();   // Note: also does not modify FSR0
void i2c_writeAndStop( uns8 i2cWriteData );

#ifdef i2cReadData_GLOBAL
uns8 i2cReadData;
#endif

//############################################################################################
#else

#pragma library 1				// Compile only used methods

// I2C SCL frequency [Hz]
#ifndef I2Cfrequency
#define I2Cfrequency      100000
#endif

#ifndef i2c_start_ENTRY
#define i2c_start_ENTRY() do {} while (0)
#endif

#ifndef i2c_stop_EXIT
#define i2c_stop_EXIT()   do {} while (0)
#endif

#ifndef USE_FSRx
//############################################################################################
void writeToSSPCON2( uns8 value )
//############################################################################################
{
  writeToRAM( &SSPCON2, value );
}
#else
#define writeToSSPCON2( value ) SSPCON2 = (value)
#endif

#ifndef USE_FSRx
//############################################################################################
void writeOredToSSPCON2( uns8 value @ W )
//############################################################################################
{
  writeToSSPCON2( SSPCON2 | value );
}
#else
#define writeOredToSSPCON2( value ) SSPCON2 |= (value)
#endif

//############################################################################################
void i2c_init()
//############################################################################################
{
  // SCL as input
  TRISC.3 = 1;
  // SDA as input
  TRISC.4 = 1;

  // I2C: Synchronous Serial Port Enable, I2C Master mode
#ifndef USE_FSRx
  writeToRAM( &SSPCON1, 0b0010.1000 );
#else
  SSPCON1 = 0b0010.1000;
#endif
  writeToSSPCON2( 0x00 );

  // I2C SCL frequency
  SSPADD = ( F_OSC / ( I2Cfrequency * 4 ) ) - 1;
  // Disable slew rate control
  SMP = 1;
}

//############################################################################################
void i2c_shutdown()
//############################################################################################
{
  // I2C master mode     SSPCON = 0
#ifndef USE_FSRx
  writeToRAM( &SSPCON1, 0x00 );
#else
  SSPCON1 = 0x00;
#endif
}

//############################################################################################
#ifndef i2c_waitForIdle_REDEFINE
void i2c_waitForIdle()
//############################################################################################
{
  // Wait for idle and not writing
  while ( ( SSPCON2 & 0b0001.1111 ) != 0 || RW_ );
}
#endif

//############################################################################################
void i2c_start( uns8 address )
//############################################################################################
{
  i2c_start_ENTRY();

  i2c_waitForIdle();
  // SEN = 1
  writeOredToSSPCON2( 0x01 );
  i2c_write( address );
}

//############################################################################################
void i2c_startAndWrite( uns8 i2cWriteData, uns8 address @ W )
//############################################################################################
{
  i2c_start( address );
  i2c_write( i2cWriteData );
}

//############################################################################################
void i2c_stop()
//############################################################################################
{
  i2c_waitForIdle();
  // PEN = 1
  writeOredToSSPCON2( 0x04 );

  i2c_stop_EXIT();
}

//############################################################################################
uns8 i2c_read( bit ack )
//############################################################################################
{
  i2c_waitForIdle();
  // RCEN = 1
  writeOredToSSPCON2( 0x08 );
  i2c_waitForIdle();

#ifndef i2cReadData_GLOBAL
  uns8  // Local, not global static variable
#endif
    i2cReadData = SSPBUF;

  i2c_waitForIdle();

  // Acknowledge, ACKDT = 0
  writeToSSPCON2( SSPCON2 & ~0x20 );
  if ( !ack )
    // Not acknowledge, ACKDT = 1
    writeOredToSSPCON2( 0x20 );

  // Send acknowledge sequence from ACKDT, ACKEN = 1
  writeOredToSSPCON2( 0x10 );
  return i2cReadData;
}

//############################################################################################
uns8 i2c_readACK()
//############################################################################################
{
  return i2c_read( TRUE );
}

//############################################################################################
uns8 i2c_readNACK()
//############################################################################################
{
  return i2c_read( FALSE );
}

//############################################################################################
uns8 i2c_readNACKandStop()
//############################################################################################
{
  uns8 data = i2c_readNACK();
  i2c_stop();
  return data;
}

//############################################################################################
void i2c_write( uns8 i2cWriteData )
//############################################################################################
{
  i2c_waitForIdle();
  SSPBUF = i2cWriteData;
}

//############################################################################################
void i2c_writeAndStop( uns8 i2cWriteData @ W )
//############################################################################################
{
  i2c_write( i2cWriteData );
  i2c_stop();
}

//############################################################################################
void i2c_write0()
//############################################################################################
{
  i2c_write( 0 );
}
//############################################################################################

#pragma library 0

#endif
//############################################################################################
