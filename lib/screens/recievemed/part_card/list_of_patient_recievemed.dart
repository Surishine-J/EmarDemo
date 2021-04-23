
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/MedRecieve.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../patient/part_menusidebar/side_menu_patient.dart';
import '../../responsive.dart';
import '../part_screen/recievemed_screen.dart';
import 'patient_recieve_card.dart';


class ListOfRecieveMed extends StatefulWidget {
  const ListOfRecieveMed({
    Key key,
    this.isActive = true,
    // this.patient,
    this.mrc,
    this.press,
  }) : super(key: key);

  final bool isActive;

  final MedRecieve mrc;
  final VoidCallback press;
  @override
  _ListOfRecieveMedState createState() => _ListOfRecieveMedState();
}

class _ListOfRecieveMedState extends State<ListOfRecieveMed> {
  // List<MedRecieve> mrc = medrecieves;
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          // child: SideMenu(),
          child: SideMenuPatient(),
        ),
        body: Container(
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          color: kBgDarkColor,
          // color: kSecondaryColor,
          child: SafeArea(
            right: false,
            child: Column(
              children: [
                // This is our Seearch bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding / 2),
                  child: Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                        ),
                      if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "ป้อน HN ผู้ป่วย",
                            hintStyle:
                                subtitleTextStyle, // style: subtitleTextStyle,
                            fillColor: kBgLightColor,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(
                                  kDefaultPadding * 0.75), //15
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(
                                  kDefaultPadding * 0.75), //15
                              child: WebsafeSvg.asset(
                                "assets/Icons/Search.svg",
                                width: 24,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "รับรายการยาเข้าหอผู้ป่วย",
                        style: subtitleCardTextStyle,
                      ),
                    ],
                  ),
                ),
                //  SizedBox(height: kDefaultPadding),
                Expanded(
                  child: ListView.builder(
                    itemCount: medrecieves.length,
                    // On mobile this active dosen't mean anything
                    itemBuilder: (context, index) => RecievePatientCard(
                      isActive:
                          Responsive.isMobile(context) ? false : index == 0,

                      mrc: medrecieves[index],

                      //==== กดแล้วไปหน้ารับยาเข้าหอผู้ป่วย =====
                      press: () {
                        if (Responsive.isMobile(context)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecieveMedScreen(mrc: medrecieves[index]),
                            ),
                          );
                        }
                      },
                      //==== จบกดแล้วไปหน้ารับยาเข้าหอผู้ป่วย =====
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
