import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/yourAppointmentScreen.dart';
import 'package:garage/Screens/HomeScreens/homeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';

class BookingSuccessfulScreen extends StatefulWidget {
  @override
  _BookingSuccessfulScreenState createState() =>
      _BookingSuccessfulScreenState();
}

class _BookingSuccessfulScreenState extends State<BookingSuccessfulScreen> {
  bool buttonTapped = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Theme.of(context).primaryColorLight,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.done_outline,
                size: 50,
                color: Theme.of(context).primaryColorDark,
              ),
              SizedBox(height: 20),
              Text("Booking Completed Successfully",
              style: headingStyle(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
Text("Booking ID #12345",
style: labelStyle(context),),
              SizedBox(height: 80),
              GestureDetector(
                onTap: (){
                  setState(() {
//                        buttonTapped=true;
                    buttonTapped=!buttonTapped;
                  });
                  Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder:(context)=>HomeScreen()
                      )
                  );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: buttonTapped?Theme.of(context).primaryColorDark:
                    Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).primaryColorDark),
                  ),
                  padding: EdgeInsets.all(18),
                  child: Center(child: Text("My Appointments",
                    style: TextStyle(
                      color: buttonTapped?
                      Theme.of(context).primaryColorLight
                          :Theme.of(context).primaryColorDark
                      ,fontSize: 21,


                        fontWeight: FontWeight.w600
                    ),

                  ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
