// *****************************************************************************
//                               IQRF OS memory                                *
// *****************************************************************************
//
// Online IQRF OS Reference Guide: http://www.iqrf.org/IQRF-OS-Reference-guide/
//
// Copyright (c) MICRORISC s.r.o.
//
// Intended for:
//   HW: TR-72D, TR-76D, TR-77D, TR-78D, TR-75D, TR-72G, TR-76G, TR-75G, TR-82G
//   OS: 4.06D, 4.06G
//
// File:    IQRF-memory.h
// Version: v1.01                                   Revision: 05/08/2022
//
// Revision history:
//   v1.01: 05/08/2022  User Flash memory codepages added.
//   v1.00: 03/06/2022  First release for OS 4.06D and 4.06G.
//
// *****************************************************************************

//******************************************************************************
// Temperature sensor configuration registers
//******************************************************************************
typedef struct                                      // Default setting: 0b0000.0100
{
    bit resolution0;
    bit resolution1;
    bit powerDownMode;
    bit skipSetup;
} TmpCfg;                                           // For internal usage only

// *****************************************************************************
uns8  usedBank0[80]     @ 0x020;                    // Do not use this space
uns8  usedBank1[80]     @ 0x0A0;                    // Do not use this space
uns8  usedBank2[80]     @ 0x120;                    // Do not use this space
uns8  usedBank3[80]     @ 0x1A0;                    // Do not use this space
uns8  usedBank4[80]     @ 0x220;                    // Do not use this space
uns8  usedBank5[80]     @ 0x2A0;                    // Do not use this space
uns8  usedBank6[80]     @ 0x320;                    // Do not use this space
uns8  usedBank7[80]     @ 0x3A0;                    // Do not use this space
uns8  usedBank8[80]     @ 0x420;                    // Do not use this space
uns8  usedBank9[80]     @ 0x4A0;                    // Do not use this space
uns8  usedBank10[80]    @ 0x520;                    // Do not use this space
uns8  usedBank11[32]    @ 0x5A0;                    // Do not use 32B of bank11 (0x5A0 - 0x5BF)
// user space: bank11 48B (0x5C0 - 0x5EF) , bank12: 48B (0x620 - 0x64F) @ TR7xD or 80B (0x620 - 0x66F) @ TR7xG
#if defined TR7xG || defined TR8xG
uns8  usedBank14[80]    @ 0x720;                    // Do not use this space
#endif

#define UserBank_01     11
#define UserBank_02     12

//******************************************************************************
// Dedicated buffers and file registers
//******************************************************************************
uns8    bufferINFO[64]  @ usedBank6;                // Auxiliary buffer, 64B long
uns8    bufferCOM[64]   @ usedBank7;                // Buffer for communication routines, 64B long
uns8    bufferAUX[64]   @ usedBank8;                // Auxiliary buffer, 64B long
uns8    bufferRF[64]    @ usedBank9;                // Buffer for RF routines, 64B long

uns8    X70[16]         @ 0x70;                     // Register array in shared bank for user application
uns8    userReg0        @ X70;                      // User's register in all banks
uns8    userReg1        @ X70[1];                   // User's register in all banks
uns8    RFmodeByte      @ X70[2];                   // Current RF mode !!! Read Only !!!
uns8    param2          @ X70[3];                   // Used as parameter for function calls
uns16   param3          @ X70[4];                   // Used as parameter for function calls
uns16   param4          @ X70[6];                   // Used as parameter for function calls
uns8    bitmapBitMask   @ X70[12];                  // Bit mask from addressBitmap function
uns8    bitmapByteIndex @ X70[14];                  // Byte index from addressBitmap function
uns8    userInterface   @ X70[15];                  // See below !!! Read Only !!!

