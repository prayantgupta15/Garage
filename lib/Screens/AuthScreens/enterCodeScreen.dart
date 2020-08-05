

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/homeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class EnterCodeScreen extends StatefulWidget {
  String PhoneNumber;
  EnterCodeScreen({@required this.PhoneNumber});
  @override
  _EnterCodeScreenState createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  TextEditingController controller = TextEditingController(text: "");
  bool showOTPerror = false;
  String error="";
  void onTap() {
    if (controller.text.length != 4) {
      print("OTP not entered");
      setState(() {
        showOTPerror = true;
        error = 'Enter OTP';
      });
    }
    else {
      print("OTP Correct");
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: getScreenHeight(context) * 0.1),
                  Text('Have you received a Verification Code?', style: headingStyle(context)),
                  SizedBox(height: 20),
                  Text('Enter 4 digits Code', style: labelStyle(context)),
                  SizedBox(height: 50),
                  PinCodeTextField(
                    controller: controller,
                    highlight: true,
                    highlightColor: Theme.of(context).primaryColor,
                    defaultBorderColor: Theme.of(context).primaryColor,
                    pinBoxRadius: 12,
                    hasTextBorderColor: Colors.grey,
                    maxLength: 4,
                    pinBoxHeight: getScreenWidth(context) / 6,
                    pinBoxWidth: getScreenWidth(context) / 6,
                    pinTextStyle: fieldTextStyle(context),
                    onDone: (otp) {
                      if (otp != null && otp.length == 4)
                        setState(() {
                          showOTPerror = false;
                        });
                    },
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: showOTPerror,
                    child: Text(error, style: TextStyle(color: Colors.redAccent)),
                  ),
                  SizedBox(height: 50),
                  raisedButtons(context:context,text: 'Proceed', onTap: onTap),
                  SizedBox(height: getScreenHeight(context) * 0.05),
                  Text("Resend Code",style: fieldTextStyle(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
