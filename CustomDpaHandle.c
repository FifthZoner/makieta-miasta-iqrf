// *********************************************************************
//   Custom DPA Handler code template                                  *
// *********************************************************************
// Copyright (c) MICRORISC s.r.o.
//
// File:    $RCSfile: CustomDpaHandler-Template.c,v $
// Version: $Revision: 1.77 $
// Date:    $Date: 2023/11/03 16:32:30 $
//
// Revision history:
//   2023/03/07  Release for DPA 4.30
//   2022/10/05  Release for DPA 4.18
//   2022/02/24  Release for DPA 4.17
//   2021/08/20  Release for DPA 4.16
//   2020/09/03  Release for DPA 4.15
//   2020/02/27  Release for DPA 4.13
//   2019/01/10  Release for DPA 4.00
//   2017/08/14  Release for DPA 3.01
//   2017/03/13  Release for DPA 3.00
//   2015/08/05  Release for DPA 2.20
//   2014/10/31  Release for DPA 2.10
//   2014/04/30  Release for DPA 2.00
//
// *********************************************************************

// Online DPA documentation https://doc.iqrf.org/DpaTechGuide/

/*<
This is a Custom DPA Handler with all available events prepared.
Use the following define to use a Coordinator version instead of default Node version.
`#define COORDINATOR_CUSTOM_HANDLER`
>*/

// Default IQRF include (modify the path according to your setup)
#include "IQRF.h"

// Default DPA header (modify the path according to your setup)
#include "DPA.h"
// Default Custom DPA Handler header (modify the path according to your setup)
#include "DPAcustomHandler.h"

// Uncomment the following includes if the respective component is needed
// IQRF standards header (modify the path according to your setup)
//#include "IQRFstandard.h"
//#include "IQRF_HWPID.h"
//#include "NFC.c"

#define COORDINATOR_CUSTOM_HANDLER

//############################################################################################

// Place for global variables shared among CustomDpaHandler() and other function, otherwise local [static] variables are recommended
// example: uns8 globalCounter;