// Network params !!! Read Only !!!
bank11 uns8  ntwADDR            @ usedBank11[0x00]; // Network address
bank11 uns8  ntwVRN             @ usedBank11[0x01]; // VRN
bank11 uns8  ntwZIN             @ usedBank11[0x02]; // Zone index
bank11 uns8  ntwDID             @ usedBank11[0x03]; // Discovery ID
bank11 uns8  ntwPVRN            @ usedBank11[0x04]; // Parent VRN
bank11 uns16 ntwUSERADDRESS     @ usedBank11[0x05]; // For internal usage only
bank11 uns16 ntwID              @ usedBank11[0x07]; // Network identification (NID0/NID1)
bank11 uns8  ntwVRNFNZ          @ usedBank11[0x09]; // For internal usage only
bank11 uns8  ntwCFG             @ usedBank11[0x0A]; // Network configuration
//
bank11 uns8 memoryOffsetFrom    @ usedBank11[0x0B]; // Offset for copying buffers
bank11 uns8 memoryOffsetTo      @ usedBank11[0x0C]; // Offset for copying buffers
bank11 uns8 userStatus          @ usedBank11[0x0D]; // Register cleared by OS after power-on reset but not after other reset types
bank11 uns8 toutRF              @ usedBank11[0x0E]; // Timeout for RFRXpacket duration
bank11 uns8 RFspeed             @ usedBank11[0x0F]; // Current RF speed !!! Read Only !!!
bank11 uns8 RFpower             @ usedBank11[0x10]; // Current RF power !!! Read Only !!!
bank11 uns8 RFchannel           @ usedBank11[0x11]; // Current RF channel !!! Read Only !!!
bank11 uns8 SPIpacketLength     @ usedBank11[0x12]; // SPI packet length !!! Read Only !!!
bank11 uns8 lastRSSI            @ usedBank11[0x16]; // RSSI of last receipt !!! Read Only !!!
bank11 uns8 configFRC           @ usedBank11[0x17]; // FRC configuration
bank11 uns8 sysReg1             @ usedBank11[0x1B]; // System register
//
bank11 uns8 responseFRCvalue    @ usedBank11[0x1C]; // FRC response value for 2 bits or 1 byte FRC
bank11 uns16 responseFRCvalue2B @ usedBank11[0x1C]; // Two bytes FRC response value
bank11 uns32 responseFRCvalue4B @ usedBank11[0x1C]; // Four bytes FRC response value (use .low8, .low16, .high16, ... to access this variable at the free CC5X edition)
//
bank5 uns8 FRCextraTime         @ usedBank5[0x49];  // Additional waiting time [ticks] for FRC response
bank5 uns8 bondingMask          @ usedBank5[0x4E];  // Bonding mask for remote bonding
bank5 uns8 bondingCounter       @ usedBank5[0x4F];  // Bonding counter for remote bonding
//
bank3 TmpCfg tmpCfg             @ usedBank3[0x49];  // For internal usage only
bank3 uns16 CRC16               @ usedBank3[0x4A];  // For internal usage only
bank3 uns8 XLPticks             @ usedBank3[0x4C];  // Number of ticks remaining to end of XLP packet transmission
bank3 uns8 memoryLimit          @ usedBank3[0x4D];  // Limit for copying buffers
//
bank0 uns8 sysReg2              @ usedBank0[0x22];  // System register
//
#if defined TR7xG || defined TR8xG
bank14 uns8 randomValue         @ usedBank14[0x00]; // Random value generated by OS
#endif

//******************************************************************************
// After getStatusSPI() in param2 there are information as below
//******************************************************************************
bit _SPIRX                      @ param2.3;         // Something received on SPI
bit _SPICRCok                   @ param2.4;         // Received SPICRC (last one) was OK

//******************************************************************************
// After device reset in userReg0 there are information as below
//******************************************************************************
bit _BOR                        @ userReg0.0;       // Brown-out Reset flag
bit _POR                        @ userReg0.1;       // Power-on Reset flag
bit _RI                         @ userReg0.2;       // Reset Instruction Flag
bit _PD                         @ userReg0.3;       // Power-down flag
bit _TO                         @ userReg0.4;       // Watchdog time-out flag
bit _RMCLR                      @ userReg0.5;       // MCLR Reset flag
bit _STKUNF                     @ userReg0.6;       // Stack Underflow Reset flag
bit _STKOVF                     @ userReg0.7;       // Stack Overflow Reset flag

//******************************************************************************
// ntwCFG register
//******************************************************************************
bit _disabledRouting            @ ntwCFG.2;         // Routing enabled/disabled !!! Read Only !!!

