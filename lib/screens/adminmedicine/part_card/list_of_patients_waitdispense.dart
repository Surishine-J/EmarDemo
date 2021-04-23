import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/screens/adminmedicine/part_card/patient_waitdispense_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../responsive.dart';
import '../part_sidebar/side_menu_adminmed.dart';

class ListOfPatientsWaitDispense extends StatefulWidget {
  // Press "Command + ."
  /* const ListOfPatientsWaitDispense({
    this.medpatint,
    Key key,
  }) : super(key: key);*/
  //final MedPatientModel medpatint;

  @override
  _ListOfPatientsWaitDispenseState createState() =>
      _ListOfPatientsWaitDispenseState();
}

class _ListOfPatientsWaitDispenseState
    extends State<ListOfPatientsWaitDispense> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedMeal;
  String _currentSelectedMeal;
  //MedPatientModel medpatint;
  final dbMeal =
      FirebaseFirestore.instance.collection('meal').orderBy('mealid');
  final dbMedPatient = FirebaseFirestore.instance.collection('medpatient');
  String _selectedPatientId = "";
  String _selectedPatientName = "";
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  _onSelectedPatient(String selectedPatientId, String selectedPatientName,
      String currentSelectedMeal) {
    /*setState(() => _selectedPatientId = selectedPatientId,
        _currentSelectedMeal = currentSelectedMeal);
    // print(_selectedpatientid);*/

    setState(() {
      _selectedPatientId = selectedPatientId;
      _selectedPatientName = selectedPatientName;
      _currentSelectedMeal = currentSelectedMeal;
    });
  }

  /* int tappedIndex;
  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            // child: SideMenu(),
            child: SideMenuAdminMed(),
          ),
          body: StreamBuilder<QuerySnapshot>(
            /* stream: FirebaseFirestore.instance
                .collection('meal')
                .orderBy('mealid')
                .snapshots(),*/
            stream: dbMeal.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
                  color: kBgDarkColor,
                  child: SafeArea(
                    right: false,
                    child: Row(
                      children: [
                        Column(
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
                                  if (!Responsive.isDesktop(context))
                                    SizedBox(width: 5),
                                  Expanded(
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
                                            width: 20,
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
                                ],
                              ),
                            ),
                            // SizedBox(height: kDefaultPadding),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DropdownButton<String>(
                                    value: _selectedMeal,
                                    underline: Container(
                                      color: Colors.red,
                                    ),
                                    isExpanded: false,
                                    onChanged: (String val) {
                                      setState(() {
                                        _selectedMeal = val;
                                      });
                                      // print(val);
                                    },
                                    items: snapshot.data.docs
                                        .map((DocumentSnapshot document) {
                                      return new DropdownMenuItem<String>(
                                        value: document.get("mealid"),
                                        child: new Text(
                                          document.get("mealname"),
                                          style: subtitleCardTextStyle,
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      'กรุณาเลือกมื้อบริหารยา',
                                      style: subtitleCardTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            StreamBuilder(
                                stream: dbMedPatient.snapshots(),
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
                                        itemBuilder: (context, index) =>
                                            PatientWaitDispenseCard(
                                          isActive: Responsive.isMobile(context)
                                              ? false
                                              /* : index == 0,*/
                                              : index == _selectedIndex,

                                          medpatient: snapshot.data.docs[index],

                                          press: () {
                                            _onSelected(index);
                                            _onSelectedPatient(
                                                snapshot
                                                    .data.docs[_selectedIndex]
                                                    .get('patientid'),
                                                snapshot
                                                    .data.docs[_selectedIndex]
                                                    .get('patientname'),
                                                _selectedMeal);
                                            print(_selectedIndex);
                                            print(_selectedMeal);

                                            print(_selectedPatientId);

                                            /*if (_selectedMeal != null) {
                                              return Container(
                                                color: Colors.red,
                                              );
                                            }*/

                                            /*  Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MedicineWaitDispenseScreen()));*/

                                            /* if (Responsive.isMobile(context)) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MedicineWaitDispenseScreen(
                                                          medpatient:
                                                              medpatients[index]),
                                                ),
                                              );
                                            }*/

                                            /*  setState(() {
                                              tappedIndex = index;
                                              //isActive = true;
                                            });*/

                                            //print(index);
                                          },
                                          //==== จบกดแล้วไปหน้าผู้ป่วย =====
                                        ),
                                      ),
                                    );
                                  }
                                }),

                            /* Expanded(


                              child: ListView.builder(
                                itemCount: medpatients.length,
                                itemBuilder: (context, index) =>
                                    PatientWaitDispenseCard(
                                  isActive: Responsive.isMobile(context)
                                      ? false
                                      : index == 0,

                                  medpatient: medpatients[index],

                                  //==== กดแล้วไปหน้ายารอจ่ายของผู้ป่วย =====
                                  press: () {
                                    if (Responsive.isMobile(context)) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MedicineWaitDispenseScreen(
                                                  medpatient: medpatients[index]),
                                        ),
                                      );
                                    }

                                    print('กดชื่อผู้ป่วย');
                                    print(
                                      medpatients.length,
                                    );
                                  },
                                  //==== จบกดแล้วไปหน้าผู้ป่วย =====
                                ),
                              ),
                            ),*/

                            ///
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          )
          /* body: Container(
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
                                width: 20,
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
                      DropdownButton<String>(
                        value: _selectedMeal,
                        underline: Container(
                          color: Colors.red,
                        ),
                        isExpanded: false,
                        onChanged: (String val) {
                          setState(() {
                            _selectedMeal = val;
                          });
                          print(val);
                        },
                        items: meals.map((Meal meal) {
                          return new DropdownMenuItem<String>(
                            value: meal.mealid,
                            child: new Text(
                              meal.mealname,
                              style: subtitleCardTextStyle,
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          'กรุณาเลือกมื้อบริหารยา',
                          style: subtitleCardTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: medpatients.length,
                    itemBuilder: (context, index) => PatientWaitDispenseCard(
                      isActive:
                          Responsive.isMobile(context) ? false : index == 0,

                      medpatient: medpatients[index],

                      //==== กดแล้วไปหน้ายารอจ่ายของผู้ป่วย =====
                      press: () {
                        if (Responsive.isMobile(context)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicineWaitDispenseScreen(
                                  medpatient: medpatients[index]),
                            ),
                          );
                        }

                        print('กดชื่อผู้ป่วย');
                        print(
                          medpatients.length,
                        );
                      },
                      //==== จบกดแล้วไปหน้าผู้ป่วย =====
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),*/
          ),
    );
  }
}
