import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectService.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectTimeSlot.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectModelScreen extends StatefulWidget {
  @override
  _SelectModelScreenState createState() => _SelectModelScreenState();
}

class _SelectModelScreenState extends State<SelectModelScreen> {
  int _selectedIndex;


  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.05),
              Text('Book Appointment', style: headingStyle(context)),
              SizedBox(height: 10),
              //sub heading
              Text('Select your Vehicle Type', style: subheadingStyle(context)),
              SizedBox(height: 20),
          Scrollbar(
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
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
//                                      border: Border.all(
//                                        color: Theme.of(context).primaryColorDark,
//                                      )
                                  ),
                      child: Stack(
                        children: <Widget>[
                          //MODEL IMAGE
                          Image.asset(
                            index==5?
                          'assets/bike.png':'assets/'+
//                              modelIcons[index]+
                              'car-0${index+1}'
                              '.png',
                            color:
                            _selectedIndex == index?
                            Theme.of(context).primaryColorDark
                                : Colors.white,
                          ),
                            //MODEL NAME
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              modelsList[index],
                              style: TextStyle(
                                color: _selectedIndex == index
                                    ? Theme.of(context).primaryColorDark
                                    : Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      _selectedIndex = index;
                      setState(() {
                        Future.delayed(
                            Duration(milliseconds: 100), () {

                              setState(() {
                                _selectedIndex=-1;
                              });

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SelectServiceWrapper()));
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
    );
  }
}


class SelectModelWrapper extends StatefulWidget {
  @override
  _SelectModelWrapperState createState() => _SelectModelWrapperState();
}

class _SelectModelWrapperState extends State<SelectModelWrapper> {
  List pages = [
    SelectModelScreen(),
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


