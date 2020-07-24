import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectService.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectTimeSlot.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';

class SelectModelScreen extends StatefulWidget {
  @override
  _SelectModelScreenState createState() => _SelectModelScreenState();
}

class _SelectModelScreenState extends State<SelectModelScreen> {
  int _selectedIndex;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body:  ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getScreenHeight(context) * 0.05),
                  Text('Book Appointment', style: headingStyle(context)),
                  SizedBox(height: 10),
                  Text('Select your Vehicle Type', style: labelStyle(context)),
                  SizedBox(height: 20),
              Scrollbar(
                child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 28,
                    childAspectRatio: 1.3,
                  ),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: modelsList.length,
//                      modelsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                                      decoration: BoxDecoration(

                                          color: _selectedIndex == index?
                                          Theme.of(context).primaryColorLight
                                          :Theme.of(context).primaryColor,
//                                          gradient: _selectedIndex == index
//                                              ? linearGradient
//                                              : null,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Theme.of(context).primaryColorDark,
                                          )),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              modelsList[index],
                              style: TextStyle(
                                color: _selectedIndex == index
                                    ? Theme.of(context).primaryColorDark
                                    : Theme.of(context).primaryColorLight,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                          ),
                        ),
                        onTap: () {
                          _selectedIndex = index;
                          setState(() {
                            Future.delayed(
                                Duration(milliseconds: 100), () {
//                                          CATEGORY = categories[index];
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          SelectServiceScreen()));
                            });
                          });
                        });
                  },
                ),
              ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorLight,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}


