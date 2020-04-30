/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:         SettingsPage.dart
* PROJECT:      Einparkhilfe
* MODULE:       App
*
* Description:  
*  In this file the SettingsPage of the app is implemented
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
import "CustomizeCarPage.dart";

/**************************************************************************
* NAME: SettingsPage
* Description: 
*  Page for Settings, e.g. Change Car
* ParentClass: StatelessWidget
*
* Methods: Widget build(BuildContext context), SettingsPage({this.carImageState})
*
* Attributes: 
*  final CarImageState carImageState
*  final ConnectionButtonState connectionButtonState
*  final double appBarHeight
*  final double paddingTop
*  final double buttonSize
*  final double paddingSide
*  final double settingCardHeight
*  final double borderRadius
*  final double paddingTextField
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
class SettingsPage extends StatelessWidget {
  //attributes
  final CarImageState carImageState;
  final ConnectionButtonState connectionButtonState;
  final double appBarHeight = 120;
  final double paddingTop = 50;
  final double buttonSize = 70;
  final double paddingSide = 5;
  final double settingCardHeight = 50;
  final double borderRadius = 40;
  final double paddingTextfield = 25;
  

  //Konstruktor with carImageStat and connectionButtonState as parameters
  SettingsPage({this.carImageState, this.connectionButtonState});

  /**************************************************************************
  * NAME: build
  * Description:  
  *   build function that returns the rest of the Widget tree.
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
  Widget build(BuildContext context) {
    //text for TextField
    String textFieldText = connectionButtonState.ipandport+connectionButtonState.location;

    //erster Container ist hintergrund
    return MyBackground(
      //Spalte, in die Alles reinkommt
      child: Stack(
        children: <Widget>[
          //settings List
          ListView(
            padding: EdgeInsets.only(top: appBarHeight),
            children: <Widget>[
              //Customize Car Settings Card
              MySettingsCardDeeper(
                text: "Customize Car",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomizeCarPage(
                                carImageState: carImageState,
                              )));
                },
                icon: Icons.directions_car,
                iconColor: Colors.indigo,
              ),

              //SettingsCard with Textfield to get URN
              MySettingsCard(
                //Material Widget, because TextFormField needs to be wrapped in one
                child: Material(
                  //define BorderRaduius
                  borderRadius: BorderRadius.circular(borderRadius),
                  //padding to put TextFormField in Position
                  child: Padding(
                    padding: EdgeInsets.only(left: paddingTextfield, right: paddingTextfield),
                      //TextFormField
                      child: TextFormField(
                        //set TextStyle
                        style: TextStyle(height: 1),
                        //set Decoration, like Icon at the beginning and Border Radius 
                        decoration: InputDecoration(
                          icon: Icon(Icons.rss_feed),
                          hintText: textFieldText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        autofocus: false,
                        autovalidate: true,
                        //call changeIP() with Text in textfield on submitted
                        onFieldSubmitted: (text) {
                          changeIP(text, connectionButtonState);
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),

          //AppBar
          MyBasicAppBar(
              title: "Settings",
              icon: Icons.home,
              //if pressed navigate back to HomePage
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}