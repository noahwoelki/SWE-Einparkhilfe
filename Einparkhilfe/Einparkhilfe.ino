/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:       Einparkhilfe_ino
* PROJECT:    Einparkhilfe
* MODULE:     MAIN
*
* Description: This is the main File which combines the distance measurement and the
* Access Point functions. It hosts an Access point which will provide a Wifi Network. Via HTTP
* protocol, the distance data are sent to 1. The mobile application
*                                         2. The LED application (running via esp8266)
* This software is placed on the ESP32 which is the main SoC.
*
* Notes:
*
* Compiler dependencies or special instructions:  *none*
*
* REVISION HISTORY
* Date: 04/2020 By: Noah Wölki Description: Full integration of all features
*
*****************************************************************************/

#include "Arduino.h"    //for standard Arduino functions
#include "WiFi.h"       //for access point host
#include "ESPAsyncWebServer.h"  //for async web communication
#include "ArduinoJson.h"        //for json files
#include "distance_sensor.h"    //for sensor distance data
#include "comm.h"               //for communication

//*******global variables****************************************************
//access point will be hosted with given ssid and password
char *ssid = "Einparkhilfe";
char *password = "12345678";

//Create objects for different distnace sensor
DistanceSensor sensor01 = DistanceSensor(TRIG_PIN_01,ECHO_PIN_01);
DistanceSensor sensor02 = DistanceSensor(TRIG_PIN_02,ECHO_PIN_02);
DistanceSensor sensor03 = DistanceSensor(TRIG_PIN_03,ECHO_PIN_03);

//create server on port 80
AsyncWebServer server(80);

//create json object
StaticJsonDocument <200> doc;


// string to store sensor data from json file
String sensorData = "";

// integers to store distance data from sensor
int distance1;
int distance2;
int distance3;
//****************************************************************************

void setup() {

//set the baudrate and start transmission
  Serial.begin(115200);

//initialize softAP
  CommInit(ssid, password);
//init with start values to prevent errors
  doc["distance1"] = 0;
  doc["distance2"] = 0;
  doc["distance3"] = 0;

//start server transmission once HTTP_GET message is received
  server.on("/sensorData", HTTP_GET, [](AsyncWebServerRequest *request){
        //clear the string befor new data is received
        sensorData = "";
        //converts json file to string
        serializeJson(doc, sensorData);
        //sends the string containing sensor data
        request->send(200, "text/plain", sensorData);
  });

//begin server
  server.begin();

}

void  JsonRefresh(int sensor1, int sensor2, int sensor3){
  doc["distance1"] = sensor1;
  doc["distance2"] = sensor2;
  doc["distance3"] = sensor3;
}


void loop(){
  //always take measurements from the sensors
   distance1 = sensor01.GetDistance(TRIG_PIN_01,ECHO_PIN_01);
   distance2 = sensor02.GetDistance(TRIG_PIN_02,ECHO_PIN_02);
   distance3 = sensor03.GetDistance(TRIG_PIN_03,ECHO_PIN_03);
   //json file is constantly updated
   JsonRefresh(distance1, distance2, distance3);
}
