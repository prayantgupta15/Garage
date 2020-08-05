import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/bookingSummaryScreen.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehicleDetailsScreen extends StatefulWidget {
  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {

  final TextEditingController _regNoController = TextEditingController();
  final FocusNode _regNoFocus = FocusNode();
  final TextEditingController _ownerNameController = TextEditingController();
  final FocusNode _ownerNameFocus = FocusNode();
  final TextEditingController _manufactureController = TextEditingController();
  final FocusNode _manufactureFocus = FocusNode();
  final TextEditingController _modelController = TextEditingController();
  final FocusNode _modelFocus = FocusNode();

  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.05),
              Text('Vehicle Details', style: headingStyle(context)),
              SizedBox(height: 10),

              Text('Confirm your Vehicle details', style: subheadingStyle(context)),
              SizedBox(height: 20),

              SizedBox(height: 30),
              //OWNERNAME
              TextFormField(
                validator: (String val) {
                  if (val.isEmpty) return 'Value  cannot be empty';
                  return null;
                },
                controller: _ownerNameController,
                autofocus: false,
                focusNode: _ownerNameFocus,
//                                enableInteractiveSelection: true,

                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_regNoFocus);
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
                  labelText: "Vehicle Owner's Name",
                  labelStyle: labelStyle(context),
                ),
              ),
              SizedBox(height: 20),

              //REG. NO
              TextFormField(
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: 'xx-xx-xx-xxxx',
                    separator: '-',
                  ),
                ],
                validator: (String val) {
                  if (val.isEmpty) return 'Value  cannot be empty';
                  return null;
                },
                controller: _regNoController,
                autofocus: false,
                focusNode: _regNoFocus,
//                                enableInteractiveSelection: true,

                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_manufactureFocus);
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
                  labelText: "Vehicle Reg. Number",
                  labelStyle: labelStyle(context),
                ),
              ),
              SizedBox(height: 20),

              //PASSWORD
              TextFormField(
                validator: (String val) {
                  if (val.isEmpty) return 'Value  cannot be empty';
                  return null;
                },
//                          enableInteractiveSelection: true,
                controller: _manufactureController,
                autofocus: false,
                focusNode: _manufactureFocus,
                keyboardType: TextInputType.text,

                textInputAction: TextInputAction.next,

                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_modelFocus);
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

                  labelText: "Vehicle Manufacture",
                  labelStyle: labelStyle(context),
                ),
              ),
              SizedBox(height: 20),

              //Model TF
              TextFormField(
                validator: (String val) {
                  if (val.isEmpty) return 'Value  cannot be empty';
                  return null;
                },
//                          enableInteractiveSelection: true,
                controller: _modelController,
                autofocus: false,
                focusNode: _modelFocus,
                keyboardType: TextInputType.text,

                textInputAction: TextInputAction.done,

                onFieldSubmitted: (value) {
                  _modelFocus.unfocus();
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
                  labelText: "Vehicle Model",
                  labelStyle: labelStyle(context),
                ),
              ),
              SizedBox(height: 50),

              GestureDetector(
                onTap: (){
                  setState(() {
                      buttonTapped=true;
                  });
                  Future.delayed(Duration(milliseconds: 100), () {
                    setState(() {
                      buttonTapped=false;
                    });
                    Navigator.push(context,
                        CupertinoPageRoute(
                            builder:(context)=>BookingSummaryWrapper()
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
                  padding: EdgeInsets.all(15),
                  child: Center(child: Text("Confirm & Proceed",
                    style: TextStyle(
                      color: buttonTapped?
                      Theme.of(context).primaryColorLight
                          :Theme.of(context).primaryColorDark
                      ,fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),

                  ),),
                ),
              ),
//              SizedBox(height:getScreenHeight(context)*0.1),

            ],
          ),
        )
      ],
    );
  }
}




class VehicleDetailsWrapper extends StatefulWidget {
  @override
  _VehicleDetailsWrapperState createState() => _VehicleDetailsWrapperState();
}

class _VehicleDetailsWrapperState extends State<VehicleDetailsWrapper> {
  List pages = [
    VehicleDetailsScreen(),
    SettingHomeScreen()
  ];
  int _selectedPage=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_selectedPage],
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorLight,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          currentIndex: _selectedPage,
          onTap: (_index) {
            setState(() {
              _selectedPage = _index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text(
                'Appointments',
                style: TextStyle(
                  color: _selectedPage == 0 ? Theme.of(context).primaryColorDark : Colors.grey,
                ),
              ),
              activeIcon: SvgPicture.asset(
                'assets/list.svg',
                color: Theme.of(context).primaryColorDark,
              ),
              icon: SvgPicture.asset(
                'assets/list.svg',
                color: Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: _selectedPage == 1 ? Theme.of(context).primaryColorDark : Colors.grey,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/profile.svg',
                  color: Theme.of(context).primaryColorDark,
                ),
                icon: SvgPicture.asset(
                  'assets/profile.svg',
                  color: Colors.grey,
                )
//
//
            ),
          ],

        ),
      ),
    );
  }
}
