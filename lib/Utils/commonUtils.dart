import 'package:flutter/material.dart';
import 'package:garage/Utils/utils_importer.dart';


getScreenWidth(BuildContext ctx) => MediaQuery.of(ctx).size.width;
getScreenHeight(BuildContext ctx) => MediaQuery.of(ctx).size.height;
//-----------TEXT STYLE--------------------
headingStyle(BuildContext context) => TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);

labelStyle(context) => TextStyle(
  color: Colors.grey,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

fieldTextStyle(context)=>TextStyle(
  color: Theme.of(context).primaryColor,
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
);

buttonTextStyle(context)=>TextStyle(
  color: Theme.of(context).primaryColorLight,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

whiteTextStyle(context) => TextStyle(
fontSize: 20,
fontFamily: UtilsImporter().stringUtils.FontName,
color: Theme.of(context).primaryColorLight);

bookDetailsStyle(context)=>TextStyle(
    fontSize: 18,
    fontFamily: UtilsImporter().stringUtils.FontName,
    color: Theme.of(context).primaryColorLight);

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


