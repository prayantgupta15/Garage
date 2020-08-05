import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectTimeSlot.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectServiceScreen extends StatefulWidget {
  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
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
          Text('Select required Service', style: subheadingStyle(context)),
          SizedBox(height: 10),
          Container(
            height: getScreenHeight(context)*0.6,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                        //SERVICE NAME
                        services[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        selectedServices.contains(index)
                            ? Icons.done
                            : null,
                        color: Colors.white,
                      ),
                      onTap: () {
                        selectedServices.contains(index)
                            ? selectedServices.remove(index)
                            : selectedServices.add(index);
                        setState(() {});

                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              setState(() {
//                    buttonTapped=true;
              buttonTapped=!buttonTapped;
              });
              Future.delayed(Duration(milliseconds: 100), () {
                setState(() {
                  buttonTapped=false;
                });
                Navigator.push(context,
                CupertinoPageRoute(
                  builder:(context)=>SelectTimeslotWrapper()
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
        ],
      ),
    );
  }
}



class SelectServiceWrapper extends StatefulWidget {
  @override
  _SelectServiceWrapperState createState() => _SelectServiceWrapperState();
}

class _SelectServiceWrapperState extends State<SelectServiceWrapper> {
  List pages = [
    SelectServiceScreen(),
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