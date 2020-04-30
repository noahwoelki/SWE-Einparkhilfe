/*****************************************************************************
* Copyright 2020, All rights reserved, For internal use only
*
* FILE:         MyWidgets.dart
* PROJECT:      Einparkhilfe
* MODULE:       App
*
* Description:  
*  In this file Widgets for the app that are not importet from a package or library
*  are declared
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
import 'dart:math';

//imports of own .dart files
import "Backend.dart";


/**************************************************************************
* NAME: MyImageFrame
* Description: 
*  Widget, recieves path to an image, width and height and displays the image
*  inside the given borders
* ParentClass: StatelessWidget
*
* Methods: MyImageFrame(), build()
*
* Attributes: 
*   final String imagePath;
*   final double width;
*   final double height;
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
class MyImageFrame extends StatelessWidget{

    //attributes
    final String imagePath;
    final double width;
    final double height;

    //Constructor
    MyImageFrame({this.imagePath,this.width,this.height});

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
    Widget build(BuildContext context){
        //return SizedBox with image in it
        return SizedBox(
          width: this.width,
          height: this.height,
          child: Image(
            image: AssetImage(imagePath),
          ),
        );
    }

}


/**************************************************************************
* NAME: MyBackground
* Description: 
*  Widget, to display a gradient background
* ParentClass: StatelessWidget
*
* Methods: MyBackground(), build()
*
* Attributes: 
*   final Widget child
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
class MyBackground extends StatelessWidget {
  //attributes
  final Widget child;

  //constructor
  MyBackground({this.child});

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
    //return a conatainer with Decorations and a gradient in it
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.5,
                0.7,
                0.9
              ],
              colors: [
                Colors.blueGrey[500],
                Colors.blueGrey[600],
                Colors.blueGrey[700],
                Colors.blueGrey[900],
              ]),
        ),
        child: child);
  }
}


/**************************************************************************
* NAME: MyAppBar
* Description: 
*  Widget to Display an App Bar
* ParentClass: StatelessWidget
*
* Methods: MyAppBar(),MyAppBar.height(), build()
*
* Attributes: 
*   final Widget child
*   final double height
*   final double abstand
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
class MyAppBar extends StatelessWidget {
  //attributes
  final Widget child;
  final double height;
  final double abstand;

  //constructors
  MyAppBar({this.child, this.height = 70, this.abstand = 50});
  MyAppBar.height({this.child, this.height, this.abstand});
  

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
    //return the Widget Tree
    return Padding(
      //padding, so that the bar is positioned better inside the screen
      padding: EdgeInsets.only(right: 5, left: 5, top: abstand),
      //white container, displays bar
      child: Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              //shadow under Bar
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0.0, 10.0),
                ),
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0.0, 0.0),
                )
              ]),
          child: child),
    );
  }
}

/**************************************************************************
* NAME: MyBasicAppBar
* Description: 
*  Widget, to display a more detailled AppBar
* ParentClass: StatelessWidget
*
* Methods: MyBasicAppBar(), build()
*
* Attributes: 
*   final double buttonSize
*   final Icon icon
*   final String title
*   final Function onPressed
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
class MyBasicAppBar extends MyAppBar{
  //attributes
  final double buttonSize = 70;
  final icon;
  final String title;
  final Function onPressed;

  //constructor
  MyBasicAppBar({this.icon,this.title,this.onPressed});

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
  Widget build(BuildContext context){
    return MyAppBar(
            //inhalt der App Bar
            child: Row(children: <Widget>[
              //Button
              ButtonTheme(
                //button size
                minWidth: buttonSize,
                height: buttonSize,
                child: FlatButton(
                    //decorations
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(icon),
                    //function that will be executed if button is pressed
                    onPressed: onPressed,
                  ),
              ),

              //Text
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: buttonSize),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          );
  }
}


/**************************************************************************
* NAME: MySettingsCard
* Description: 
*  Widget, to display a card in settings
* ParentClass: StatelessWidget
*
* Methods: MySettingsCard(), build()
*
* Attributes: 
*   final Widget child
*   final double height
*   final double abstand
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
class MySettingsCard extends MyAppBar {
  //attributes
  final Widget child;
  final double height = 50;
  final double abstand = 10;

  //constructor
  MySettingsCard({this.child});

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
    // return AppBar with fixed height
    return MyAppBar.height(child: child, height: height, abstand: abstand);
  }
}


/**************************************************************************
* NAME: MySettingsCard
* Description: 
*  Widget, to display a card in settings
* ParentClass: StatelessWidget
*
* Methods: MySettingsCardDeeper(), build()
*
* Attributes: 
*   final String text
*   final Function onPressed
*   final icon
*   final Color iconColor
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
class MySettingsCardDeeper extends MySettingsCard{
  //attributes
  final String text;
  final Function onPressed; 
  final icon;
  final Color iconColor;

  //constructor
  MySettingsCardDeeper({this.text, this.onPressed, this.icon,this.iconColor});

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
  Widget build(BuildContext context){
    //return a specified SettingsCard
     return MySettingsCard(
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: height,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  //Button to change Pages
                  child: FlatButton(
                    child: Row(
                      children: <Widget>[
                        //Row in Roww with text and icon
                        Row(
                          children: <Widget>[
                            //space between text and icon
                            Padding(padding: EdgeInsets.only(left: 6.5)),
                            Icon(
                              icon,
                              color: iconColor,
                            ),
                            //distance between text and icon
                            Padding(padding: EdgeInsets.only(left: 10)),
                            //text
                            Text(text,
                                style: TextStyle(
                                  fontSize: 15,
                                ),),
                          ],
                        ),

                        //Expanded Row Containing Arrow to the left
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    onPressed: onPressed,
                  ),
                ),
              );
   }
}


/**************************************************************************
* NAME: MySettingsCard
* Description: 
*  Widget, to display a Car in settings
* ParentClass: StatelessWidget
*
* Methods: MyCarInSettings(), build()
*
* Attributes: 
*   final String text
*   final Function onPressed
*   final icon
*   final Color iconColor
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
* Date: 04/2020 Levi Bohnacker Description: finals
*
**************************************************************************/
class MyCarInSettings extends StatelessWidget {
  //attributes
  double pageHeight = 0;
  double pageWidth = 0;
  final int myCarNumber;
  final String imagePath;
  final myIcon;
  final CarImageState mySelector;
  final Color myColor = Colors.black;

