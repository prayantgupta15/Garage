import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/paymentScreen.dart';
import 'package:garage/Screens/HomeScreens/homeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';

class BookingFailScreen extends StatefulWidget {
  @override
  _BookingFailScreenState createState() => _BookingFailScreenState();
}

class _BookingFailScreenState extends State<BookingFailScreen> {
  bool button1Tapped = false;
  bool button2Tapped = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 50,
                color: Theme.of(context).primaryColorDark,
              ),
              SizedBox(height: 20),
              Text("Payment Failed",
                style: headingStyle(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text("Try Again",
                style: labelStyle(context),),
              SizedBox(height: 80),

              GestureDetector(
                onTap: (){
                  setState(() {
//                        buttonTapped=true;
                    button1Tapped=!button1Tapped;
                  });
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=>PaymentScreen()
                    ));
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: button1Tapped?Theme.of(context).primaryColor:
                    Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).primaryColorDark),
                  ),
                  padding: EdgeInsets.all(18),
                  child: Center(child: Text("Pay Again",
                    style: TextStyle(
                      color: button1Tapped?
                      Theme.of(context).primaryColorLight
                          :Theme.of(context).primaryColorDark
                      ,fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),

                  ),),
                ),
              ),
            SizedBox(height: 20),

              GestureDetector(
                onTap: (){
                  setState(() {
//                        buttonTapped=true;
                    button2Tapped=!button2Tapped;
                  });
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=>HomeScreen()
                    ));
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: button2Tapped?Theme.of(context).primaryColor:
                    Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).primaryColorDark),
                  ),
                  padding: EdgeInsets.all(18),
                  child: Center(child: Text("Go Back Home",
                    style: TextStyle(
                      color: button2Tapped?
                      Theme.of(context).primaryColorLight
                          :Theme.of(context).primaryColorDark
                      ,fontSize: 20,
                        fontWeight: FontWeight.w500
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
