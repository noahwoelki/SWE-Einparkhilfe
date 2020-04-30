/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:         Main.dart
* PROJECT:      Einparkhilfe
* MODULE:       App
*
* Description:  
*  In this File the main function of the App as well as the first Widget in the Widget Tree,
*  MyApp is implemented
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
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//imports of own .dart files
import "Backend.dart";
import "HomePage.dart";

/**************************************************************************
* NAME: main
* Description:  
*  is called, when app is started, opens the first Widget
*  via runApp() and generates Providers from Notifiers
*
* Subroutines Called: runApp()
*
* Returns: void
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
void main() {
  //run the App
  runApp(
    //deklare Providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CarImageState()),
        ChangeNotifierProvider(create: (context) => DistanceState()),
        ChangeNotifierProvider(create: (context) => ConnectionButtonState()),
      ],
      //call the MyApp widget
      child: MyApp(),
    ),
  );
}

/**************************************************************************
* NAME: MyApp
* Description: 
*  First Widget in Widget Tree, responsible for initialisation and calls Widget HomePage
* ParentClass: StatelessWidget
*
* Methods: Widget build(BuildContext context), Future<void> callInit(Function init1, Function init2)
*
* Attributes: *none*
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

class MyApp extends StatelessWidget {

  /**************************************************************************
  * NAME: callInit
  * Description:  
  *  function to call all asynchronous init Functions with the Future Builder
  *  inside of the build function.
  *
  * Subroutines Called: every function that the parameter List<Function> initList contains
  *
  * Returns: Future<void>
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
  Future<void> callInit(List<Function> initList) async {
    //iterate over List of init Functions and execute them
    for(int i=0;i<initList.length;i++){
      await initList[i](); 
    }
  }

  /**************************************************************************
  * NAME: build
  * Description:  
  *   build function that initializes the Providers, deklares and initializes
  *   a List with all init functions and returns the rest of the Widget tree, including
  *   the HomePage
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
    //initialize Provider
    final CarImageState carImageState = Provider.of<CarImageState>(context);
    final DistanceState distanceState = Provider.of<DistanceState>(context);
    final ConnectionButtonState connectionButtonState =
        Provider.of<ConnectionButtonState>(context);

    //build list of asynchronous init functions to be called by callInit
    List<Function> initList = new List<Function>();
    initList.add(carImageState.init);
    initList.add(connectionButtonState.init);

    //call init funktion to get saved Data from the Memory, and return Widget Tree part beneath MyApp
    return FutureBuilder(
      future: callInit(initList),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, //switch debug banner off
          home: HomePage(
            carImageState: carImageState,
            distanceState: distanceState,
            connectionButtonState: connectionButtonState,
          ),
        );
      },
    );
  }
}