//******************************************************************************
// userInterface register
//******************************************************************************
bit _enableUserInterrupt        @ userInterface.1;  // Enable user interrupt
bit _wasFRC                     @ userInterface.2;  // FRC packet received !!! Read Only !!!
bit _wasRouted                  @ userInterface.3;  // Packet was routed, same as wasRouted() !!! Read Only !!!
bit _916MHz                     @ userInterface.4;  // 916 MHz band selected !!! Read Only !!!
bit _filterCurrentNetwork       @ userInterface.5;  // Filtering on !!! Read Only !!!
bit _networkTwo                 @ userInterface.6;  // Network 2 selected !!! Read Only !!!
bit _networkingMode             @ userInterface.7;  // Networking selected !!! Read Only !!!

//******************************************************************************
// System registers
//******************************************************************************
bit _systemLEDindication        @ sysReg1.2;        // Enable system LED indication
bit _ignoreForcedRoutingLP      @ sysReg1.5;        // Disable Forced LP routing
//
bit _3CHTX                      @ sysReg2.1;        // TX using all 3 service channels
bit _eeeError                   @ sysReg2.3;        // External EEPROM communication error indication
bit _checkRFcfg_PQT             @ sysReg2.5;        // Enable preamble quality test for checkRF function

//******************************************************************************
// Registers dedicated to networking
//******************************************************************************
uns8 networkInfo[32]            @ usedBank5;

struct PINfield
{
    bit                 AUXF1;
    bit                 AUXF0;
    bit                 SYSPF;
    bit                 DPAF;
    bit                 CRYPTF;
    bit                 ROUTEF;
    bit                 ACKF;
    bit                 NTWF;

} PINF @ networkInfo;

bit   _NTWF             @ PINF.NTWF;                // Networking packet requested
bit   _ACKF             @ PINF.ACKF;                // Acknowledgment requested
bit   _ROUTEF           @ PINF.ROUTEF;              // Routing requested
bit   _CRYPTF           @ PINF.CRYPTF;              // Encryption requested
bit   _DPAF             @ PINF.DPAF;                // DPA protocol requested
bit   _SYSPF            @ PINF.SYSPF;               // System packet
bit   _AUXF0            @ PINF.AUXF0;               // Reserved for future use
bit   _AUXF1            @ PINF.AUXF1;               // Reserved for future use

#define _NTWF_MASK      0b1000.0000
#define _ACKF_MASK      0b0100.0000
#define _ROUTEF_MASK    0b0010.0000
#define _CRYPTF_MASK    0b0001.0000
#define _DPAF_MASK      0b0000.1000
#define _SYSPF_MASK     0b0000.0100
#define _AUXF0_MASK     0b0000.0010
#define _AUXF1_MASK     0b0000.0001

uns8  PIN               @ networkInfo;              // Packet info
uns8  DLEN              @ networkInfo[1];           // Data length in packet
uns8  RX                @ networkInfo[3];           // Addressee of packet
uns8  TX                @ networkInfo[4];           // Direct sender of packet
uns8  PID               @ networkInfo[7];           // Packet identification
uns8  RTOTX             @ networkInfo[8];           // Originated sender of packet
uns8  RTDEF             @ networkInfo[9];           // Routing definition

uns8  RTHOPS            @ networkInfo[10];          // Routing data 0 - number of hops
uns8  RTTSLOT           @ networkInfo[11];          // Routing data 1 - timeslot length [tick]
uns8  RTDID             @ networkInfo[12];          // Routing data 2 - Discovery ID (set by OS)
uns8  RTAUX             @ networkInfo[13];          // Routing data 3 - H byte for 2 byte addressing

uns8  PNUM              @ networkInfo[14];          // DPA - Peripheral number
uns8  PCMD              @ networkInfo[15];          // DPA - Peripheral command
uns8  PPAR              @ networkInfo[16];          // DPA - Peripheral parameter

//******************************************************************************
// Variables for bidirectional user data exchange and MID transfer during prebonding
//******************************************************************************

