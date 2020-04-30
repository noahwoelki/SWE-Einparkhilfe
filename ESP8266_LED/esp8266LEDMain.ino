/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:esp8266LEDMain.ino
* PROJECT: Einparkhilfe
* MODULE:LED
*
* Description: This function combines the features of the SoC ESP8266.
* The distanca data is received by connecting to the ESP32 Access Point.
* The LED visualize the cars distance to the object.
*
* Notes:
*
* Compiler dependencies or special instructions:
*
* REVISION HISTORY
* Date: 04/2020
*
*****************************************************************************/

#include "esp8266_LED_h.ino"


setup();



/**************************************************************************
* NAME:loop
* Description: main function, http request and Deserialization of Json
*
* Subroutines Called: outputValuesToLED
*
* Returns: void
*
* Globals: distance1, distance2, distance3
*
* Designer(s):	Jonas Igel
* Programmer(s): Jonas Igel
* Tested By: Date: 12.03.20
* Assumptions and Limitation:
*
* Exception Processing:
*
* NOTES:
*
* REVISION HISTORY
* Date: 04/2020	By: Jonas Igel
*
**************************************************************************/


void loop() 
{
 
if (WiFi.status() == WL_CONNECTED) { // only start if connected to wifi
 
HTTPClient http; 

 http.begin("http://192.168.4.1/sensorData");  //http request ip

//http.begin("http://jsonplaceholder.typicode.com/users/1"); // when testing without the "einparkhilfe" access point. // NOT NEEDED FOR EINPARKHILFE

int httpCode = http.GET();  // http get request
 
if (httpCode > 0) { //Check the returning code
 
String payload = http.getString();   // store payload of the http request

const size_t capacity = JSON_OBJECT_SIZE(3) + 40; // 3 Json objects(distances 1,2,3) and an extra buffer

DynamicJsonDocument jsonDoc(capacity);  // create a JsonDocument

DeserializationError error = deserializeJson(jsonDoc, payload);

if (error) {
  Serial.println("deserializeJson() failed");
}
else {
   distance1 = jsonDoc["distance1"];
   distance2 = jsonDoc["distance2"];
   distance3 = jsonDoc["distance3"];
//const char* name = jsonDoc["name"]; ; // when testing without the "einparkhilfe" access point. // NOT NEEDED FOR EINPARKHILFE

//following lines of Code are only for testing & debugging the output of the Get Request in the serial monitor of Arduino IDE
/*    
  Serial.print("left:");
  Serial.println(distance1);
  Serial.print("mid:");
  Serial.println(distance2);
  Serial.print("right:");
  Serial.println(distance3);
*/
}


}
 
http.end();   //end http after finished

outputValuesToLED(distance1,distance2,distance3);
}
else setup(); // to get a new connection
 
delay(1000);    //Send a request every second
 
}
//end of loop
