import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main/main_adminmed_screen.dart';
import '../../main/main_patient_screen.dart';
import '../../main/main_recievemed_screen.dart';
import '../../main/side_menu_item.dart';
import '../../responsive.dart';

class SideMenuRecieve extends StatefulWidget {
  @override
  _SideMenuRecieveState createState() => _SideMenuRecieveState();
}

class _SideMenuRecieveState extends State<SideMenuRecieve> {
  Gradient g1 = LinearGradient(
    colors: [
      Color(0xFF7F00FF),
      Color(0xFFE100FF),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgLightColor,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/c66bg.png",
                      //  width: 46,
                      width: 120,
                    ),
                    Spacer(),
                    if (!Responsive.isDesktop(context)) CloseButton(),
                  ],
                ),
                SizedBox(height: kDefaultPadding * 2),
                Row(
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.person_circle,
                      size: 35.0,
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      'พยาบาล ทดสอบระบบ',
                      style: subtitleCardTextStyle,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: kDefaultPadding * 3),
                    Text(
                      'ผู้ใช้ระบบ',
                      style: subtitleTextStyle,
                    )
                  ],
                ),
                SizedBox(height: kDefaultPadding * 2),
                SideMenuItem(
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            MainAdminMedScreen(
                                // pass your data to be changed on main screen
                                ),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );

                    print('กดหน้าบริหารยา');
                  },
                  title: "บริหารยา",
                  gradientIcon: Icon(
                    FontAwesomeIcons.pills,
                    color: logoadmin,
                    size: 28,
                  ),
                  isActive: false,
                  itemCount: 3,
                ),
                SideMenuItem(
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            MainPatientScreen(
                                // pass your data to be changed on main screen
                                ),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );

                    print('กดหน้าผู้ป่วย');
                  },
                  title: "ผู้ป่วย",
                  gradientIcon: Icon(
                    Icons.person_add,
                    color: logopatient,
                    size: 28,
                  ),
                  isActive: false,
                ),
                SideMenuItem(
                  // ignore: unnecessary_statements
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              MainRecieveMedScreen(
                                  // pass your data to be changed on main screen
                                  ),
                          transitionDuration: Duration(seconds: 0)),
                    );
                    print('รับยาเข้าหอผู้ป่วย');
                  },

                  title: "รับยาเข้าหอผู้ป่วย",
                  gradientIcon: Icon(
                    FontAwesomeIcons.handHoldingMedical,
                    color: logorecived,
                    size: 28,
                  ),
                  isActive: true,
                ),
                SizedBox(height: kDefaultPadding * 10),
                SideMenuItem(
                  press: () {},
                  title: "ออกจากระบบ",
                  gradientIcon: Icon(
                    Icons.logout,
                    color: logologout,
                    size: 28,
                  ),
                  isActive: false,
                  showBorder: false,
                ),
                /********************* จบ แบบเส้นแถบปุ่ม ******************** */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
