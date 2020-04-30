/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:         Backend.dart
* PROJECT:      Einparkhilfe
* MODULE:       App
*
* Description:  
*  In this file every funktion that has something to do with the backend is implemented
*  Therfore: State Management, Http Client, Data Processing and saving Data permanently
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
import 'dart:async' show Future, Timer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';


/**************************************************************************
* NAME: CarImageState
* Description: 
*  This Class is used to manage the state of the cars,
*  this means, it is used to tell the FrontEnd which car will be displayed.
*  and when to update the build, via the notifyListener() function
* ParentClass: ChangeNotifier
*
* Methods: CarImageState(), Future<void> init() async, setNumberOfCars(), setSelectedCar(), getNumberOfCars(), getSelectedCar()
*
* Attributes: 
*  int numberOfCars
*  int selectedCar
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
class CarImageState extends ChangeNotifier {
  //attributes
  int numberOfCars;
  int selectedCar;

  //Constructor, initializes values and calls the asyc function init, to get saved data from memory
  CarImageState() {
    numberOfCars = 0;
    selectedCar = 0;
    init();
  }

  /**************************************************************************
  * NAME: init
  * Description:  
  *  asynchronous function, to get data (selectedCar) from system memory
  *
  * Subroutines Called: SharedPreferences.getInstance(), prefs.getInt()
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
  Future<void> init() async {
    //get an instance of shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //read selectedCar from memory, if it doesent exist return 0
    selectedCar = prefs.getInt('selectedCar') ?? 0;
  }

  /**************************************************************************
  * NAME: setNumberOfCars
  * Description:  
  *  function to set the attribute numberOfCars
  *
  * Subroutines Called: *none*
  *
  * Returns: *none*
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
  setNumberOfCars(int numberOfCars) {
    this.numberOfCars = numberOfCars;
  }

  /**************************************************************************
  * NAME: setSelectedCar
  * Description:  
  *  function to set the attribute numberOfCars, notifys the listeners and saves
  *  new selectedCar to system memory
  *
  * Subroutines Called: notifyListeners(), SharedPreferences.getInstance(), pref.setInt()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  setSelectedCar(int selectedCar) async {
    //if selectedCar is possible, update attribute selectedCar
    if (selectedCar < numberOfCars) {
      this.selectedCar = selectedCar;
    }
    //notify Listeners, to update Frontend
    notifyListeners();

    //save selectedCar to system memory
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedCar', selectedCar);
  }

  //get methods, return corresponding attribute
  getNumberOfCars() => this.numberOfCars;
  getSelectedCar() => this.selectedCar;
}



/**************************************************************************
* NAME: DistanceState
* Description: 
*  This Class is used to manage the state of the distances,
*  this means, it is used to tell the FrontEnd which distance to display with the cones on the HomePage.
*  and when to update the build, via the notifyListener() function
* ParentClass: ChangeNotifier
*
* Methods: DistanceState(), setDistanceLeft(), setDistanceMiddle(), setDistanceRight(), getDistanceLeft(), getDistanceMiddle(), getDistanceRight()
*
* Attributes: 
*  int distanceLeft
*  int distanceRight
*  int distanceMiddle
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
class DistanceState extends ChangeNotifier {

  //attributes
  int distanceLeft = 0;
  int distanceRight = 0;
  int distanceMiddle = 0;

  //constructor
  DistanceState();

  /**************************************************************************
  * NAME: setDistanceLeft
  * Description:  
  *  function to set the attribute distanceLeft, notifys the listeners
  *
  * Subroutines Called: notifyListeners()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  setDistanceLeft(int distanceLeft) {
    this.distanceLeft = distanceLeft;
    notifyListeners();
  }

  /**************************************************************************
  * NAME: setDistanceRight
  * Description:  
  *  function to set the attribute distanceRight, notifys the listeners
  *
  * Subroutines Called: notifyListeners()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  setDistanceRight(int distanceRight) {
    this.distanceRight = distanceRight;
    notifyListeners();
  }


  /**************************************************************************
  * NAME: setDistanceMiddle
  * Description:  
  *  function to set the attribute distanceMiddle, notifys the listeners
  *
  * Subroutines Called: notifyListeners()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  setDistanceMiddle(int distanceMiddle) {
    this.distanceMiddle = distanceMiddle;
    notifyListeners();
  }

  //get methods, return correspondig distance values
  getDistanceLeft() => this.distanceLeft;
  getDistanceRight() => this.distanceRight;
  getDistanceMiddle() => this.distanceMiddle;
}


/**************************************************************************
* NAME: ConnectionButtonState
* Description: 
*  This Class is used to manage the state of the ConnectionButton,
*  this means, it is used to tell the FrontEnd which color the Button has
*  ,when to update the build, via the notifyListener() function. Moreover
*  if calling activateButton in the App, it will start and stop fetching data from the Server
*  depending on the state of the button
* ParentClass: ChangeNotifier
*
* Methods: ConnectionButtonState(),Future<void> init() async, activateButton(), startTimer(), stopTimer(), setColor(), getColor()
*
* Attributes: 
*  var color
*  var timer
*  bool buttonPressed
*  String ipandport
*  String location
*  SharedPreferences prefs
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
class ConnectionButtonState extends ChangeNotifier {
  //attributes
  var color;
  var timer;
  bool buttonPressed;
  String ipandport;
  String location;
  SharedPreferences prefs;

  //constructor, initializes values and call init function
  ConnectionButtonState() {
    color = Colors.white;
    timer = null;
    buttonPressed = false;
    init();
  }

  /**************************************************************************
  * NAME: init
  * Description:  
  *  asynchronous function to get ipandport and location from system memory
  *
  * Subroutines Called: SharedPreferences.getInstance(), prefs.getString()
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
  *************************** ***********************************************/
  Future<void> init() async {
    //get instance of shared preferences
    prefs = await SharedPreferences.getInstance();
    //get ipandport from shared preferences, if it doesent exist return "enter a URN"
    ipandport = prefs.getString('ipandport') ?? "enter a URN";
    //get location from shared preferences, if it doesent exist return " "
    location = prefs.getString('location') ?? " ";
  }

  /**************************************************************************
  * NAME: avtivateButton
  * Description:  
  *  function to activate the button, if this function is called, the 
  *  fetching of data from the server is satarted or stopped
  *
  * Subroutines Called: startTimer(), stopTimer()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  activateButton(DistanceState distanceState, HttpClient myHttpClient) {
    //if button is pressed and no timer is running-> safty mechanism that not more than one Timer is running at a time
    if (this.color == Colors.lightBlue && timer == null) {
      //start the Timer
      startTimer(distanceState, myHttpClient);
      //stop the Timer
    } else if (this.color == Colors.white) {
      stopTimer();
    }
  }

  /**************************************************************************
  * NAME: startTimer
  * Description:  
  *  function activates a periodic Timer, that calls the fetchDistance()
  *  function every 75 milliseconds
  *
  * Subroutines Called: fetchDistance()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  startTimer(DistanceState distanceState, HttpClient myHttpClient) {
    //start periodic timer
    timer = Timer.periodic(
      //set duration of timer
      Duration(milliseconds: 75),
      (timer) {
        //make a http request at ipandport and location with myHttpClient
        fetchDistance(ipandport, location, distanceState, myHttpClient);
      },
    );
  }


  /**************************************************************************
  * NAME: stopTimer
  * Description:  
  *  function to cancel the periodic timer started in startTimer()
  *
  * Subroutines Called: timer.cancel()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  stopTimer() {
    //if the timer is not null cancel it and set timer to null
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }
  

  /**************************************************************************
  * NAME: setColor
  * Description:  
  *  function to set the color attribute, and notify listeners to rebuild  the app
  *
  * Subroutines Called: notifyListeners()
  *
  * Returns: *none*
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
  *************************** ***********************************************/
  setColor(var color) {
    this.color = color;
    notifyListeners();
  }

  //get method returns the color attribute
  getColor() => this.color;
}



