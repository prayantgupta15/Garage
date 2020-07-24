import 'package:flutter_country_picker/flutter_country_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/AuthScreens/enterCodeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  Country _selected = Country.IN;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  void onTap() {
    print(phoneController.text.toString());
    if (_formKey.currentState.validate()) {
      print("Phone Number Entered Correctly");
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  EnterCodeScreen(PhoneNumber: phoneController.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,

      body:
      ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child:
              Column(
                children: <Widget>[

                  SizedBox(height: getScreenHeight(context) * 0.1),
                  Align(
                      alignment:Alignment.centerLeft,child: Text('OTP VERIFICATION', style: headingStyle(context))),
                  SizedBox(height: 50),
                  Text("Enter Mobile Number",style: labelStyle(context)),
                  Row(
                    children: <Widget>[
                      CountryPicker(
                        dense: false,
                        showFlag: true, //displays flag, true by default
                        showDialingCode:
                        true, //displays dialing code, false by default
                        showName:
                        false, //displays country name, true by default
                        showCurrency: false, //eg. 'British pound'
                        showCurrencyISO: false, //eg.// 'GBP'
                        onChanged: (Country country) {
                          setState(() {
                            _selected = country;
                          });
                        },
                        selectedCountry: _selected,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          validator: (str) {
                            str = str.trim();
                            if (str.isEmpty || str.length == 0)
                              return 'Enter Phone Number';
                            else {
                              if (str.length != 10)
                                return 'Enter Valid Phone Number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,

                          cursorColor: Theme.of(context).primaryColorDark,
                          style: fieldTextStyle(context),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark,
                                width: 5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  raisedButtons(context:context,text: 'Proceed', onTap: onTap),
                  SizedBox(height: getScreenHeight(context) * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
