import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage/Utils/commonUtils.dart';
import 'package:garage/Utils/rawData.dart';
import 'package:garage/Utils/themeUtils.dart';

class SettingHomeScreen extends StatefulWidget {
  @override
  _SettingHomeScreenState createState() => _SettingHomeScreenState();
}

class _SettingHomeScreenState extends State<SettingHomeScreen> {
  bool isDarkThemeMode = false;
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
//        shrinkWrap: true,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getScreenHeight(context) * 0.05),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Account Setting",
                        style: headingStyle(context),
                      ),
                      IconButton(
                        icon: Icon(isDarkThemeMode
                            ? Icons.brightness_7
                            : Icons.brightness_2),
                        iconSize: 30,
                        highlightColor: Theme.of(context).primaryColorDark,
                        onPressed: () {
                          if (isDarkThemeMode == true) {
                            setState(() {
                              isDarkThemeMode = false;
                            });
//                          SharedPreferencesUtil.saveIsDarkThemeMode(false);
                            _changeTheme(context, MyThemeKeys.LIGHT);
                          } else {
                            setState(() {
                              isDarkThemeMode = true;
                            });
//                          SharedPreferencesUtil.saveIsDarkThemeMode(true);
                            _changeTheme(context, MyThemeKeys.DARK);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Update your Account Settings,",
                      style:labelStyle(context)),
                  SizedBox(height: 30),
                  ListView.separated(
                    physics: ScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      itemCount: settings.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                           settingIcons[index],
                            color: Theme.of(context).primaryColorDark,
                            size: 30,
                          ),
                          title: Text(
                            settings[index],
                            style: fieldTextStyle(context),

                          ),
                          subtitle: Text(
                            settingsSub[index],
                            style: labelStyle(context),
                          ),
                          onTap: (){},
                        );
                      }),
                  SizedBox(height: getScreenHeight(context)*0.02)
                ],
              )),
        ],
      ),
    );
  }
}
