/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:     comm_h
* PROJECT:  Einparkhilfe
* MODULE:   Communication
*
* Description:  This is the header file for the HTTP communication between The
* Phone Application and the LED-feature.
*
* Notes: *none*
*
* Compiler dependencies or special instructions:
*
* REVISION HISTORY
* Date: 04/2020 By: Noah Wölki Description: Final version
*
*****************************************************************************/
#include "Arduino.h"
#include "WiFi.h"               //for access point host
#include "ESPAsyncWebServer.h"  //for async web communication
#include "ArduinoJson.h"        //for json files


// function defines
void CommInit(char* ssid, char* password);
