
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage/Screens/AuthScreens/phoneVerificationScreen.dart';
import 'package:garage/Screens/AuthScreens/enterCodeScreen.dart';
import 'package:garage/Screens/AuthScreens/signInScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/utils_importer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _userNameFocus = FocusNode();
  final TextEditingController _pwdController1 = TextEditingController();
  final FocusNode _pwdFocus1 = FocusNode();
  final TextEditingController _pwdController2 = TextEditingController();
  final FocusNode _pwdFocus2 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool obscure = true;
  bool _isLoading = false;

  //METHODS
  void onTap(){
    if(_formKey.currentState.validate()){
      print("");
      Navigator.push(context,
          CupertinoPageRoute(
        builder: (context)=>PhoneVerificationScreen(
        )
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),

              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,0,0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Sign Up",
                                style: headingStyle(context)

                            ),
                          ),
                          SizedBox(height: 30),
                          //USERNAME
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) return 'value cannot be empty';
                              return null;
                            },
                            controller: _userNameController,
                            autofocus: false,
                            focusNode: _userNameFocus,
//                                enableInteractiveSelection: true,

                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_emailFocus);
                            },
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
                              labelText: "Username",
                              labelStyle: labelStyle(context),
                            ),
                          ),
                          SizedBox(height: 20),

                          //EMAIL
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) return 'value cannot be empty';
                              return null;
                            },
                            controller: _emailController,
                            autofocus: false,
                            focusNode: _emailFocus,
//                                enableInteractiveSelection: true,

                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_pwdFocus1);
                            },
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
                              labelText: "E-mail",
                              labelStyle: labelStyle(context),
                            ),
                          ),
                          SizedBox(height: 20),

                          //PASSWORD
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) return 'value cannot be empty';
                              return null;
                            },
//                          enableInteractiveSelection: true,
                            controller: _pwdController1,
                            obscureText: obscure,
                            autofocus: false,
                            focusNode: _pwdFocus1,
                            keyboardType: TextInputType.text,

                            textInputAction: TextInputAction.done,

                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_pwdFocus2);
                            },
                            style: fieldTextStyle(context),
                            cursorColor: Theme.of(context).primaryColorDark,

                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 5,
                                ),
                              ),
                              suffixIcon: IconButton(
                                color: Theme.of(context).primaryColor,
                                icon: obscure
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(MdiIcons.eyeOff),
                                onPressed: () {
                                  print("pressed");
                                  obscure ? obscure = false : obscure = true;
                                  setState(() {});
                                },
                              ),
                              labelText: "Password",
                              labelStyle: labelStyle(context),
                            ),
                          ),
                          SizedBox(height: 20),

                          //confirm PASSWORD
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) return 'value cannot be empty';
                              else if(val!=_pwdController1.text)
                                return 'Password not matching';
                              return null;
                            },
//                          enableInteractiveSelection: true,
                            controller: _pwdController2,
                            obscureText: obscure,
                            autofocus: false,
                            focusNode: _pwdFocus2,
                            keyboardType: TextInputType.text,

                            textInputAction: TextInputAction.done,

                            onFieldSubmitted: (value) {
                              _pwdFocus2.unfocus();
                            },
                            style: fieldTextStyle(context),
                            cursorColor: Theme.of(context).primaryColorDark,

                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 5,
                                ),
                              ),
                              suffixIcon: IconButton(
                                color: Theme.of(context).primaryColor,
                                icon: obscure
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(MdiIcons.eyeOff),
                                onPressed: () {
                                  print("pressed");
                                  obscure ? obscure = false : obscure = true;
                                  setState(() {});
                                },
                              ),
                              labelText: "Confirm Password",
                              labelStyle: labelStyle(context),
                            ),
                          ),
                          SizedBox(height: 20),

                          Text("Terms & Conditions",style: labelStyle(context)),
                          SizedBox(height: 20),
                          raisedButtons(context: context,
                              text: 'Sign Up', onTap: onTap
                          ),
                          SizedBox(height: 30),//SING UP
                          GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context,MaterialPageRoute(
                                  builder: (context)=>LoginScreen()
                                ));
                              },
                              child:
                              RichText(
                                text: TextSpan(
                                    text: "Already have account?",
                                    style: labelStyle(context),
                                    children: [
                                      TextSpan(
                                        text: " Sign In!",
                                        style: fieldTextStyle(context),
                                      )
                                    ]
                                ),
                              ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(),
          ],
        ),
      ),
    );
  }
}