// Must be the 1st defined function in the source code in order to be placed at the correct FLASH location!
//############################################################################################
// https://doc.iqrf.org/DpaTechGuide/pages/custom-dpa-handler.html
bit CustomDpaHandler()
//############################################################################################
{
  // Handler presence mark
  clrwdt();

  // Place for local static variables used only within CustomDpaHandler() among more events
  // example: static bit interruptOccured;

  // Detect DPA event to handle (unused event handlers can be commented out or even deleted)
  switch ( GetDpaEvent() )
  {
#ifdef DpaEvent_Interrupt
    // -------------------------------------------------
    case DpaEvent_Interrupt:
      // Do an extra quick background interrupt work
      // ! The time spent handling this event is critical.If there is no interrupt to handle return immediately otherwise keep the code as fast as possible.
      // ! Make sure the event is the 1st case in the main switch statement at the handler routine.This ensures that the event is handled as the 1st one.
      // ! It is desirable that this event is handled with immediate return even if it is not used by the custom handler because the Interrupt event is raised on every MCU interrupt and the �empty� return handler ensures the shortest possible interrupt routine response time.
      // ! Only global variables or local ones marked by static keyword can be used to allow reentrancy.
      // ! Make sure race condition does not occur when accessing those variables at other places.
      // ! Make sure( inspect.lst file generated by C compiler ) compiler does not create any hidden temporary local variable( occurs when using division, multiplication or bit shifts ) at the event handler code.The name of such variable is usually Cnumbercnt.
      // ! Do not call any OS functions except setINDFx().
      // ! Do not use any OS variables especially for writing access.
      // ! All above rules apply also to any other function being called from the event handler code, although calling any function from Interrupt event is not recommended because of additional MCU stack usage.
      // https://doc.iqrf.org/DpaTechGuide/pages/EventInterrupt.html
      return Carry;
#endif
      // -------------------------------------------------
    case DpaEvent_Idle:

        setLEDG();
        waitMS(25);
        stopLEDG();
        setLEDR();
        waitMS(25);
        stopLEDR();

      break;

      // -------------------------------------------------
    case DpaEvent_Reset:
      // Called after module is reset
      // https://doc.iqrf.org/DpaTechGuide/pages/ResetEvent.html

      //goto DpaHandleReturnTRUE; // return TRUE only if you handle node bonding/unbonding
      break;

#if !defined( COORDINATOR_CUSTOM_HANDLER ) && defined( DpaEvent_BondingButton )
      // -------------------------------------------------
    case DpaEvent_BondingButton:
      // Called to allow a bonding button customization
      // https://doc.iqrf.org/DpaTechGuide/pages/bondingbutton.html

      //goto DpaHandleReturnTRUE; // return TRUE to handle bonding button
      break;
#endif

#ifndef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    case DpaEvent_Indicate:
      // Called to allow a customization of the device indication
      // https://doc.iqrf.org/DpaTechGuide/pages/IndicateEvent.html

      //goto DpaHandleReturnTRUE; // return TRUE to skip default indication
      break;
#endif

      // -------------------------------------------------
    case DpaEvent_Init:
      // Do a one time initialization before main loop starts
      // https://doc.iqrf.org/DpaTechGuide/pages/init.html
      break;

      // -------------------------------------------------
    case DpaEvent_ReceiveDpaRequest:
      // Called after DPA request was received
      // https://doc.iqrf.org/DpaTechGuide/pages/receivedparequest.html

      //goto DpaHandleReturnTRUE; // return TRUE to skip default processing
      break;

      // -------------------------------------------------
    case DpaEvent_BeforeSendingDpaResponse:
      // Called before sending DPA response back to originator of DPA response
      // https://doc.iqrf.org/DpaTechGuide/pages/beforesendingdparesponse.html
      break;

      // -------------------------------------------------
    case DpaEvent_Notification:
      // Called after DPA request was processed and after DPA response was sent
      // https://doc.iqrf.org/DpaTechGuide/pages/notification.html
      break;

      // -------------------------------------------------
    case DpaEvent_AfterRouting:
      // Called after Notification and after routing of the DPA response was finished
      // https://doc.iqrf.org/DpaTechGuide/pages/afterrouting.html
      break;

#ifndef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    case DpaEvent_FrcValue:
      // Called to get FRC value
      // https://doc.iqrf.org/DpaTechGuide/pages/frcvalue.html
      break;
#endif

#ifndef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    case DpaEvent_FrcResponseTime:
      // Called to get FRC response time
      // https://doc.iqrf.org/DpaTechGuide/pages/frcresponsetime.html
      break;
#endif

#ifndef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    case DpaEvent_BeforeSleep:
      // Called before going to sleep
      // https://doc.iqrf.org/DpaTechGuide/pages/beforesleep.html
      break;
#endif

#ifndef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    case DpaEvent_AfterSleep:
      // Called after woken up after sleep
      // https://doc.iqrf.org/DpaTechGuide/pages/aftersleep.html
      break;
#endif

      // -------------------------------------------------
    case DpaEvent_DisableInterrupts:
      // Called when device needs all hardware interrupts to be disabled (before Reset, Restart, LoadCode, Remove bond and run RFPGM)
      // https://doc.iqrf.org/DpaTechGuide/pages/eventDisableInterrupts.html
      break;

#ifdef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    //case DpaEvent_ReceiveDpaResponse:
    case 11:
      // Called after DPA response was received at coordinator
      // https://doc.iqrf.org/DpaTechGuide/pages/receivedparesponse.html
      //goto DpaHandleReturnTRUE; // return TRUE to skip default processing
      break;
#endif

#ifdef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    //case DpaEvent_IFaceReceive:
    case 12:
      // Called after DPA request from interface master was received at coordinator
      // https://doc.iqrf.org/DpaTechGuide/pages/ifacereceive.html

      //goto DpaHandleReturnTRUE; // return TRUE to skip default processing
      break;
#endif

      // -------------------------------------------------
    case DpaEvent_PeerToPeer:
      // Called when peer-to-peer (non-networking) packet is received
      // https://doc.iqrf.org/DpaTechGuide/pages/peertopeer.html
      break;

      // -------------------------------------------------
    case DpaEvent_UserDpaValue:
      // Called when DPA is required to return User defined DPA value in the response
      // https://doc.iqrf.org/DpaTechGuide/pages/userdpavalue.html
      break;

      // -------------------------------------------------
#if !defined( COORDINATOR_CUSTOM_HANDLER ) && defined( DpaEvent_InStandby )
    case DpaEvent_InStandby:
      // Called to set WDT during Standby
      // https://doc.iqrf.org/DpaTechGuide/pages/instandby.html

      //goto DpaHandleReturnTRUE; // return TRUE to indicate that userReg1 contains WDT settings
      goto DpaHandleReturnFALSE;
#endif

#ifndef COORDINATOR_CUSTOM_HANDLER
      // -------------------------------------------------
    case DpaEvent_VerifyLocalFrc:
      // Called to verify local FRC command
      // https://doc.iqrf.org/DpaTechGuide/pages/verifylocalfrc.html

      //goto DpaHandleReturnTRUE; // return TRUE allow FRC command
      break;
#endif

      // -------------------------------------------------
#if !defined( COORDINATOR_CUSTOM_HANDLER ) && defined( DpaEvent_MenuActivated )
    case DpaEvent_MenuActivated:
      // Called to customize DPA menu
      // https://doc.iqrf.org/DpaTechGuide/pages/menuactivated.html

      //goto DpaHandleReturnTRUE; // return TRUE to allow customizing menu specified by userReg1
      break;
#endif

      // -------------------------------------------------
#if !defined( COORDINATOR_CUSTOM_HANDLER ) && defined( DpaEvent_MenuItemSelected )
    case DpaEvent_MenuItemSelected:
      // Called to indicate "OK" or "Error" for selected menu item
      // https://doc.iqrf.org/DpaTechGuide/pages/menuitemselected.html

      //goto DpaHandleReturnTRUE; // return TRUE to indicate "OK" for menu item specified by userReg1, otherwise to indicate Error
      break;
#endif

      // -------------------------------------------------
#if !defined( COORDINATOR_CUSTOM_HANDLER ) && defined( DpaEvent_MenuItemFinalize )
    case DpaEvent_MenuItemFinalize:
      // Called to finalize menu item execution
      // https://doc.iqrf.org/DpaTechGuide/pages/menuitemfinalize.html

      break;
#endif

      // -------------------------------------------------
    case DpaEvent_DpaRequest:
      // Called to interpret DPA request for peripherals
      // https://doc.iqrf.org/DpaTechGuide/pages/EventDpaRequest.html
      IfDpaEnumPeripherals_Else_PeripheralInfo_Else_PeripheralRequest()
      {
        // -------------------------------------------------
        // Peripheral enumeration
        // https://doc.iqrf.org/DpaTechGuide/pages/enumerate-peripherals.html

        _DpaMessage.EnumPeripheralsAnswer.UserPerNr |= 0; // ?
        // FlagUserPer( _DpaMessage.EnumPeripheralsAnswer.UserPer, PNUM_USER + 0 ); // ?
        _DpaMessage.EnumPeripheralsAnswer.HWPID |= 0x000F; // ????
        _DpaMessage.EnumPeripheralsAnswer.HWPIDver |= 0; // ????

DpaHandleReturnTRUE:
        return TRUE;
      }
      else
      {
        // -------------------------------------------------
        // Get information about peripheral
        // https://doc.iqrf.org/DpaTechGuide/pages/get-peripheral-info.html

        if ( _PNUM == PNUM_USER + 0 ) // ?
        {
          _DpaMessage.PeripheralInfoAnswer.PerT = 0; // PERIPHERAL_TYPE_?
          _DpaMessage.PeripheralInfoAnswer.PerTE = 0; // PERIPHERAL_TYPE_EXTENDED_?
          _DpaMessage.PeripheralInfoAnswer.Par1 = 0; // ?
          _DpaMessage.PeripheralInfoAnswer.Par2 = 0; // ?
          goto DpaHandleReturnTRUE;
        }

        break;
      }

      // -------------------------------------------------
      // Handle peripheral command
      // https://doc.iqrf.org/DpaTechGuide/pages/handle-peripheral-request.html

      if ( _PNUM == PNUM_USER + 0 ) // ?
      {
        if ( _PCMD == 0 ) // ????
        {
          goto DpaHandleReturnTRUE;
        }
      }

      break;
  }

DpaHandleReturnFALSE:
  return FALSE;
}

//############################################################################################
// Uncomment the following includes if the respective component is needed
//#include "NFC.c"

// Default Custom DPA Handler header; 2nd include implementing a Code bumper to detect too long code of the Custom DPA Handler (modify the path according to your setup)
#include "DPAcustomHandler.h"
//############################################################################################
