import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/paymentScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';

class BookingSummaryScreen extends StatefulWidget {
  @override
  _BookingSummaryScreenState createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColorLight,
          body: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:30,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.05),
              Text('Booking Summary', style: headingStyle(context)),
              SizedBox(height: 10),
              Text('Confirm your appointment', style: labelStyle(context)),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      flex:2,
                      child: Text("Service",style: headingStyle(context),)),
                  Expanded(
                      flex: 1,
                      child: Text("Time",style: headingStyle(context),)),
                  Expanded(
                      flex: 1,
                      child: Text("Price",style: headingStyle(context),)),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: selectedServices.length??0,
                  itemBuilder: (context,serviceIndex){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex:2,
                              child: Text(services[selectedServices[serviceIndex]],style: fieldTextStyle(context),)),
                          Expanded(
                              flex: 1,
                              child: Text("15min",style: fieldTextStyle(context),)),
                          Expanded(
                              flex: 1,
                              child: Text("\$40",style: fieldTextStyle(context),)),
                        ],
                      ),
                    );
                  }
              ),

              SizedBox(height: 30),

              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text("Convenience Fee",style: fieldTextStyle(context),),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text("\$5",style: fieldTextStyle(context),)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text("Tax",style: fieldTextStyle(context),),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text("\$5",style: fieldTextStyle(context),)),
                ],
              ),

              SizedBox(height: 30),

              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text("Total",style: fieldTextStyle(context),),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text("\$5",style: headingStyle(context),)),
                ],
              ),
              SizedBox(height: 30),

              Text("Apply Coupon",style: fieldTextStyle(context),),
              SizedBox(height:getScreenHeight(context)*0.1),
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
                            builder:(context)=>PaymentScreen()
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
                  child: Center(child: Text("Pay Now",
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
            SizedBox(height: getScreenHeight(context)*0.2)
            ],
          ),
        )
      ]),

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
