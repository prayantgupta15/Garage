
import 'package:flutter/material.dart';
import 'package:garage/Utils/commonUtils.dart';

//NAVIGATION BAR ITEM = 1

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: getScreenHeight(context) * 0.2),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset('assets/diagBG.png', color: Colors.grey),
                Image.asset('assets/person.png',color:Theme.of(context).primaryColorDark),
              ],
            ),
          ),
          SizedBox(height: 30),
          Center(child: Text('Hi! ' + 'USER_NAME', style: headingStyle(context))),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
