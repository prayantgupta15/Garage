import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/selectTimeSlot.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';

class SelectServiceScreen extends StatefulWidget {
  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
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
                  Text('Select required Service', style: labelStyle(context)),
                  SizedBox(height: 20),
                  Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              title: Text(
                                services[index],
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Icon(
                                selectedServices.contains(index)
                                    ? Icons.done
                                    : null,
                                color: Theme.of(context).primaryColorLight,
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
                          builder:(context)=>SelectTimeslotScreen()
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
