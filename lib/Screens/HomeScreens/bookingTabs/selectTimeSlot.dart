import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/vehicleDetailsScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getScreenHeight(context) * 0.05),
                  Text('Book Appointment', style: headingStyle(context)),
                  SizedBox(height: 10),
                  Text('Select your time Slot', style: labelStyle(context)),
                  SizedBox(height: 20),
                  Scrollbar(
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
                                  fontSize: 20,
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
                                              Theme.of(context)
                                                  .primaryColorLight:
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
                  SizedBox(height: 30),
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
                                builder:(context)=>VehicleDetailsScreen()
                            )
                        );
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: buttonTapped?Theme.of(context).primaryColor:
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
                          ,fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),

                      ),),
                    ),
                  ),
                  SizedBox(height:getScreenHeight(context)*0.2),


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