  //constructor
  MyCarInSettings(
      {this.imagePath, this.myIcon, this.myCarNumber, this.mySelector});

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
    //Provider
    pageHeight = MediaQuery.of(context).size.height;
    pageWidth = MediaQuery.of(context).size.width;
    //return Widget
    return Container(
      height: pageHeight / 5,
      width: pageWidth / 5,

      //Row with car and checkbox button
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(image: AssetImage(imagePath), height: pageHeight / 6),
          //button
          FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.transparent,
            child: myIcon,
            //select car if pressed
            onPressed: () {
              mySelector.setSelectedCar(myCarNumber);
            },
          ),
        ],
      ),
    );
  }
}


/**************************************************************************
* NAME: MyCone
* Description: 
*  Widget, to display the distances 
* ParentClass: StatelessWidget
*
* Methods: MyCarInSettings(), build()
*
* Attributes: 
*   final double width
*   final double height
*   final int  padding
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
class MyCone extends StatelessWidget {
  //attributes
  final double width;
  final double height;
  final int padding;

  //constructor
  MyCone({this.width, this.height, this.padding});


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
    //return Widget of type ClipPath
    return ClipPath(
      //set clipper to MyClipperClipper -> Clipper that clipps the distance cone
      clipper: MyClipperClipper(padding: (this.padding).toDouble()),
      
      //this is a clipper clipp a cone out of a gradient
      child: ClipPath(
        clipper: MyConeClip(),
        child: Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.red,
                Colors.yellow,
                Colors.green,
              ],
              stops: [0.3, 0.6, 1],
            ),
          ),
        ),
      ),
    );
  }
}


/**************************************************************************
* NAME: MyConeClip
* Description: 
*  this widget is a path clipper, therefore if passed as an attribute to
*  the widget ClipPath it will clip the child of ClipPath according to its function
*  getClip()
* ParentClass: CustimClipper<Path>
*
* Methods: degToRad(), getClip(), shouldReclip()
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
class MyConeClip extends CustomClipper<Path> {
  

  /**************************************************************************
  * NAME: degToRad
  * Description:  
  *   converts its parameter deg into rad and returnes it
  *
  * Subroutines Called: *none*
  *
  * Returns: double
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
  double degToRad(double deg) {
    //deg to rad
    return (deg / 360) * 2 * pi;
  }


  /**************************************************************************
  * NAME: getClip
  * Description:  
  *   this function returnes the path to Clip, a ClipPath widget will call this function
  *   and get the Path, only the content inside the Path will be displayed
  *
  * Subroutines Called: Path.arcTo(),degtoRad(), Rect.fromLTWH(), Path.lineTo(), Path.close()
  *
  * Returns: Path
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
  Path getClip(Size size) {
    //variable to save Path to.
    final myPath = Path();
    //add an arc to Path
    myPath.arcTo(
        Rect.fromLTWH(0, (2 * size.height / 3), size.width, size.height / 3),
        degToRad(0),
        degToRad(180),
        true);
    //darw lines, complete the cone
    myPath.lineTo(size.width / 2 - 20, 0);
    myPath.lineTo(size.width / 2 + 20, 0);
    myPath.lineTo(size.width, (5 * size.height / 6));
    //close the Path
    myPath.close();
    //return the path
    return myPath;
  }


  /**************************************************************************
  * NAME: shouldReclip
  * Description:  
  *   this function determines weather or not the object should be reclipped
  *   ->true
  *
  * Subroutines Called: *none*
  *
  * Returns: Path
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
  bool shouldReclip(MyConeClip oldClipper) => true;
}


/**************************************************************************
* NAME: MyConeClip
* Description: 
*  this widget is a Clipper that is generated from a path, depending on a value (padding),
*  passed to a object of this class the clipper cann be moved too the bottom, therefore  if used on the cone
*  it will clipp the top off.
* ParentClass: CustimClipper<Path>
*
* Methods: degToRad(), getClip(), shouldReclip(),  MyClipperClipper()
*
* Attributes: var padding
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
class MyClipperClipper extends CustomClipper<Path> {
  //attributes
  var padding = 0.0;

  //constructor
  MyClipperClipper({this.padding});
  
  /**************************************************************************
  * NAME: degToRad
  * Description:  
  *   converts its parameter deg into rad and returnes it
  *
  * Subroutines Called: *none*
  *
  * Returns: double
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
  double degToRad(double deg) {
    return (deg / 360) * 2 * pi;
  }


  /**************************************************************************
  * NAME: getClip
  * Description:  
  *   this function returnes the path to Clip, a ClipPath widget will call this function
  *   and get the Path, only the content inside the Path will be displayed
  *
  * Subroutines Called: Path.arcTo(),degtoRad(), Rect.fromLTWH(), Path.lineTo(), Path.close()
  *
  * Returns: Path
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
  Path getClip(Size size) {
    //set variable to store path  in
    final myPath = Path();

    //draw Path
    //x = 134 = no cone = (distance = 200), x = 0 = full cone = (distance = 0)-> x = 134/200*Padding
    myPath.arcTo(Rect.fromLTWH(0,  (134/200)*padding, size.width, (size.height / 3)),
        degToRad(0), degToRad(180), true);
    myPath.lineTo(0, size.height);
    myPath.lineTo(size.width, size.height);
    //close Path
    myPath.close();
    //return Path
    return myPath;
  }


  /**************************************************************************
  * NAME: shouldReclip
  * Description:  
  *   this function determines weather or not the object should be reclipped
  *   ->true
  *
  * Subroutines Called: *none*
  *
  * Returns: Path
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
  bool shouldReclip(MyClipperClipper oldDelegate) => true;
}