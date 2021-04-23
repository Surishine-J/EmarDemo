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

class SideMenuAdminMed extends StatefulWidget {
  SideMenuAdminMed({
    Key key,
    this.currentUser,
    this.currentWard,
  }) : super(key: key);

  final String currentUser;
  final String currentWard;

  @override
  _SideMenuAdminMedState createState() => _SideMenuAdminMedState();
}

class _SideMenuAdminMedState extends State<SideMenuAdminMed> {
  String _currentUser = "";
  String _currentWard = "";
  @override
  void initState() {
    setState(() {
      _currentUser = widget.currentUser;
      _currentWard = widget.currentWard;
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // Menu Items
              /********************* จบ แบบเส้นแถบปุ่ม ******************** */

              SizedBox(height: kDefaultPadding * 2),
              Row(
                children: <Widget>[
                  SizedBox(width: 2.0),
                  Icon(
                    CupertinoIcons.person_circle,
                    //Icons.person,
                    size: 35.0,
                  ),
                  SizedBox(width: kDefaultPadding),
                  Text(
                    // 'พยาบาล ทดสอบระบบ',
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
                },
                title: "บริหารยา",
                gradientIcon: Icon(
                  FontAwesomeIcons.pills,
                  color: logoadmin,
                  size: 28,
                ),
                isActive: true,
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
                              currentWard: _currentWard
                              // pass your data to be changed on main screen
                              ),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );

                  print('กดหน้าผู้ป่วย');
                  print(_currentUser);
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
    );
  }
}
