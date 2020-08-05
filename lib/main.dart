import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/homeScreen.dart';
import 'package:garage/Screens/loadingScreen.dart';
import 'package:garage/Utils/themeUtils.dart';

void main() => runApp(
  CustomTheme(
    initialThemeKey: MyThemeKeys.LIGHT,
    child: MyApp(),
  ),
);


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Garage",
      theme: CustomTheme.of(context),

      home: SafeArea(child:LoadingScreen()

      ),
    );
  }
}

