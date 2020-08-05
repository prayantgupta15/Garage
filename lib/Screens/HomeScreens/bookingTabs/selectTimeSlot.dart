import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/vehicleDetailsScreen.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectTimeslotScreen extends StatefulWidget {
  @override
  _SelectTimeslotScreenState createState() => _SelectTimeslotScreenState();
}

class _SelectTimeslotScreenState extends State<SelectTimeslotScreen> {
  //Selected DATE AND TIME INDICES
  int selectedDateIndex, selectedTimeIndex;
  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getScreenHeight(context) * 0.05),
          Text('Book Appointment', style: headingStyle(context)),
          SizedBox(height: 10),
          //sub heading
          Text('Select your time Slot', style: subheadingStyle(context)),
          SizedBox(height: 10),
          Container(
            height: getScreenHeight(context)*0.60,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: slots.length,
                itemBuilder: (context, dateIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          slots.keys.toList()[dateIndex],
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                          fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18,
                            childAspectRatio: 2.5,
                          ),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: slots[slots.keys.toList()[dateIndex]]
                              .length,
                          itemBuilder: (context, timeIndex) {
                            List<String> timeSlots =
                                slots[slots.keys.toList()[dateIndex]];
                            return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: dateIndex==selectedDateIndex&&
                                        timeIndex==selectedTimeIndex?
                                    Theme.of(context)
                                        .primaryColor:
                                    Theme.of(context)
                                        .primaryColorLight,
                                    borderRadius:
                                        BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Center(
                                  child: Text(
                                    timeSlots[timeIndex],
                                    style: TextStyle(
                                      color: dateIndex==selectedDateIndex&&
                                          timeIndex==selectedTimeIndex?
                                      Colors.white:
                                      Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedDateIndex = dateIndex;
                                  selectedTimeIndex = timeIndex;
                                });
                              },
                            );
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(height: 10),
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
                        builder:(context)=>VehicleDetailsWrapper()
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
              child: Center(child: Text("Continue",
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
//          SizedBox(height:getScreenHeight(context)*0.2),


        ],
      ),
    );
  }
}





class SelectTimeslotWrapper extends StatefulWidget {
  @override
  _SelectTimeslotWrapperState createState() => _SelectTimeslotWrapperState();
}

class _SelectTimeslotWrapperState extends State<SelectTimeslotWrapper> {
  List pages = [
    SelectTimeslotScreen(),
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