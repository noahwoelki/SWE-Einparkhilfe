/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:         CustomizeCarPage.dart
* PROJECT:      Einparkhilfe
* MODULE:       App
*
* Description:  
*  In this file the CustomizeCarPage of the app is implemented
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

//imports of own .dart files
import "Backend.dart";
import "MyWidgets.dart";

/**************************************************************************
* NAME: CustomizeCarPage
* Description: 
*  Page to choose which car will be displayed in the HomePage
* ParentClass: StatelessWidget
*
* Methods: Widget build(BuildContext context), CustomizeCarPage({this.carImageState})
*
* Attributes: 
*  final double buttonSize
*  final appBarPadding
*  final CarImageState carImageState
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
class CustomizeCarPage extends StatelessWidget {
  final double buttonSize = 70;
  final double appBarPadding = 140;
  final CarImageState carImageState;

  //Constructor with carImageState as parameter
  CustomizeCarPage({this.carImageState});

  /**************************************************************************
  * NAME: build
  * Description:  
  *  function that returns the rest of the Widget Tree
  *
  * Subroutines Called: *none*
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
    //initialize a List in size of Number of Cars, with Icons (either checkedBoxes or unchecked Boxes)
    var iconList = new List(carImageState.getNumberOfCars());
    carImageState.numberOfCars = carImageState.getNumberOfCars();

    //set all checkboxes to either checked or not checked
    for (int i = 0; i < carImageState.getNumberOfCars(); i++) {
      if (i == carImageState.getSelectedCar())
        iconList[i] = Icon(Icons.check_box, color: Colors.lightGreen);
      else
        iconList[i] = Icon(Icons.check_box_outline_blank);
    }

    //return rest of Widget Tree
    return MyBackground(
      //Stack with Cars and AppBar
      child: Stack(
        children: <Widget>[
          //Grid View, to display two child widgets in one Row
          GridView.count(
            padding: EdgeInsets.only(top: appBarPadding),
            crossAxisCount: 2,
            children: <Widget>[
              //Widget to Display Car and a button with Icon to check -> choos car
              MyCarInSettings(
                  imagePath: "assets/images/Car.png",
                  myIcon: iconList[0],
                  myCarNumber: 0,
                  mySelector: carImageState),
              MyCarInSettings(
                  imagePath: "assets/images/YellowSportsCar.png",
                  myIcon: iconList[1],
                  myCarNumber: 1,
                  mySelector: carImageState),
            ],
          ),

          //AppBar
          MyBasicAppBar(
              title: "Customize Car",
              icon: Icons.keyboard_arrow_left,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}