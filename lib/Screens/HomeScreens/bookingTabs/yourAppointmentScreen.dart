
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/bookingSummaryScreen.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/paymentScreen.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectModel.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectService.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectTimeSlot.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/vehicleDetailsScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:garage/Utils/utils_importer.dart';

//NAVIGATION BAR ITEM 0


class YourAppointmentsScreen extends StatefulWidget {
  @override
  _YourAppointmentsScreenState createState() => _YourAppointmentsScreenState();
}

class _YourAppointmentsScreenState extends State<YourAppointmentsScreen>{
  void onTap(){
    Navigator.push(context, CupertinoPageRoute(
        builder: (context)=>SelectModelScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    List appointmentsList=[
      "fe"
    ];
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: getScreenHeight(context) * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text("Your Appointments", style: headingStyle(context)),
        ),
        SizedBox(height: 30),
        //IF NO APPOINTMENTS BOOKED SHOW THIS COLUMN
        appointmentsList.length == 0
            ? Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Center(
                      child: Image.asset('assets/noApp.png',
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                  Text(
                    "You have no scheduled",
//                    style: subHeaderStyle,
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.2),
                    child: raisedButtons(
                      context: context,
                        text: 'BOOK',
                        onTap:onTap
                        ),
                  )
                ],
              )
            :           CarouselSlider.builder(
          options: CarouselOptions(
            height: getScreenHeight(context) * 0.68,
            initialPage: 1,
            scrollPhysics: BouncingScrollPhysics(),
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int itemIndex) => Card(
            color: Theme.of(context).primaryColor,
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(25),
              child: ListView(
//                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Service Scheduled for",
                      style: whiteTextStyle(context)
                      ),
                    SizedBox(height: 10),
                  Text("BMW X5",style: whiteTextStyle(context)),
                  SizedBox(
                    height: 50,
                  ),

                  //DATE
                  ListTile(
                    title: Text("17th March 2020",style: bookDetailsStyle(context),),
                    leading: Icon(Icons.bookmark_border,color: Theme.of(context).primaryColorLight,),
                  ),

                  //TIME
                  ListTile(
                    title: Text("11 AM",style: bookDetailsStyle(context),),
                    leading: Icon(Icons.access_time,color: Theme.of(context).primaryColorLight,),
                  ),

                  //PHONE
                  ListTile(
                    title: Text("+91 9872595",style: bookDetailsStyle(context),),
                    leading: Icon(Icons.phone,color: Theme.of(context).primaryColorLight,),
                  ),

                  //ADD
                  ListTile(
                    title: Text("Main Street, 19th Layout, Indira Nagar",style: bookDetailsStyle(context),),
                    leading: Icon(Icons.location_on,color: Theme.of(context).primaryColorLight,),
                  ),

                  //PHONE
                  ListTile(
                    title: Text("Express Wash, AC Service",style: bookDetailsStyle(context),),
                    leading: Icon(Icons.speaker_notes,color: Theme.of(context).primaryColorLight,),
                  ),

                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