// User data passed in/out during (pre)bonding.
uns8 hostUserDataToSend[4]   @ bufferINFO[22];      // [C/N] > [N] before (pre)bonding function
uns8 nodeUserDataToSend[4]   @ bufferINFO[22];      // [N] > [C/N] before (pre)bonding function
uns8 hostUserDataReceived[4] @ bufferINFO[22];      // [C/N] > [N] after (pre)bonding function
uns8 nodeUserDataReceived[4] @ bufferRF[6];         // [N] > [C/N] after (pre)bonding function

uns8 BondingNodeMID[4]  @ bufferRF[0];              // MID of the bond requesting node in the received system packet, before optional call of prebondNode(), or
                                                    // MID of prebonded Node to be authorized by nodeAuthorization(address).

//******************************************************************************
// FRC variables
//******************************************************************************
// configFRC register
bit _selectiveFRCmode               @ configFRC.0;      // Enables selective FRC
bit _2ByteFRCmode                   @ configFRC.1;      // Enables two byte FRC
bit _4ByteFRCmode                   @ configFRC.2;      // Enables four byte FRC
bit _virtualFRCmode                 @ configFRC.7;      // Enables virtual FRC
bit _localFRC                       @ sysReg2.0;        // Enables local FRC

// Variables for bidirectional user data exchange during FRC
uns8 DataInSendFRC[30]                   @ bufferRF[32];// User data passed with FRC, filled-in before calling sendFRC().
uns8 DataOutBeforeResponseFRC[30]        @ bufferRF[32];// User data obtained after FRC receiving, formerly passed via DataInSendFRC.
uns8 AddressedNodesBeforeResponseFRC[30] @ bufferRF[0]; // Bitmap of Nodes the FRC wants to receive FRC value from

bit _SelectiveFRC                   @ bufferRF[30].0;   // Selective FRC indicator on Node side
bit _2ByteFRC                       @ bufferRF[30].1;   // Two byte FRC indicator on Node side
bit _4ByteFRC                       @ bufferRF[30].2;   // Four byte FRC indicator on Node side
bit _virtualFRC                     @ bufferRF[30].7;   // Virtual FRC indicator on Node side

//******************************************************************************
// TR module info
//******************************************************************************
// Module info structure available at bufferINFO after calling moduleInfo();
typedef struct
{
    uns8       MID[4];
    uns8       OsVersion;
    uns8       TrType;
    uns16      OsBuild;
} TModuleInfo;

TModuleInfo ModuleInfo @ bufferINFO;

//******************************************************************************
// Constants
//******************************************************************************
#define __EEESTART                      0x0200      // Virtual begin of external EEPROM

#define __EESTART                       0xF000      // Begin of internal EEPROM
#define __EEAPPINFO                     0xF0A0      // EEPROM user's application data, 32B

#define __EXTENDED_FLASH                0x2C00      // Begin of extended Flash memory
#define __LICENSED_FLASH                __EXTENDED_FLASH
#define __EXTENDED_FLASH_NEXT_PAGE      0x3000      // Next page of extended Flash memory
#define __USER_FLASH_PAGE_6             0x3000      // Next page of extended Flash memory
#define __LICENSED_FLASH_NEXT_PAGE      __EXTENDED_FLASH_NEXT_PAGE
#define __MAX_LICENSED_FLASH_ADDRESS    0x37BF      // Maximum address at licensed Flash memory

#if defined TR7xD
    #define __USER_INTERRUPT            0x3F00      // User interrupt address
    #define __MAX_FLASH_ADDRESS         0x3FFF      // Maximum Flash memory address
#elif defined TR7xG || defined TR8xG
    #define __USER_FLASH_PAGE_8         0x4000
    #define __USER_FLASH_PAGE_9         0x4800
    #define __USER_INTERRUPT            0x4F00      // User interrupt address
    #define __MAX_USER_FLASH_ADDRESS    0x4FFF      // Maximum user Flash memory address
    #define __MAX_FLASH_ADDRESS         0x7FFF      // Maximum Flash memory address
#else
    #error Unsupported TR module type.
#endif

#ifndef __APPLICATION_ADDRESS
#define __APPLICATION_ADDRESS           0x3A00      // Begin of user application Flash memory
#endif

#define __FRCOMMAND                     0x0D        // FRC command
#define __FRCOMMANDADV                  0x0C        // Advanced FRC command

