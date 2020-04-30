/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:         HomePage.dart
* PROJECT:      Einparkhilfe
* MODULE:       App
*
* Description:  
*  In this file the Home Page of the app is implemented
*
* Notes: *none*
*
* Compiler dependencies or special instructions: *none*
*
* REVISION HISTORY
* Date: 04/2020 Levi Bohnacker Description: final
*
*****************************************************************************/

//imports
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

//imports of own .dart files
import "Backend.dart";
import "MyWidgets.dart";
import "SettingsPage.dart";

/**************************************************************************
* NAME: HomePage
* Description: HomePage, this Page will be visible after starting the app
* ParentClass: StatelessWidget
*
* Methods: Widget build(BuildContext context), HomePage()
*
* Attributes: 
*  final double appBarHeigeht
*  final double paddingTop
*  final double buttonSize
*  final HttpClient myHttpClient
*  final CarImageState carImageState
*  final DistanceState distanceState
*  final ConnectionButtonState connectionButtonState
*
* Designer(s): Levi Bohnacker
* Programmer(s): Levi Bohnacker
* Tested By: Levi Bohnacker Date: 24/04/2020
* Assumptions and Limitation: *none*
*
* Exception Processing: *none*
*
* NOTES: *none*
*
* REVISION HISTORY
* Date: 04/2020 Levi Bohnacker Description: final
*
**************************************************************************/
class HomePage extends StatelessWidget {
  //attributes
  final double appBarHeight = 120;
  final double paddingTop = 50;
  final double buttonSize = 70;
  final HttpClient myHttpClient = new HttpClient();
  final CarImageState carImageState;
  final DistanceState distanceState;
  final ConnectionButtonState connectionButtonState;

  //Constructor with CarImageState, DistanceState and ConnectionButtonState as parameters
  HomePage({this.carImageState, this.distanceState, this.connectionButtonState});

  /**************************************************************************
  * NAME: build
  * Description:  
  *   build function that activates the connectionButtonState, deklares and initializes
  *   a List with all paths for images to display a car of the users choosing
  *   and returns the rest of the Widget tree.
  *
  * Subroutines Called: callInit(initList), builder function of FutureBuilder
  *
  * Returns: Widget
  *
  * Globals: *none*
  *
  * Designer(s): Levi Bohnacker
  * Programmer(s): Levi Bohnacker
  * Tested By: Levi Bohnacker Date: 24/04/2020
  * Assumptions and Limitation: *none*
  *
  * Exception Processing: *none*
  *
  * NOTES: *none*
  *
  * REVISION HISTORY
  * Date: 04/2020 Levi Bohnacker Description: final
  *
  **************************************************************************/
  @override
  Widget build(BuildContext context) {

    //activate connection ButtonState
    connectionButtonState.activateButton(distanceState, myHttpClient);

    //paths for images
    List<String> imagePathList = new List<String>();
    imagePathList.add("assets/images/Car.png");
    imagePathList.add("assets/images/YellowSportsCar.png");
    //set number of cars
    carImageState.setNumberOfCars(imagePathList.length);

    //return widget tree part beneath HomePage
    return MyBackground(
      child: Stack(
        children: [
          // Car in the Middle of the Screen
          Center(
            child: Container(
              width: 400,
              height: 400,
              child: MyImageFrame(
                width: 400,
                height: 350,
                imagePath: imagePathList[carImageState.getSelectedCar()],
              ),
            ),
          ),

          //Distance display
          Padding(
            padding: EdgeInsets.only(top: 400),
            child: Stack(
              children: [
                //left cone
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Transform.rotate(
                      angle: 3 * pi / 14,
                      child: MyCone(
                        padding: distanceState.getDistanceLeft(),
                        width: 125,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                //middle cone
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 75),
                    child: MyCone(
                      padding: distanceState.getDistanceMiddle(),
                      width: 125,
                      height: 200,
                    ),
                  ),
                ),
                //right cone
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: Transform.rotate(
                      angle: (25 * pi) / 14,
                      child: MyCone(
                        padding: distanceState.getDistanceRight(),
                        width: 125,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //connection Button
          Center(
            child: FlatButton(
              //function called if button is pressed
              onPressed: () {
                //change connection Button Color->rebuilding app->start or stop fetching Distances, because of call of activateButton()
                if (connectionButtonState.getColor() == Colors.white) {
                  connectionButtonState.setColor(Colors.lightBlue);
                } else {
                  connectionButtonState.setColor(Colors.white);
                }
              },
              //give button an Icon
              child: Icon(Icons.wifi, color: connectionButtonState.getColor()),
              //set color of Button to transparent
              color: Colors.transparent,
            ),
          ),

          //App Bar
          MyBasicAppBar(
              //display title
              title: "Car Sensor",
              //display the settings Icon
              icon: Icons.settings,
              //function called if button is pressed
              onPressed: () {
                //change page to SettingsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(
                            carImageState: carImageState,
                            connectionButtonState: connectionButtonState,
                          )),
                );
              }),
        ],
      ),
    );
  }
}