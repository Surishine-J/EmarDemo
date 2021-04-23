import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/Patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../responsive.dart';
import '../part_menusidebar/side_menu_patient.dart';
import '../part_screen/patient_screen.dart';
import 'patient_card.dart';

class ListOfPatients extends StatefulWidget {
  // Press "Command + ."
  const ListOfPatients({
    Key key,
  }) : super(key: key);

  @override
  _ListOfPatientsState createState() => _ListOfPatientsState();
}

class _ListOfPatientsState extends State<ListOfPatients> {
  @override
  void initState() {
    super.initState();
  }

  String _barcode = "";

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
                      // Once user click the menu icon the menu shows like drawer
                      // Also we want to hide this menu icon on desktop
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                        ),
                      if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                      Expanded(
                        flex: 9,
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "ป้อน HN ผู้ป่วย ",
                            hintStyle: subtitleTextStyle,
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
                      Spacer(),
                      Container(
                          //flex: 1,
                          //child: Text('test'),
                          //child: Container()
                          child: ClipOval(
                        child: Material(
                          //  color: Colors.white,
                          color: kBgLightColor, // button color
                          child: InkWell(
                            //splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                CupertinoIcons.qrcode_viewfinder,
                                size: 32.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            onTap: () {
                              // scan();
                              print(_barcode);
                            },
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                //  SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "รายชื่อผู้ป่วย Admit",
                        style: subtitleCardTextStyle,
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: kDefaultPadding),
                //================================
               /* Expanded(
                  child: ListView.builder(
                    itemCount: patients.length,
                    // On mobile this active dosen't mean anything
                    itemBuilder: (context, index) => PatientCard(
                      isActive:
                          Responsive.isMobile(context) ? false : index == 0,
                      patient: patients[index],

                      //==== กดแล้วไปหน้าผแสดงข้อมูลผู้ป่วยู้ป่วย =====
                      press: () {
                        if (Responsive.isMobile(context)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PatientScreen(patient: patients[index]),
                            ),
                          );
                        }
                      },
                      //==== จบกดแล้วไปหน้าผแสดงข้อมูลผู้ป่วยู้ป่วย =====
                    ),
                  ),
                ),*/
                //==========================================


                StreamBuilder(
                    stream:  FirebaseFirestore.instance
                        .collection('patientadmit')
                        .where('wardid', isEqualTo: '001')
                        .snapshots(),
                    builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot){
                     if(!snapshot.hasData){
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     } else{
                       return Expanded(
                         child: ListView.builder(
                           itemCount: snapshot.data.docs.length,
                           // On mobile this active dosen't mean anything
                           itemBuilder: (context, index) => PatientCard(
                             isActive:
                             Responsive.isMobile(context) ? false : index == 0,
                             //patient: patients[index],
                             patientAdmit: snapshot.data.docs[index],




                             //==== กดแล้วไปหน้าผแสดงข้อมูลผู้ป่วยู้ป่วย =====
                             press: () {
                               if (Responsive.isMobile(context)) {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) =>
                                         PatientScreen(patient: patients[index]),
                                   ),
                                 );
                               }
                             },
                             //==== จบกดแล้วไปหน้าผแสดงข้อมูลผู้ป่วยู้ป่วย =====
                           ),
                         ),
                       );


                     }
        }

                )



              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      setState(() {
        this._barcode = barcode.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // The user did not grant the camera permission.
      } else {
        // Unknown error.
      }
    } on FormatException {
      // User returned using the "back"-button before scanning anything.
    } catch (e) {
      // Unknown error.
    }
  }*/
}
