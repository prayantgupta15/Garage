import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/bookingFailScreen.dart';
import 'package:garage/Screens/HomeScreens/bookingTabs/bookingSuccessfullScreen.dart';
import 'package:garage/Screens/settingScreens/settingHomeScreen.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/utils_importer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool buttonTapped = false;

  void addCardBottomSheet() {
    bool addCardTapped = false;
    bool payNowTapped = false;
    final TextEditingController _NoController = TextEditingController();
    final FocusNode _NoFocus = FocusNode();
    final TextEditingController _NameController = TextEditingController();
    final FocusNode _NameFocus = FocusNode();
    final TextEditingController _dateController = TextEditingController();
    final FocusNode _dateFocus = FocusNode();
    final TextEditingController _cvvController = TextEditingController();
    final FocusNode _cvvFocus = FocusNode();
    bool isCardAdded = false;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Theme.of(context).primaryColorLight,
        context: context,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter ss) => Container(
              height: getScreenHeight(context) * 0.75,
              padding: EdgeInsets.fromLTRB(30,30,30,0),
              child: !isCardAdded
                  ? ListView(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Text("Add New Card", style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Avenir',
                        )),
                        SizedBox(height: 20),

                        //OWNERNAME
                        TextFormField(
                          validator: (String val) {
                            if (val.isEmpty) return 'Value  cannot be empty';
                            return null;
                          },
                          controller: _NameController,
                          autofocus: false,
                          focusNode: _NameFocus,
//                                enableInteractiveSelection: true,

                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(_NoFocus);
                          },
                          cursorColor: Theme.of(context).primaryColorDark,
                          style: fieldTextStyle(context),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark,
                                width: 5,
                              ),
                            ),
                            labelText: "Name on Card",
                            labelStyle: labelStyle(context),
                          ),
                        ),
                        SizedBox(height: 20),

                        //CARD NO
                        TextFormField(
                          inputFormatters: [
                            MaskedTextInputFormatter(
                              mask: 'xxxx-xxxx-xxxx-xxxx',
                              separator: '-',
                            ),
                          ],
                          validator: (String val) {
                            if (val.isEmpty) return 'Value cannot be empty';
                            return null;
                          },

                          controller: _NoController,
                          autofocus: false,
                          focusNode: _NoFocus,
//                                enableInteractiveSelection: true,

                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(_dateFocus);
                          },
                          cursorColor: Theme.of(context).primaryColorDark,
                          style: fieldTextStyle(context),
                          decoration: InputDecoration(
                            helperText: "xxxx-xxxx-xxxx-xxxx",
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark,
                                width: 5,
                              ),
                            ),
                            labelText: "Card Number",
                            labelStyle: labelStyle(context),
                          ),
                        ),
                        SizedBox(height: 10),

                        //DATE
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
//                width:100,
                                child: TextFormField(
                                  validator: (String val) {
                                    if (val.isEmpty)
                                      return 'Value cannot be empty';
                                    return null;
                                  },
                                  inputFormatters: [
                                    MaskedTextInputFormatter(
                                      mask: 'MM/YY',
                                      separator: '/',
                                    ),
                                  ],
//                          enableInteractiveSelection: true,
                                  controller: _dateController,
                                  autofocus: false,
                                  focusNode: _dateFocus,
                                  keyboardType: TextInputType.number,

                                  textInputAction: TextInputAction.next,

                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(_cvvFocus);
                                  },
                                  style: fieldTextStyle(context),
                                  cursorColor:
                                      Theme.of(context).primaryColorDark,

                                  decoration: InputDecoration(
                                    helperText: "MMYY",
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        width: 5,
                                      ),
                                    ),
                                    labelText: "Expiry Date",
                                    labelStyle: labelStyle(context),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 60),
                            //CVV
                            Expanded(
                              child: Container(
//                width:100,
                                child: TextFormField(
                                  validator: (String val) {
                                    if (val.isEmpty)
                                      return 'Value  cannot be empty';
                                    return null;
                                  },
//                          enableInteractiveSelection: true,
                                  controller: _cvvController,
                                  autofocus: false,
                                  focusNode: _cvvFocus,
                                  keyboardType: TextInputType.number,

                                  textInputAction: TextInputAction.done,

                                  onFieldSubmitted: (value) {
                                    _cvvFocus.unfocus();
                                  },
                                  onChanged: (str) {
                                    if (str.length >= 3) _cvvFocus.unfocus();
                                  },
                                  style: fieldTextStyle(context),
                                  cursorColor:
                                      Theme.of(context).primaryColorDark,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    helperText: 'xxx',
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        width: 5,
                                      ),
                                    ),
                                    labelText: "CVV",
                                    labelStyle: labelStyle(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),

                        GestureDetector(
                          onTap: () {
                            ss(() {
                        addCardTapped=true;
                            });
                            Future.delayed(Duration(milliseconds: 500), () {

                              ss(() {
                                addCardTapped=false;
                                isCardAdded = true;

                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: addCardTapped
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            padding: EdgeInsets.all(18),
                            child: Center(
                              child: Text(
                                "Add Card",
                                style: TextStyle(
                                  color: addCardTapped
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 300),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        SizedBox(
                          height: getScreenHeight(context) * 0.1,
                        ),

//                        Container(
//                          decoration: BoxDecoration(
//                              color: Theme.of(context).primaryColor,
//                              shape: BoxShape.circle),
//                          padding: EdgeInsets.all(20),
//                          child: Icon(
//                            Icons.done_outline,
//                            color: Theme.of(context).primaryColorLight,
//                            size: 40,
//                          ),
//                        ),
                        SizedBox(height: 20),
                        Text(
                          "New Card Added Successfully!",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,

                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            ss(() {
                              payNowTapped = true;
                            });
                            Future.delayed(Duration(milliseconds: 100), () {
                              ss(() {
                                payNowTapped=false;
                              });
                              Navigator.pop(context);
Navigator.push(context, MaterialPageRoute(
  builder: (context)=>BookingFailScreen()
));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: payNowTapped
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            padding: EdgeInsets.all(18),
                            child: Center(
                              child: Text(
                                "Pay Now",
                                style: TextStyle(
                                  color: payNowTapped
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                                  fontSize: 21,

                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.05),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Payment', style: headingStyle(context)),
                    Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        GestureDetector(
                            onTap: () => addCardBottomSheet(),
                            child: Text("Add New Card"))
                      ],
                    ),
                  ]),
              SizedBox(height: getScreenHeight(context) * 0.05)
            ],
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: getScreenHeight(context) * 0.25,
            initialPage: 1,
            scrollPhysics: BouncingScrollPhysics(),
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int itemIndex) => Card(
            color: Theme.of(context).primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)),
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset('assets/visa.svg',color:Colors.white,),

                  //CARD NUMBER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (int j = 0; j < 3; j++)
                        for (int i = 1; i < 5; i++)
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            margin: i == 4
                                ? EdgeInsets.only(left: 2, right: 15)
                                : EdgeInsets.all(2),
                            height: 5,
                            width: 5,
                          ),
                      Text(
                        "3747",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),

                  //CARD HOLDER and DATE
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Card Holder",
                            style: TextStyle(
                                color: Colors.grey),
                          ),
                          Text(
                            "Expires",
                            style: TextStyle(
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "NAME",
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          Text(
                            "12/23",
                            style: TextStyle(
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: getScreenHeight(context) * 0.3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                      buttonTapped=true;
              });
              Future.delayed(Duration(milliseconds: 100), () async {
                setState(() {
                  buttonTapped=false;
                });
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder:(context)=>BookingSuccessfulScreen()
                        )
                    );
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: buttonTapped
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).primaryColorDark),
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
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




class PaymentWrapper extends StatefulWidget {
  @override
  _PaymentWrapperState createState() => _PaymentWrapperState();
}

class _PaymentWrapperState extends State<PaymentWrapper> {
  List pages = [
    PaymentScreen(),
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