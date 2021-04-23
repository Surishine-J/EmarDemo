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

class SideMenuPatient extends StatefulWidget {
  SideMenuPatient({
    Key key,
    this.currentUser,
    this.currentWard,
  }) : super(key: key);

  final String currentUser;
  final String currentWard;

  @override
  _SideMenuPatientState createState() => _SideMenuPatientState();
}

class _SideMenuPatientState extends State<SideMenuPatient> {
  String _currentUser = "";
  String _currentWard = "";
  @override
  void initState() {
    _currentUser = widget.currentUser;
    _currentWard = widget.currentWard;
    super.initState();
  }

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

                // SizedBox(height: kDefaultPadding * 2),

                /*********************  แบบเส้นแถบปุ่ม ******************** */
                SizedBox(height: kDefaultPadding * 2),
                Row(
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.person_circle,
                      size: 35.0,
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      //'พยาบาล ทดสอบระบบหน้าผู้ป่วย',
                      // widget.currentUser,
                      _currentUser,
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
                // Menu Items
                SizedBox(height: kDefaultPadding * 2),
                SideMenuItem(
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            MainAdminMedScreen(
                                currentUser: _currentUser,
                                currentWard: _currentWard),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );

                    print('กดหน้าบริหารยา');
                    print(_currentUser);
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
                                currentUser: _currentUser,
                                currentWard: _currentWard),
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
                  isActive: true,
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
                  isActive: false,
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
