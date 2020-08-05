import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/paymentScreen.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingSummaryScreen extends StatefulWidget {
  @override
  _BookingSummaryScreenState createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 30, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: getScreenHeight(context) * 0.05),
            Text('Booking Summary', style: headingStyle(context)),
            SizedBox(height: 10),
            //sub heading
            Text('Confirm your appointment', style: subheadingStyle(context)),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Text(
                      "Service",
                      style: summaryHeads(context)
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Time",
                      style: summaryHeads(context),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Price",
                      style: summaryHeads(context),
                    )),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: selectedServices.length ?? 0,
                itemBuilder: (context, serviceIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Text(
                              services[selectedServices[serviceIndex]],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 21.0,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "15min",
                              style: fieldTextStyle(context),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "\$40",
                              style: fieldTextStyle(context),
                            )),
                      ],
                    ),
                  );
                }),
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    "Convenience Fee",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "\$5",
                      style: fieldTextStyle(context),
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    "Tax",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "\$5",
                      style: fieldTextStyle(context),
                    )),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "\$5",
                      style: summaryHeads(context),
                    )),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Apply Coupon",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21.0,
              ),
            ),
            SizedBox(height: getScreenHeight(context) * 0.1),
            GestureDetector(
              onTap: () {
                setState(() {
                  buttonTapped = true;
                });
                Future.delayed(Duration(milliseconds: 100), () {
                  setState(() {
                    buttonTapped = false;
                  });
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PaymentWrapper()));
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: buttonTapped
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(12),
                  border:
                      Border.all(color: Theme.of(context).primaryColorDark),
                ),
                padding: EdgeInsets.all(18),
                child: Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        color: buttonTapped
                            ? Theme.of(context).primaryColorLight
                            : Theme.of(context).primaryColorDark,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: getScreenHeight(context) * 0.2)
          ],
        ),
      )
    ]);
  }
}





class BookingSummaryWrapper extends StatefulWidget {
  @override
  _BookingSummaryWrapperState createState() => _BookingSummaryWrapperState();
}

class _BookingSummaryWrapperState extends State<BookingSummaryWrapper> {
  List pages = [
    BookingSummaryScreen(),
    SettingHomeScreen()
  ];
  int _selectedPage=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).primaryColorLight,
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
                  color: Theme.of(context).primaryColor,
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