/*****************************************************************************
* Copyright 2012, All rights reserved, For internal use only
*
* FILE:     comm_cpp
* PROJECT:  Einparkhilfe
* MODULE:   Communication
*
* Description: This is the source file for the HTTP communication between The
* Phone Application and the LED-feature.
*
* Notes:
*
* Compiler dependencies or special instructions:
*
* REVISION HISTORY
* Date: 04/2020 By: Noah Wölki Description: Final
*
*****************************************************************************/
#include "comm.h"

/**************************************************************************
* NAME:         CommInit
* Description:  initilaizes the Access Point
*
* Subroutines Called: *none*
*
* Returns: *void*
*
* Globals: ssid: sets the name of the Access point
*          password: sets password of Access point
*
* Designer(s): Noah Wölki
* Programmer(s): Noah Wölki
* Tested By: Noah Wölki Date: 04/2020
* Assumptions and Limitation: *none*
*
* Exception Processing: *none*
*
* NOTES:
*
* REVISION HISTORY
* Date: 04/2020 By: Noah Wölki Description: Final version
*
**************************************************************************/
void CommInit(char * ssid, char* password){
    //create the access point with given ssid and password
    WiFi.softAP(ssid, password);
    Serial.println();               //print the IP adress of access point to console for deubg purpose
    Serial.print("IP address: ");
    Serial.println(WiFi.softAPIP());
}
