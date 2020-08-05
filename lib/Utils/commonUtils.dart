import 'package:flutter/material.dart';
import 'package:garage/Utils/utils_importer.dart';


getScreenWidth(BuildContext ctx) => MediaQuery.of(ctx).size.width;
getScreenHeight(BuildContext ctx) => MediaQuery.of(ctx).size.height;
//-----------TEXT STYLE--------------------
headingStyle(BuildContext context) => TextStyle(
//  color: Theme.of(context).primaryColorLi,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
subheadingStyle(BuildContext context) => TextStyle(
  fontSize: 21.0,
  fontWeight: FontWeight.w500,
);

labelStyle(context) => TextStyle(
  color: Theme.of(context).primaryColorDark,
  fontSize: 17,
//  color: Colors.grey,
  //Font Weight: Normal
);
fieldTextStyle(context)=>TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 21.0,
  fontFamily: 'Avenir',

);


summaryHeads(context)=>TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 21.0,
);

buttonTextStyle(context)=>TextStyle(
  color: Theme.of(context).primaryColorLight,
  fontSize: 21.0,
  fontWeight: FontWeight.w600,
);

themeTextStyle(context)=>TextStyle(
  color: Theme.of(context).primaryColor,
  fontSize: 21.0,
);

serviceSchTextStyle(context) => TextStyle(
    fontSize: 25,
color: Colors.white
);
carNameTextStyle(context) => TextStyle(
  fontFamily: 'Avenir',
fontSize: 25,
fontWeight: FontWeight.bold,
  color: Colors.white

);

bookDetailsStyle(context)=>TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    fontFamily: 'Avenir',
    color: Colors.white
);

//-------------BUTTON-------------------
raisedButtons({
  @required BuildContext context,
  @required String text,
  @required onTap,
}) =>
    GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
color: Theme.of(context).primaryColor
//          gradient: linearGradient,
        ),
        child: Center(child: Text(text, style: buttonTextStyle(context))),
      ),
      onTap: onTap,
    );