//******************************************************************************
// I/O definitions
//******************************************************************************
    #define _SDO        LATC.5                      // SPI SDO (output)
    #define _SDI        PORTC.4                     // SPI SDI (input)
    #define _SCK        PORTC.3                     // SPI SCK (input)
    #define _SS         PORTA.5                     // SPI SS (input)
    #define _LEDR       LATA.2                      // Red LED (output)
    #define _LEDG       LATB.7                      // Green LED (output)

// Ext. EEPROM & temper. sensor supply voltage control (output)
#if defined TR7xD
    #define _PWRT       LATA.3
#elif defined TR7xG || defined TR8xG
    #define _PWRT       LATE.0
#else
    #error Unsupported TR module type.
#endif

#if defined TR72D || defined TR72G || defined TR82G
    #define _C1_IN      PORTA.0                     // C1 as input
    #define _C1_OUT     LATA.0                      // C1 as output
    #define _C1_TRIS    TRISA.0                     // C1 direction

    #define _C2_IN      PORTC.2                     // C2 as input
    #define _C2_OUT     LATC.2                      // C2 as output
    #define _C2_TRIS    TRISC.2                     // C2 direction

    #define _C5_IN      PORTA.5                     // C5 (SS) as input
    #define _C5_OUT     LATA.5                      // C5 (SS) as output
    #define _C5_TRIS    TRISA.5                     // C5 (SS) direction

    #define _C6_IN      PORTC.3                     // C6 (SCK) as input
    #define _C6_OUT     LATC.3                      // C6 (SCK) as output
    #define _C6_TRIS    TRISC.3                     // C6 (SCK) direction

    #define _C7_IN      PORTC.4                     // C7 (SDI) as input
    #define _C7_OUT     LATC.4                      // C7 (SDI) as output
    #define _C7_TRIS    TRISC.4                     // C7 (SDI) direction

    #define _C8_IN      PORTC.5                     // C8 (SDO) as input
    #define _C8_OUT     LATC.5                      // C8 (SDO) as output
    #define _C8_TRIS    TRISC.5                     // C8 (SDO) direction

#elif defined TR76D || defined TR77D || defined TR76G
    #define _WAKEUP     PORTB.4                     // Wake-up (Q12) (input)

    #define _Q4_IN      PORTC.6                     // Q4 as input
    #define _Q4_OUT     LATC.6                      // Q4 as output
    #define _Q4_TRIS    TRISC.6                     // Q4 direction

    #define _Q5_IN      PORTC.7                     // Q5 as input
    #define _Q5_OUT     LATC.7                      // Q5 as output
    #define _Q5_TRIS    TRISC.7                     // Q5 direction

    #define _Q6_IN      PORTC.3                     // Q6 (SCK) as input
    #define _Q6_OUT     LATC.3                      // Q6 (SCK) as output
    #define _Q6_TRIS    TRISC.3                     // Q6 (SCK) direction

    #define _Q7_IN      PORTC.4                     // Q7 (SDI) as input
    #define _Q7_OUT     LATC.4                      // Q7 (SDI) as output
    #define _Q7_TRIS    TRISC.4                     // Q7 (SDI) direction

    #define _Q8_IN      PORTC.5                     // Q8 (SDO) as input
    #define _Q8_OUT     LATC.5                      // Q8 (SDO) as output
    #define _Q8_TRIS    TRISC.5                     // Q8 (SDO) direction

    #define _Q9_IN      PORTA.5                     // Q9 (SS) as input
    #define _Q9_OUT     LATA.5                      // Q9 (SS) as output
    #define _Q9_TRIS    TRISA.5                     // Q9 (SS) direction

    #define _Q10_IN     PORTB.7                     // Q10 (LEDG) as input
    #define _Q10_OUT    LATB.7                      // Q10 (LEDG) as output
    #define _Q10_TRIS   TRISB.7                     // Q10 (LEDG) direction

    #define _Q11_IN     PORTA.2                     // Q11 (LEDR) as input
    #define _Q11_OUT    LATA.2                      // Q11 (LEDR) as output
    #define _Q11_TRIS   TRISA.2                     // Q11 (LEDR) direction

    #define _Q12_IN     PORTB.4                     // Q12 (wake-up) as input
    #define _Q12_OUT    LATB.4                      // Q12 (wake-up) as output
    #define _Q12_TRIS   TRISB.4                     // Q12 (wake-up) direction

    #define _Q13_IN     PORTE.3                     // Q13 as input (input only)
    #define _Q13_TRIS   TRISE.3                     // Q13 direction

    #define _Q14_IN     PORTA.0                     // Q14 as input
    #define _Q14_OUT    LATA.0                      // Q14 as output
    #define _Q14_TRIS   TRISA.0                     // Q14 direction

    #define _Q15_IN     PORTC.2                     // Q15 as input
    #define _Q15_OUT    LATC.2                      // Q15 as output
    #define _Q15_TRIS   TRISC.2                     // Q15 direction

