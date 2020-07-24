
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage/Screens/AuthScreens/signUpScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/utils_importer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _userNameFocus = FocusNode();
  final TextEditingController _pwdController = TextEditingController();
  final FocusNode _pwdFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool obscure = true;
  bool _isLoading = false;

  //METHODS
  void onTap(){
    if(_formKey.currentState.validate()){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=>SignupScreen()
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
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Sign In",
                                style: headingStyle(context)

                            ),
                          ),
                          SizedBox(height: 80),

                          //USERNAME
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) return 'Value cannot be empty';
                              return null;
                            },
                            controller: _userNameController,
                            autofocus: false,
                            focusNode: _userNameFocus,
//                                enableInteractiveSelection: true,

                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_pwdFocus);
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
                              labelText: "User ID",
                              labelStyle: labelStyle(context),
                            ),
                          ),
                          SizedBox(height: 20),

                          //PASSWORD
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) return 'Value cannot be empty';
                              return null;
                            },
//                          enableInteractiveSelection: true,
                            controller: _pwdController,
                            obscureText: obscure,
                            autofocus: false,
                            focusNode: _pwdFocus,
                            keyboardType: TextInputType.text,

                            textInputAction: TextInputAction.done,

                            onFieldSubmitted: (value) {
                              _pwdFocus.unfocus();
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

                          Text("Forgot password ?",style: labelStyle(context)),
                          SizedBox(height: 20),
                            raisedButtons(context: context,
                                text: 'Sign In', onTap: onTap
                            ),
                          SizedBox(height: 30),//SIGN UP
                          GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context)=>SignupScreen()
                                ));
                              },
                              child:
                              RichText(
                                text: TextSpan(
                                  text: "Dont have account?",
                                    style: labelStyle(context),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: " Create One!",
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
