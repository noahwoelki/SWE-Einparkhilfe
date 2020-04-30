/*****************************************************************************
*
* Copyright 2020, All rights reserved, For internal use only
* FILE: distance_sensor_h
* PROJECT:  Einparkhilfe
* MODULE:   Measurement
* Description:  This is the header file for distance measurement
* Notes:
* Compiler dependencies or special instructions:  *none*
* REVISION HISTORY
* Date: 04/2020 By: Linus Muenten Description: Final version
*
*****************************************************************************/
#include "Arduino.h"

#define PULSE_LENGTH 150000L  // 100ms
#define TRIG_PIN_01 32
#define ECHO_PIN_01 35

#define TRIG_PIN_02 25
#define ECHO_PIN_02 33

#define TRIG_PIN_03 27
#define ECHO_PIN_03 26

/**************************************************************************
*
* NAME: DistanceSensor
* Description:  measurement and calculation handler for the distance sensor
* ParentClass: *none*
* Methods:  DistanceSensor()
*           GetDistance()
*           ConvertToCentimeters()
* Attributes:   long durTime
*               int trigPin
*               int echPin
* Designer(s): Linus Muenten
* Programmer(s): Linus Muenten
* Tested By: Linus Muenten Date: 04/2020
* Assumptions and Limitation: *none*
* Exception Processing: *none*
* NOTES:
* REVISION HISTORY
* Date: 04/2020 By: Linus Muenten Description: Final version
*
**************************************************************************/
class DistanceSensor
{
    public:

    DistanceSensor(int tPin,int ePin);     //constructor

    long GetDistance(int trigPin,int echPin);  //distance measurement

    long ConvertToCentimeters(long convTime);  //distance calculation



    private:

      //long distance;
      long durTime;

};
