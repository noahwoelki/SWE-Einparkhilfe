/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:esp8266LED.cpp	
* PROJECT: Einparkhilfe
* MODULE:LED
*
* Description: 
*
* Notes:
*
* Compiler dependencies or special instructions:
*
* REVISION HISTORY
* Date:04/2020 By: Jonas Igel
*
*****************************************************************************/


/**************************************************************************
* NAME:setup
* Description: init wifi and LEDs
*
* Subroutines Called: wifi_init, LED_init
*
* Returns: void
*
* Globals:
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
* Date:  04/2020	By: Jonas Igel
*
**************************************************************************/

void setup () 
{
  WifiInit();
  LEDInit();
}



/**************************************************************************
* NAME: WifiInit
* Description: connect to the Access Point
*
* Subroutines Called:
*
* Returns: void
*
* Globals:
*
* Designer(s): Jonas Igel
* Programmer(s): Jonas Igel
* Tested By: Date: 23.03.20
* Assumptions and Limitation:
*
* Exception Processing:
*
* NOTES:
*
* REVISION HISTORY
* Date:03/2020 By: Jonas Igel
*
**************************************************************************/

void WifiInit(const char* ssid, const char* password)
{
  
 Serial.begin(115200);
WiFi.begin(ssid, password);
 
while (WiFi.status() != WL_CONNECTED)   
{
delay(1000);
Serial.println("connecting to: ");  // Feedback for the user
Serial.print(ssid);  
}

}


/**************************************************************************
* NAME:LEDinit
* Description: init the pinmode of all LED pins used
*				to be able to output voltage to the LED pins. ALL LED pins output
*
* Subroutines Called:
*
* Returns: void
*
* Globals:ledPin_Left_green,ledPin_Left_yellow,ledPin_Left_red,ledPin_Middle_green,ledPin_Middle_yellow,ledPin_Middle_red,ledPin_Right_green,ledPin_Right_yellow,ledPin_Right_red

*
* Designer(s): Jonas Igel
* Programmer(s): Jonas Igel
* Tested By: Date: 23.03.20
* Assumptions and Limitation:
*
* Exception Processing:
*
* NOTES:
*
* REVISION HISTORY
* Date:04/2020 By:Jonas Igel 
*
**************************************************************************/

void LEDinit()
{
  pinMode(LEDPIN_LEFT_GREEN, OUTPUT); 
  pinMode(LEDPIN_LEFT_YELLOW, OUTPUT);
  pinMode(LEDPIN_LEFT_RED, OUTPUT);

  pinMode(LEDPIN_MIDDLE_GREEN, OUTPUT); 
  pinMode(LEDPIN_MIDDLE_YELLOW, OUTPUT);
  pinMode(LEDPIN_MIDDLE_RED, OUTPUT);

  pinMode(LEDPIN_RIGHT_GREEN, OUTPUT); 
  pinMode(LEDPIN_RIGHT_YELLOW, OUTPUT);
  pinMode(LEDPIN_RIGHT_RED, OUTPUT);

}


 


/**************************************************************************
* NAME:outputValuesToLED
* Description: output values to LEDs Left,Middle and Right 
*
*green -> large distance
*yellow -> medium distance
*red -> small distance
*
*
* Subroutines Called:
*
* Returns: void
*
* Globals:ledPin_Left_green,ledPin_Left_yellow,ledPin_Left_red,ledPin_Middle_green,ledPin_Middle_yellow,ledPin_Middle_red,ledPin_Right_green,ledPin_Right_yellow,ledPin_Right_red
*
* Designer(s): Jonas Igel
* Programmer(s): Jonas Igel
* Tested By: Jonas Igel Date: 13.03.20
* Assumptions and Limitation:
*
* Exception Processing:
*
* NOTES:
*
* REVISION HISTORY
* Date: 04/2020 By: Jonas Igel 
*
**************************************************************************/

void outputValuesToLED(int distanceLeft,int distanceMiddle,int distanceRight)
{
  /////////////////////////////////////////////////LEFT:
  if(distanceLeft>150) //large distance -> green
  { 
  digitalWrite(LEDPIN_LEFT_GREEN,HIGH);
  digitalWrite(LEDPIN_LEFT_YELLOW,LOW);
  digitalWrite(LEDPIN_LEFT_RED,LOW);
  }

   else if(distanceLeft>75 && distanceLeft<=150) //medium distance -> yellow
  { 
  digitalWrite(LEDPIN_LEFT_GREEN,LOW);
  digitalWrite(LEDPIN_LEFT_YELLOW,HIGH);
  digitalWrite(LEDPIN_LEFT_RED,LOW);
  }

    else //small distance -> red
  { 
  digitalWrite(LEDPIN_LEFT_GREEN,LOW);
  digitalWrite(LEDPIN_LEFT_YELLOW,LOW);
  digitalWrite(LEDPIN_LEFT_RED,HIGH);
  }


    /////////////////////////////////////////////////Middle:
  if(distanceMiddle>150) //large distance -> green
  { 
  digitalWrite(LEDPIN_MIDDLE_GREEN,HIGH);
  digitalWrite(LEDPIN_MIDDLE_YELLOW,LOW);
  digitalWrite(LEDPIN_RIGHT_RED,LOW);
  }

   else if(distanceMiddle>75 && distanceMiddle<=150) //medium distance -> orange
  { 
  digitalWrite(LEDPIN_MIDDLE_GREEN,LOW);
  digitalWrite(LEDPIN_MIDDLE_YELLOW,HIGH);
  digitalWrite(LEDPIN_RIGHT_RED,LOW);
  }

    else //small distance -> red
  { 
  digitalWrite(LEDPIN_MIDDLE_GREEN,LOW);
  digitalWrite(LEDPIN_MIDDLE_YELLOW,LOW);
  digitalWrite(LEDPIN_RIGHT_RED,HIGH);
  }


  /////////////////////////////////////////////////Right:
  if(distanceRight>150) //large distance -> green
  digitalWrite(LEDPIN_RIGHT_GREEN,HIGH);
  digitalWrite(LEDPIN_RIGHT_YELLOW,LOW);
  digitalWrite(LEDPIN_RIGHT_RED,LOW);
  }

   else if(distanceRight>75 && distanceRight<=150) //medium distance -> yellow
  { 
  digitalWrite(LEDPIN_RIGHT_GREEN,LOW);
  digitalWrite(LEDPIN_RIGHT_YELLOW,HIGH);
  digitalWrite(LEDPIN_RIGHT_RED,LOW);
  }

    else //small distance -> red
  { 
  digitalWrite(LEDPIN_RIGHT_GREEN,LOW);
  digitalWrite(LEDPIN_RIGHT_YELLOW,LOW);
  digitalWrite(LEDPIN_RIGHT_RED,HIGH);
  }

}
