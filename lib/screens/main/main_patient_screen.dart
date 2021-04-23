import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/extensions.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/PatientAdmit.dart';
import 'package:emar_demo/screens/patient/part_screen/card_allergies.dart';
import 'package:emar_demo/screens/patient/part_screen/card_bmi.dart';
import 'package:emar_demo/screens/patient/part_screen/card_lab.dart';
import 'package:emar_demo/screens/patient/part_screen/card_vitalsigns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../patient/part_card/list_of_patients.dart';
import '../patient/part_menusidebar/side_menu_patient.dart';
import '../patient/part_screen/patient_screen.dart';
import '../responsive.dart';

class MainPatientScreen extends StatefulWidget {
  MainPatientScreen({
    Key key,
    this.currentUser,
    this.currentWard,

    //this.onClick,
  }) : super(key: key);
  final String currentUser;
  final String currentWard;

  @override
  _MainPatientScreenState createState() => _MainPatientScreenState();
}

class _MainPatientScreenState extends State<MainPatientScreen> {
  String _currentUser = "";
  String _currentWard = "";
  String _barcode = "";
  bool clicked = false;
  PatientAdmit pt = PatientAdmit();
  DocumentSnapshot patientadmit;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isActive;
  int _selectedIndex = 0;
  bool checkResponsive(int index) {
    return isActive =
        Responsive.isMobile(context) ? false : index == _selectedIndex;
  }

  String _selectedPatientId = "";
  String _selectedPatientName = "";
  String _selectedPatientImage = "";
  String _selectedPatientAge = "";
  String _selectedGender = "";
  String _selectedWardName = "";
  String _selectedWardId = "";
  String _selectedBedNo = "";
  String _selectedDBO = "";
  keepData(PatientAdmit xpt) {
    _selectedPatientId = xpt.patientid;
    _selectedPatientName = xpt.patientname;
    _selectedPatientImage = xpt.patientimage;
    _selectedGender = xpt.gender;
    _selectedWardId = xpt.wardid;
    _selectedWardName = xpt.wardname;
    _selectedPatientAge = xpt.age;
    _selectedBedNo = xpt.bedno;
    _selectedDBO = xpt.dateofbirth;

    //onChange
  }

  // event ตอนเกิดเลือกคนไข้
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget detailsScreen(bool clicked, String _selectedPatientName) {
    bool clk = false;
    String selected = "";
    setState(() {
      clk = clicked;
      selected = _selectedPatientName;
    });
    if (clicked != true) {
      return Center(
        child: Text(
          'กรุณาเลือกผู้ป่วย',
          style: subtitleTextStyle,
        ),
      );
    } else {
      return PatientScreen(
        selectedPatientName: selected,
      );
    }
    /*    clicked != true
  ? Center(
  child: Text(
  'กรุณาเลือกผู้ป่วย',
  style: subtitleTextStyle,
  ),
  )
      : PatientScreen(
  selectedPatientName: _selectedPatientName,
  ),*/
  }