#elif defined TR78D
    #define _Q3_IN      PORTC.4                     // Q3 (SDI) as input
    #define _Q3_OUT     LATC.4                      // Q3 (SDI) as output
    #define _Q3_TRIS    TRISC.4                     // Q3 (SDI) direction

    #define _Q4_IN      PORTC.5                     // Q4 (SDO) as input
    #define _Q4_OUT     LATC.5                      // Q4 (SDO) as output
    #define _Q4_TRIS    TRISC.5                     // Q4 (SDO) direction

    #define _Q5_IN      PORTA.5                     // Q5 (SS) as input
    #define _Q5_OUT     LATA.5                      // Q5 (SS) as output
    #define _Q5_TRIS    TRISA.5                     // Q5 (SS) direction

    #define _Q6_IN      PORTC.3                     // Q6 (SCK) as input
    #define _Q6_OUT     LATC.3                      // Q6 (SCK) as output
    #define _Q6_TRIS    TRISC.3                     // Q6 (SCK) direction

#elif defined TR75D || defined TR75G
    #define _WAKEUP     PORTB.4                     // Wake-up (Q2) (input)

    #define _Q2_IN      PORTB.4                     // Q2 (wake-up) as input
    #define _Q2_OUT     LATB.4                      // Q2 (wake-up) as output
    #define _Q2_TRIS    TRISB.4                     // Q2 (wake-up) direction

    #define _Q3_IN      PORTA.5                     // Q3 (SS) as input
    #define _Q3_OUT     LATA.5                      // Q3 (SS) as output
    #define _Q3_TRIS    TRISA.5                     // Q3 (SS) direction

    #define _Q4_IN      PORTC.5                     // Q4 (SDO) as input
    #define _Q4_OUT     LATC.5                      // Q4 (SDO) as output
    #define _Q4_TRIS    TRISC.5                     // Q4 (SDO) direction

    #define _Q5_IN      PORTC.4                     // Q5 (SDI) as input
    #define _Q5_OUT     LATC.4                      // Q5 (SDI) as output
    #define _Q5_TRIS    TRISC.4                     // Q5 (SDI) direction

    #define _Q6_IN      PORTC.3                     // Q6 (SCK) as input
    #define _Q6_OUT     LATC.3                      // Q6 (SCK) as output
    #define _Q6_TRIS    TRISC.3                     // Q6 (SCK) direction

    #define _Q8_IN      PORTE.3                     // Q8 as input (input only)
    #define _Q8_TRIS    TRISE.3                     // Q8 direction

    #define _Q9_IN      PORTA.0                     // Q9 as input
    #define _Q9_OUT     LATA.0                      // Q9 as output
    #define _Q9_TRIS    TRISA.0                     // Q9 direction

    #define _Q10_IN     PORTC.2                     // Q10 as input
    #define _Q10_OUT    LATC.2                      // Q10 as output
    #define _Q10_TRIS   TRISC.2                     // Q10 direction

    #define _Q11_IN     PORTC.7                     // Q11 as input
    #define _Q11_OUT    LATC.7                      // Q11 as output
    #define _Q11_TRIS   TRISC.7                     // Q11 direction

    #define _Q12_IN     PORTC.6                     // Q12 as input
    #define _Q12_OUT    LATC.6                      // Q12 as output
    #define _Q12_TRIS   TRISC.6                     // Q12 direction

#else
    #error IQRF-memory.h does not correspond to selected TR module type.
#endif
//******************************************************************************
#pragma rambank = UserBank_01                       // User's registers will be allocated in bank11
