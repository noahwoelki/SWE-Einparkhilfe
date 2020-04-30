/*****************************************************************************
*
* Copyright 2020, All rights reserved, For internal use only
* FILE: distance_sensor_cpp
* PROJECT:  Einparkhilfe
* MODULE:   Measurement
* Description:  This is the code file for distance measurement
* Notes:
* Compiler dependencies or special instructions:  *none*
* REVISION HISTORY
* Date: 04/2020 By: Linus Muenten Description: Final version
*
*****************************************************************************/
#include "distance_sensor.h"


/**************************************************************************
*
* NAME: DistanceSensor::DistanceSensor
* Description:  Constructor for class distance_sensor
* Subroutines Called: *none*
* Returns:  *none*
* Globals:  int tPin   Pin number of trigger pin
*           int ePin   Pin number of echo pin
* Designer(s): Linus Muenten
* Programmer(s):  Linus Muenten
* Tested By: Linus Muenten Date:   04/2020
* Assumptions and Limitation: *none*
* Exception Processing: *none*
* NOTES:
* REVISION HISTORY
* Date: 04/2020 By: Linus Muenten Description: Final version
*
**************************************************************************/
DistanceSensor::DistanceSensor(int tPin,int ePin)
{
  pinMode(ePin,INPUT);   //set echo pin mode input
  pinMode(tPin,OUTPUT);  //set trigger pin mode output
  }


/**************************************************************************
*
* NAME: DistanceSensor::GetDistance()
* Description:  Proceed distance measurement
* Subroutines Called:   ConvertToCentimeters(durTime)
* Returns:  long distance
* Globals:  long distance   calculatet distance between object and sensor
* Designer(s): Linus Muenten
* Programmer(s):  Linus Muenten
* Tested By: Linus Muenten Date:   04/2020
* Assumptions and Limitation: *none*
* Exception Processing: *none*
* NOTES:
* REVISION HISTORY
* Date: 04/2020 By: Linus Muenten Description: Final version
*
**************************************************************************/
long DistanceSensor::GetDistance(int trigPin,int echPin)
{
  long distance = 0;              //initialize distance variable;
  durTime = 0;                   //initialize distance variable;
  digitalWrite(trigPin, LOW);    //set trigger output to zero
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);   //set trigger impulse for 10us
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);    //et trigger output to zero
  delayMicroseconds(2);
  durTime = pulseIn(echPin, HIGH, PULSE_LENGTH);    //count time between trigger impulse and recieve high level
  distance = convert_to_centimeters(durTime);        //calculate distance by dur_time and signal speed
  delay(25);
  if(distance>200)
  {
    distance = 200;     //set maximum distance to 2 meters
  }
  return distance;
}


/**************************************************************************
*
* NAME: DistanceSensor::ConvertToCentimeters
* Description:  Constructor for class distance_sensor
* Subroutines Called: *none*
* Returns:  long convDistance
* Globals:   long convDistance   calculated distance
*            long convTime       measured time
* Designer(s): Linus Muenten
* Programmer(s):  Linus Muenten
* Tested By: Linus Muenten Date:   04/2020
* Assumptions and Limitation: *none*
* Exception Processing: *none*
* NOTES:
* REVISION HISTORY
* Date: 04/2020 By: Linus Muenten Description: Final version
*
**************************************************************************/
long DistanceSensor::ConvertToCentimeters(long convTime)
{
  long convDistance = (convTime*100)/5882;    //conv_time in us, to convert, divide through 58.82, because of long multiply with 100 and divide through 5882
  return convDistance;
}