  @override
  void initState() {
    _currentUser = widget.currentUser;
    _currentWard = widget.currentWard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: ListOfPatients(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfPatients(),
            ),
            Expanded(
              flex: 9,
              child: PatientScreen(
                selectedPatientName: _selectedPatientName,
              ),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              //child: SideMenu(),
              child: SideMenuPatient(
                  currentUser: _currentUser, currentWard: _currentWard),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              // child: ListOfPatients(),
              child: SafeArea(
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
                                if (!Responsive.isDesktop(context))
                                  SizedBox(width: 5),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
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
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('patientadmit')
                                  .where('wardid', isEqualTo: '001')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Expanded(
                                    child: ListView.builder(
                                        itemCount: snapshot.data.docs.length,
                                        // On mobile this active dosen't mean anything
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding / 2,
                                                vertical: kDefaultPadding / 2),
                                            child: InkWell(
                                              //onTap: widget.press,
                                              onTap: () {
                                                if (snapshot.data.docs.length >
                                                    0) {
                                                  _onSelected(index);
                                                  clicked = true;

                                                  patientadmit = snapshot.data
                                                      .docs[_selectedIndex];

                                                  pt.patientname = patientadmit
                                                      .get('patientname');
                                                  print(pt.patientname);
                                                  pt.patientid = patientadmit
                                                      .get('patientid');
                                                  pt.patientimage = patientadmit
                                                      .get('patientimage');
                                                  pt.gender = patientadmit
                                                      .get('gender');
                                                  pt.age =
                                                      patientadmit.get('age');
                                                  pt.wardid = patientadmit
                                                      .get('wardid');
                                                  pt.wardname = patientadmit
                                                      .get('wardname');
                                                  pt.bedno =
                                                      patientadmit.get('bedno');
                                                  pt.dateofbirth = patientadmit
                                                      .get('dateofbirth');

                                                  keepData(pt);
                                                }
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                        kDefaultPadding),
                                                    decoration: BoxDecoration(
                                                      // color: widget.isActive ? kPrimaryColor : kBgDarkColor,
                                                      /* color: widget.isActive
                                                          ? kPrimaryColor
                                                          : Colors.white70,*/
                                                      color: checkResponsive(
                                                                index,
                                                              ) &&
                                                              clicked == true
                                                          ? kPrimaryColor
                                                          : Colors.white54,

                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          // maxRadius: 26,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          // backgroundImage: AssetImage(widget.patient.patientimage),
                                                          backgroundImage: snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          'patientimage') ==
                                                                  ""
                                                              ? AssetImage(
                                                                  "assets/images/default-user-image.png")
                                                              : NetworkImage(
                                                                  snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          'patientimage'),
                                                                ),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                kDefaultPadding /
                                                                    2),
                                                        Expanded(
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      // "${widget.medpatient.patientname} ",
                                                                      //"${widget.patient.patientname} ",
                                                                      "${snapshot.data.docs[index].get('patientname')} ",

                                                                      style:
                                                                          TextStyle(
                                                                        color: checkResponsive(
                                                                                  index,
                                                                                ) &&
                                                                                clicked == true
                                                                            ? Colors.white
                                                                            : kTextColor,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontFamily:
                                                                            'Prompt',
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        kDefaultPadding /
                                                                            4),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      // "HN : ${widget.patient.patientid}",
                                                                      "HN : ${snapshot.data.docs[index].get('patientid')}",

                                                                      style:
                                                                          TextStyle(
                                                                        color: checkResponsive(
                                                                                  index,
                                                                                ) &&
                                                                                clicked == true
                                                                            ? Colors.white
                                                                            : Colors.grey,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontFamily:
                                                                            'Prompt',
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        kDefaultPadding /
                                                                            4),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      // "เตียง : ${widget.patient.bedno}",
                                                                      "เตียง : ${snapshot.data.docs[index].get('bedno')}",

                                                                      style:
                                                                          TextStyle(
                                                                        color: checkResponsive(
                                                                                  index,
                                                                                ) &&
                                                                                clicked == true
                                                                            ? Colors.white
                                                                            : Colors.grey,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontFamily:
                                                                            'Prompt',
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ).addNeumorphism(
                                                    blurRadius: 15,
                                                    borderRadius: 15,
                                                    offset: Offset(5, 5),
                                                    topShadowColor:
                                                        Colors.white60,
                                                    bottomShadowColor:
                                                        Color(0xFF234395)
                                                            .withOpacity(0.15),
                                                  ),
                                                  //if (!widget.medpatient.isChecked)
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                        /*PatientCard(
                                        isActive: Responsive.isMobile(context)
                                            ? false
                                            : index == 0,
                                        //patient: patients[index],
                                        patientAdmit: snapshot.data.docs[index],

                                        //==== กดแล้วไปหน้าผแสดงข้อมูลผู้ป่วยู้ป่วย =====
                                        press: () {
                                          if (Responsive.isMobile(context)) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PatientScreen(
                                                        patient:
                                                            patients[index]),
                                              ),
                                            );
                                          }
                                        },
                                        //==== จบกดแล้วไปหน้าผแสดงข้อมูลผู้ป่วยู้ป่วย =====
                                      ),*/
                                        //=========================
                                        ),
                                  );
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: _size.width > 1340 ? 8 : 10,
                // child: detailsScreen(clicked, _selectedPatientName),
                child: clicked != true
                    ? Center(
                        child: Text(
                          'กรุณาเลือกผู้ป่วย',
                          style: subtitleTextStyle,
                        ),
                      )
                    /* : PatientScreen(
                      //selectedPatientName: _selectedPatientName,
                      patientadmit: patientadmit,
                      index: _selectedIndex,
                    ),*/

                    : SafeArea(
                        child: Scaffold(
                          body: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                top: kIsWeb ? kDefaultPadding : 0),
                            //  child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                /* CardPatientHearder(
                          selectedPatientName: _selectedPatientName,
                          patientadmit: _patientadmit,
                          index: index,
                        ),*/
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  elevation: 0,
                                  margin: EdgeInsets.all(2.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        backgroundColor: Colors.white,
                                        // title: _buildTitle(),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child: Stack(
                                                    alignment: Alignment(0, 0),
                                                    children: <Widget>[
                                                      Container(
                                                        child: CircleAvatar(
                                                            maxRadius: 51,
                                                            backgroundColor:
                                                                Colors.blue),
                                                      ),
                                                      Container(
                                                        child: CircleAvatar(
                                                          maxRadius: 48,
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                      Container(
                                                        child: CircleAvatar(
                                                          maxRadius: 45,
                                                          /* backgroundImage:
                                                  AssetImage(patients[0].patientimage),*/
                                                          backgroundImage:
                                                              _selectedPatientImage ==
                                                                      ""
                                                                  ? AssetImage(
                                                                      "assets/images/default-user-image.png")
                                                                  : NetworkImage(
                                                                      _selectedPatientImage),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Spacer(),

                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  kDefaultPadding),
                                                          Text(
                                                            // "ชื่อ : " + patients[0].patientname,
                                                            "ชื่อ : " +
                                                                _selectedPatientName,
                                                            style:
                                                                headerTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              kDefaultPadding /
                                                                  2),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  kDefaultPadding),
                                                          Text(
                                                            /* "เพศ : " +
                                                                patients[0]
                                                                    .gender,*/
                                                            "เพศ : " +
                                                                _selectedGender,
                                                            style:
                                                                subtitleTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              kDefaultPadding /
                                                                  2),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  kDefaultPadding),
                                                          Text(
                                                            /* "HN : " +
                                                                patients[0]
                                                                    .patientid,*/
                                                            "HN : " +
                                                                _selectedPatientId,
                                                            style:
                                                                subtitleTextStyle,
                                                          ),
                                                          // SizedBox(width: kDefaultPadding*2),
                                                          Spacer(),
                                                          Text(
                                                            /* "เตียง : " +
                                                                patients[0]
                                                                    .bedno,*/

                                                            "เตียง : " +
                                                                _selectedBedNo,
                                                            style:
                                                                subtitleTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              kDefaultPadding /
                                                                  2),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  kDefaultPadding),
                                                          Text(
                                                            /*  "อายุ : " +
                                                                patients[0]
                                                                    .age +
                                                                "  ปี",*/

                                                            "อายุ : " +
                                                                _selectedPatientAge +
                                                                "  ปี",
                                                            style:
                                                                subtitleTextStyle,
                                                          ),
                                                          // SizedBox(width: kDefaultPadding*2),
                                                          Spacer(),
                                                          Text(
                                                            /* "วันเดือนปีเกิด : " +
                                                                patients[0]
                                                                    .dateofbirth,*/
                                                            "วันเดือนปีเกิด : " +
                                                                _selectedDBO,
                                                            style:
                                                                subtitleTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              kDefaultPadding /
                                                                  2),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            /*"วอร์ด : " +
                                                                patients[0]
                                                                    .wardname,*/

                                                            "วอร์ด : " +
                                                                _selectedWardName,
                                                            style:
                                                                subtitleTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // Spacer(),
                                                // Text("Mehr"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        trailing: SizedBox(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding:
                                        EdgeInsets.all(kDefaultPadding / 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // CardPatientHearder(),
                                        CardAllergies(),
                                        // SizeBox(height:20.0),
                                        CardBMI(),
                                        CardVitalSign(),
                                        CardLab(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
