
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectModel.dart';
import 'package:garage/Screens/HomeScreens/profileScreen.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'file:///G:/FLUTTERAPPS/garage/lib/Screens/HomeScreens/bookingTabs/yourAppointmentScreen.dart';
import 'package:garage/Utils/utils_importer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    YourAppointmentsScreen(),
    SettingHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: _pageOptions[_selectedPage],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add,size: 30,color: Theme.of(context).primaryColorLight,),
          tooltip: 'Book Appointment',
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(
                builder: (context)=>SelectModelScreen()
            ));
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
              activeIcon: Image.asset(
                'assets/list.png',
                color: Theme.of(context).primaryColor,
              ),
              icon: Image.asset(
                'assets/list.png',
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
                activeIcon: Image.asset(
                  'assets/profile.png',
                  color: Theme.of(context).primaryColor,
                ),
                icon: Image.asset(
                  'assets/profile.png',
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
