/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:esp8266LED.h
* PROJECT:Einparkhilfe
* MODULE:LED
*
* Description: header for http_get

*
* Notes:
*
* Compiler dependencies or special instructions:
*
* REVISION HISTORY
* Date: 04/2020 By:Jonas Igel 
*
*****************************************************************************/



#include "ESP8266WiFi.h"
#include "ESP8266HTTPClient.h"
#include <ArduinoJson.h>

//wifi access point data
const char* ssid = "Einparkhilfe";
const char* password = "12345678";

//variables for distance measurement
int distance1 = 0;  //left
int distance2 = 0;  //middle
int distance3 = 0;  //right
  
//variables for LED Pins
const int LEDPIN_LEFT_GREEN =   D0;
const int LEDPIN_LEFT_YELLOW =  D1;
const int LEDPIN_LEFT_RED =     D2;

const int LEDPIN_MIDDLE_GREEN =   D3;
const int LEDPIN_MIDDLE_YELLOW =  D4;
const int LEDPIN_MIDDLE_RED =     D5;

const int LEDPIN_RIGHT_GREEN =   D6;
const int LEDPIN_RIGHT_YELLOW =  D7;
const int LEDPIN_RIGHT_RED =     D7;

 
//functions
void WifiInit();
void LEDinit();
void outputValuesToLED(int distanceLeft,int distanceMiddle,int distanceRight);
void setup ();