/**************************************************************************
* NAME: Distance
* Description: 
*  This Class is used to parse the distances recieved in a JSON File
* ParentClass: ChangeNotifier
*
* Methods: Distances(), factory Distancs.fromJSON()
*
* Attributes: 
*  var distanceLeft
*  var distanceRight
*  var distanceMiddle
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
class Distances {
  var distanceLeft;
  var distanceRight;
  var distanceMiddle;

  //constructor
  Distances({this.distanceLeft, this.distanceMiddle, this.distanceRight});
  //factory constructor, to convert from JSON
  factory Distances.fromJSON(Map<String, dynamic> json) {
    //return a object from Distances
    return Distances(
      distanceLeft: json['distance3'],
      distanceRight: json['distance1'],
      distanceMiddle: json['distance2'],
    );
  }
}

/**************************************************************************
* NAME: fetchDistance
* Description:  
*  asynchronous Function, to make a get request to a ip and port and a specified location
*  this function parses the distance data from JSON and updates the DistanceState
*
* Subroutines Called: Uri.http(),myClient.getURL().then().then(),request.close().timeout(),response.tranform().listen()
*  Distances.fromJSON(),setDistanceLeft(),setDistanceRight(),setDistanceMiddle(), print()
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
* Exception Processing: everything in try catch block, to catch potential errors during request
*
* NOTES: *none*
*
* REVISION HISTORY
* Date: 04/2020 Levi Bohnacker Description: final
*
*************************** ***********************************************/
Future<void> fetchDistance(String ipandport, String location,
    DistanceState distanceState, HttpClient myClient) async {
  //variable
  Distances buffer;
  

  //try catch block to catch errors
  try {

    //pares URI from ip,port and location
    var myUri = new Uri.http(ipandport, location);
    //make a new request
    myClient.getUrl(myUri).then((HttpClientRequest request) {
      return request.close().timeout(Duration(milliseconds: 20));
    }).then((HttpClientResponse response) {
      //tranform response to JSON
      response.transform(utf8.decoder).listen((contents) {
        //parse JSON
        buffer = Distances.fromJSON(jsonDecode(contents));
        //update distanceState
        distanceState.setDistanceLeft(buffer.distanceLeft);
        distanceState.setDistanceRight(buffer.distanceRight);
        distanceState.setDistanceMiddle(buffer.distanceMiddle);
      });
    });
  } catch (e) {
    //print message, if error is catched
    print("Error catched");
  }
}


/**************************************************************************
* NAME: changeIP
* Description:  
*  function to parse and safe a String int a ipandport and location. 
*  if it is no valid URN, it will be saved anyway, but error
*  will be catched by try catch block in fetchDistance
*
* Subroutines Called: SharedPreferences.getInstance(), prefs.setString(), substring(), indexOf(),
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
*************************** ***********************************************/
Future<void> changeIP(
    String toParse, ConnectionButtonState connectionButtonState) async {

  //get instance of shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //get location of / in String->boarder to pase to
  int border = toParse.indexOf('/');
  //if there is a backslash
  if (border >= 0) {
    //save ip and port
    prefs.setString('ipandport', toParse.substring(0, border));
    connectionButtonState.ipandport = toParse.substring(0, border);
    //save location
    prefs.setString('location', toParse.substring(border, toParse.length));
    connectionButtonState.location = toParse.substring(border, toParse.length);
  } else {
    //save ip and port
    prefs.setString('ipandport', toParse);
    //save   in location
    prefs.setString('location', " ");
    connectionButtonState.ipandport = toParse;
    connectionButtonState.location = " ";
  }
}

