import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/extensions.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/MealMedicine.dart';
import 'package:emar_demo/models/MedPatient.dart';
import 'package:emar_demo/models/PatientInfo.dart';
import 'package:emar_demo/models/Reason.dart';
import 'package:emar_demo/screens/adminmedicine/part_sidebar/side_menu_adminmed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../adminmedicine/part_card/list_of_patients_waitdispense.dart';
import '../adminmedicine/part_screen/medicine_waitdispense_screen.dart';
import '../responsive.dart';

class MainAdminMedScreen extends StatefulWidget {
  MainAdminMedScreen({
    Key key,
    this.currentUser,
    this.currentWard,
    this.medpatient,
    //this.onClick,
  }) : super(key: key);

  final String currentUser;
  final String currentWard;
  final MedPatient medpatient;
  // final MedPatient medpatient2;
  // VoidCallback onClick = () {};

  @override
  _MainAdminMedScreenState createState() => _MainAdminMedScreenState();
}

class _MainAdminMedScreenState extends State<MainAdminMedScreen> {
  String _currentUser = "";
  String _currentWard = "";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedMeal = "0";
  String _currentSelectedMeal;

  CollectionReference mpt;
  final dbMeal =
      FirebaseFirestore.instance.collection('meal').orderBy('mealid');
  // final dbMedPatient = FirebaseFirestore.instance.collection('medpatient');
  Stream<QuerySnapshot> dbMedPatient;
  //final dbMedPatient2 = FirebaseFirestore.instance.collection('medpatient');

  //TextEditingController _searchController = TextEditingController();

  PatientInfo pt = PatientInfo();
  MealMedicine md = MealMedicine();

  DocumentSnapshot medpatient2;
  bool isActive;
  String ptId = "";

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

  int _selectedIndex = 0;

  StreamController<Stream<QuerySnapshot>> _streamController =
      StreamController<Stream<QuerySnapshot>>();
  Stream<Stream<QuerySnapshot>> get _stream => _streamController.stream;

  _filter(String searchQuery) {
    Stream<QuerySnapshot> _filteredList = FirebaseFirestore.instance
        .collection('medpatient')
        .where('patientid', isEqualTo: searchQuery.toLowerCase())
        .snapshots();
    _streamController.sink.add(_filteredList);
  }

  Stream<QuerySnapshot> _onVariableChanged(
      String _selectedMeal, String _currentWard, String hn) {
    if (_selectedMeal == '0' && hn == null) {
      return dbMedPatient = FirebaseFirestore.instance
          .collection('medpatient')
          .where('wardid', isEqualTo: _currentWard)
          .snapshots();
    } else if (_selectedMeal == '0' && hn != null && hn != "") {
      return dbMedPatient = FirebaseFirestore.instance
          .collection('medpatient')
          .where('wardid', isEqualTo: _currentWard)
          .where('patientid', isEqualTo: hn)
          .snapshots();
    } else if (_selectedMeal != '0' && hn == null) {
      return dbMedPatient = FirebaseFirestore.instance
          .collection('medpatient')
          .where('wardid', isEqualTo: _currentWard)
          .where('mealid', isEqualTo: _selectedMeal)
          .snapshots();
    } else if (_selectedMeal != '0' && hn != null && hn != "") {
      return dbMedPatient = FirebaseFirestore.instance
          .collection('medpatient')
          .where('wardid', isEqualTo: _currentWard)
          .where('mealid', isEqualTo: _selectedMeal)
          .where('patientid', isEqualTo: hn)
          .snapshots();
    }
    print(hn);

    //return dbMedPatient =
  }

  keepData(PatientInfo xpt) {
    _selectedPatientId = xpt.patientid;
    _selectedPatientName = xpt.patientname;
    _selectedPatientImage = xpt.patientimage;
    _selectedGender = xpt.gender;
    _selectedWardId = xpt.wardid;
    _selectedWardName = xpt.wardname;
    _selectedPatientAge = xpt.age;
    _selectedBedNo = xpt.bedno;
    _selectedDBO = xpt.dateofbirth;
  }

  _onSelected(int index) {
    // setState(() => _selectedIndex = index);
    setState(() {
      // getData();
      _selectedIndex = index;
    });
  }

  _onSelectedPatient(String selectedPatientId, selectedPatientName,
      String currentSelectedMeal) {
    setState(() {
      _selectedPatientId = selectedPatientId;
      _selectedPatientName = selectedPatientName;
      _currentSelectedMeal = currentSelectedMeal;
    });

    // _onPatientIndex();
  }

  List _allResults = [];
  List _resultsList = [];

  /*_onSearchChanged() {
    searchResultsList();
  }*/

/*  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var tripSnapshot in _allResults) {
        var title =
            MealMedicine.fromSnapshot(tripSnapshot).title.toLowerCase();

        if (title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }*/

  @override
  void initState() {
    setState(() {
      super.initState();
      //  getData();
      _currentUser = widget.currentUser;
      _currentWard = widget.currentWard;
      //_searchController.addListener(_onSearchChanged);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return // SafeArea(
        // child:
        Scaffold(
      body: Responsive(
        mobile: ListOfPatientsWaitDispense(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfPatientsWaitDispense(),
            ),
            Expanded(
              flex: 9,
              child: MedicineWaitDispenseScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
                flex: _size.width > 1340 ? 2 : 4,
                child: SideMenuAdminMed(
                    currentUser: _currentUser, currentWard: _currentWard)),
            // child: MyStatefulWidget()),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              // child: ListOfPatientsWaitDispense(),

              child: SafeArea(
                child: Scaffold(
                  key: _scaffoldKey,
                  drawer: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 250),
                    // child: SideMenu(),
                    child: SideMenuAdminMed(),
                  ),
                  body:
                      /* StreamBuilder<QuerySnapshot>(
                    stream: dbMeal
                        .where('mealid', isLessThanOrEqualTo: "7")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      } else {
                        return */
                      Container(
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
                                if (!Responsive.isDesktop(context))
                                  SizedBox(width: 5),
                                Expanded(
                                  /*  child: TextField(
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.search),
                                                hintText: 'Search...'),
                                            onChanged: (val) {
                                              setState(() {
                                                ptId = val;
                                              });
                                            },
                                          ),*/
                                  child: TextField(
                                    onChanged: (value) {
                                      // print(value);
                                      setState(() {
                                        ptId = value;
                                        _onVariableChanged(
                                            _selectedMeal, _currentWard, ptId);

                                        print('------');
                                        print(_selectedMeal);
                                        print(_currentWard);
                                        print(ptId);

                                        print('------');
                                      });
                                    },
                                    // controller: _searchController,
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
                                        /* child: Row(
                                                    children: [
                                                      const IconButton(
                                                          icon: Icon(
                                                              Icons.search),
                                                          onPressed: null)
                                                    ],
                                                  )*/
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
                                /* IconButton(
                                            icon: Icon(Icons.search),
                                            onPressed: null)*/
                              ],
                            ),
                          ),
                          // SizedBox(height: kDefaultPadding),

                          StreamBuilder(
                              stream: dbMeal
                                  .where('mealid', isLessThanOrEqualTo: "7")
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            print('ward');
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
                                  );
                                }
                              }),

                          /* Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  ),*/

                          StreamBuilder(

                              /*        stream: _selectedMeal == '0'
                                          ? FirebaseFirestore
                                              .instance
                                              .collection('medpatient')
                                              .where('wardid',
                                                  isEqualTo: _currentWard)
                                              .snapshots()
                                          :  FirebaseFirestore
                                              .instance
                                              .collection('medpatient')
                                              .where('wardid',
                                                  isEqualTo: _currentWard)
                                              .where(
                                                'mealid',
                                                isEqualTo: _selectedMeal,
                                              )
                                              .snapshots(),*/

                              stream: _onVariableChanged(
                                  _selectedMeal, _currentWard, null),
                              // stream: _stream,
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

                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        //  index == _selectedIndex;
                                        checkResponsive(index);
                                        medpatient2 = snapshot.data.docs[0];
                                        pt.patientname =
                                            medpatient2.get('patientname');
                                        pt.patientid =
                                            medpatient2.get('patientid');
                                        pt.patientimage =
                                            medpatient2.get('patientimage');
                                        pt.gender = medpatient2.get('gender');
                                        pt.age = medpatient2.get('age');
                                        pt.wardid = medpatient2.get('wardid');
                                        pt.wardname =
                                            medpatient2.get('wardname');
                                        pt.bedno = medpatient2.get('bedno');
                                        pt.dateofbirth =
                                            medpatient2.get('dateofbirth');

                                        keepData(pt);

                                        /* print(medpatient2
                                                    .get('patientid'));
                                                print(medpatient2
                                                    .get('patientname'));
                                                print(
                                                    snapshot.data.docs.length);*/
                                        /* keepData(
                                                    snapshot.data.docs[index]
                                                      );*/

                                        /*print(snapshot.data.docs[index]
                                                    .toString());*/

                                        //medpatient2 =snapshot.dta.,
                                        //================================
                                        /* return PatientWaitDispenseCard(
                                                  isActive: Responsive.isMobile(
                                                          context)
                                                      ? false
                                                      // : index == 0,
                                                      : index == _selectedIndex,
                                                  /*   patientName: ptIndex(snapshot
                                                      .data.docs[_selectedIndex]
                                                      .get('patientid')),*/
                                                  medpatient:
                                                      snapshot.data.docs[index],
                                                  press: () {
                                                    _onSelected(index);
                                                    _onSelectedPatient(
                                                        snapshot
                                                            .data
                                                            .docs[
                                                                _selectedIndex]
                                                            .get('patientid'),
                                                        snapshot
                                                            .data
                                                            .docs[
                                                                _selectedIndex]
                                                            .get('patientname'),
                                                        _selectedMeal);
                                                    print(_selectedIndex);
                                                    print(_selectedMeal);
                                                    print(snapshot
                                                        .data.docs.length);

                                                    // print(_selectedPatientId);
                                                    print(_selectedPatientName);
                                                  },
                                                );*/
                                        //========================================

                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kDefaultPadding / 2,
                                              vertical: kDefaultPadding / 2),
                                          child: InkWell(
                                            //  onTap: widget.press,
                                            onTap: () {
                                              // widget.onClick();
                                              _onSelected(index);
                                              _onSelectedPatient(
                                                  snapshot
                                                      .data.docs[_selectedIndex]
                                                      .get('patientid'),
                                                  snapshot
                                                      .data.docs[_selectedIndex]
                                                      .get('patientname'),
                                                  _selectedMeal);
                                            },

                                            // onTapDown: ,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(
                                                      kDefaultPadding),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        checkResponsive(index)
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
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            // AssetImage(widget.medpatient.get('patientimage')),
                                                            NetworkImage(snapshot
                                                                .data
                                                                .docs[index]
                                                                .get(
                                                                    'patientimage')),
                                                        // NetworkImage('https://via.placeholder.com/150'),
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
                                                                    "${snapshot.data.docs[index].get('patientname')} ",
                                                                    style:
                                                                        TextStyle(
                                                                      color: checkResponsive(
                                                                              index)
                                                                          ? Colors
                                                                              .white
                                                                          : kTextColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                    "HN : ${snapshot.data.docs[index].get('patientid')}",
                                                                    style:
                                                                        TextStyle(
                                                                      color: checkResponsive(
                                                                              index)
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                    "เตียง : ${snapshot.data.docs[index].get('bedno')}",
                                                                    style:
                                                                        TextStyle(
                                                                      color: checkResponsive(
                                                                              index)
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                if (!snapshot
                                                    .data.docs[_selectedIndex]
                                                    .get('ischecked'))
                                                  Positioned(
                                                    right: 8,
                                                    top: 8,
                                                    child: Container(
                                                      height: 12,
                                                      width: 12,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: kBadgeColor,
                                                      ),
                                                    ).addNeumorphism(
                                                      blurRadius: 4,
                                                      borderRadius: 8,
                                                      offset: Offset(2, 2),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },

                                      // itemBuilder: (context, index) =>
                                      /* PatientWaitDispenseCard(
                                                isActive: Responsive.isMobile(
                                                        context)
                                                    ? false
                                                    // : index == 0,
                                                    : index == _selectedIndex,
                                                medpatient:
                                                    snapshot.data.docs[index],
                                                press: () {
                                                  _onSelected(index);
                                                  _onSelectedPatient(
                                                      snapshot.data
                                                          .docs[_selectedIndex]
                                                          .get('patientid'),
                                                      snapshot.data
                                                          .docs[_selectedIndex]
                                                          .get('patientname'),
                                                      _selectedMeal);
                                                  print(_selectedIndex);
                                                  print(_selectedMeal);
                                                  print(snapshot
                                                      .data.docs.length);

                                                  // print(_selectedPatientId);
                                                  //print(_selectedPatientName);
                                                },
                                              ),*/
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                  // } //=========
                  //},
                  //),
                ),
              ),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,

              //  child:   StreamBuilder(),

              // child: MedicineWaitDispenseScreen(),
              child: Container(
                padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
                color: Colors.white,
                // color:scaffold,
                child: SafeArea(
                  right: false,
                  child: _selectedMeal == '0'
                      ? Center(
                          child: Text(
                            'กรุณาเลือกมื้อบริหารยา',
                            style: subtitleTextStyle,
                          ),
                        )
                      : Column(
                          children: [
                            /* _selectedPatientId = selectedPatientId;
                  _selectedPatientName = selectedPatientName;
                  _currentSelectedMeal = currentSelectedMeal;*/
                            /* PatientHeader(
                          patientId: _selectedPatientId,
                          patientName: _selectedPatientName),*/
                            // PatientHeader(callback: (val) => setState(() => _string = val))
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              elevation: 0,
                              // margin: EdgeInsets.all(12.0),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
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
                                                    backgroundImage:
                                                        //  AssetImage(
                                                        //  medpatients[0].patientimage,

                                                        NetworkImage(
                                                            _selectedPatientImage),
                                                  )
                                                      //),
                                                      ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Spacer(),

                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              kDefaultPadding),
                                                      Text(
                                                        "ชื่อ : " +
                                                            _selectedPatientName,
                                                        /* medpatients[0]
                                                          .patientname,*/
                                                        style: headerTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          kDefaultPadding / 2),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              kDefaultPadding),
                                                      Text(
                                                        "เพศ : " +
                                                            // medpatients[0].gender,
                                                            _selectedGender,
                                                        style:
                                                            subtitleTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          kDefaultPadding / 2),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              kDefaultPadding),
                                                      Text(
                                                        "HN : " +
                                                            // medpatients[0].patientid,
                                                            _selectedPatientId,
                                                        style:
                                                            subtitleTextStyle,
                                                      ),
                                                      // SizedBox(width: kDefaultPadding*2),
                                                      Spacer(),
                                                      Text(
                                                        "เตียง : " +
                                                            // medpatients[0].bedno,
                                                            _selectedBedNo,
                                                        style:
                                                            subtitleTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          kDefaultPadding / 2),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              kDefaultPadding),
                                                      Text(
                                                        "อายุ : " +
                                                            //  medpatients[0].age +
                                                            _selectedPatientAge +
                                                            "  ปี",
                                                        style:
                                                            subtitleTextStyle,
                                                      ),
                                                      // SizedBox(width: kDefaultPadding*2),
                                                      Spacer(),
                                                      Text(
                                                        "วันเดือนปีเกิด : " +
                                                            // medpatients[0]
                                                            //  .dateofbirth,
                                                            _selectedDBO,
                                                        style:
                                                            subtitleTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          kDefaultPadding / 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "วอร์ด : " +
                                                            // medpatients[0].wardname,
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

                            Divider(thickness: 1),

                            //SizedBox(height: kDefaultPadding),

                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('medmeal')
                                    .where('patientid',
                                        isEqualTo: _selectedPatientId)
                                    .where('mealid', whereIn: [
                                  _selectedMeal,
                                  "8",
                                  "9"
                                ]).snapshots(),
                                /* stream: _selectedMeal == null
                              ? FirebaseFirestore.instance
                                  .collection('medmeal')
                                  .where('wardid', isEqualTo: _currentWard)
                                  .where('mealid', isEqualTo: _selectedMeal)
                                  .where('patientid',
                                      isEqualTo: _selectedPatientId)
                              : FirebaseFirestore.instance
                                  .collection('medmeal')
                                  .where('wardid', isEqualTo: _currentWard)
                                  .where('mealid', isEqualTo: _selectedMeal)
                                  .where('patientid',
                                      isEqualTo: _selectedPatientId)
                                  .snapshots(),*/
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    return Expanded(
                                      child: ListView.builder(
                                          // itemCount: medpatients.length,
                                          itemCount: snapshot.data.docs.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              //semanticContainer: true,
                                              shape: Border(
                                                left: BorderSide(
                                                  // color: getColor(widget.medpatient),
                                                  width: 10,
                                                ),
                                              ),

                                              child: Stack(
                                                children: [
                                                  Container(
                                                    // color: getColor(widget.medpatient),
                                                    // color: Colors.red,
                                                    padding: EdgeInsets.all(
                                                        kDefaultPadding / 2),
                                                    //  padding: EdgeInsets.only(left: 10.0),
                                                    child: Row(
                                                      children: [
                                                        // SizeBox(width:10.0),

                                                        Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          // color: Colors.red,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            color: Colors.white,
                                                            // color: Colors.red,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0),
                                                            child: Center(
                                                                child: Image.network(
                                                                    snapshot
                                                                        .data
                                                                        .docs[
                                                                            index]
                                                                        .get(
                                                                            'drugimage'))
                                                                /*Image.asset(
                                                          //patients[0].image,
                                                          widget.medpatient
                                                              .drugimage,
                                                          width: 100.0,
                                                          height: 100.0,
                                                        ),*/
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          // flex: 4,
                                                          child: Container(
                                                            // color: getColor(widget.medpatient),
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Spacer(),
                                                                    /*  if (checkMealAdmin(
                                                                  widget
                                                                      .medpatient
                                                                  // snapshot.data.docs[index]
                                                                  ))
                                                                Text(
                                                                  widget
                                                                      .medpatient
                                                                      .mealtime,
                                                                  style:
                                                                      subtitleTextStyle,
                                                                )
                                                              else
                                                                Text(
                                                                  widget.medpatient
                                                                          .mealtime +
                                                                      "  น.",
                                                                  style:
                                                                      subtitleTextStyle,
                                                                )*/
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            kDefaultPadding),
                                                                    // Spacer(flex: 1,),

                                                                    Text(
                                                                      // "${widget.medpatient.drugname} ",
                                                                      "${snapshot.data.docs[0].get('drugname')} ",
                                                                      style:
                                                                          headerTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            kDefaultPadding),
                                                                    Text(
                                                                      // widget.medpatient.drugusage,
                                                                      snapshot
                                                                          .data
                                                                          .docs[
                                                                              0]
                                                                          .get(
                                                                              'drugusage'),
                                                                      style:
                                                                          subtitleTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            kDefaultPadding),
                                                                    Text(
                                                                      // widget.medpatient.mealadmin,
                                                                      snapshot
                                                                          .data
                                                                          .docs[
                                                                              0]
                                                                          .get(
                                                                              'mealadmin'),
                                                                      style:
                                                                          subtitleTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            kDefaultPadding),
                                                                    Text(
                                                                      "OFF ยา",
                                                                      style:
                                                                          subtitleTextStyle,
                                                                    ),
                                                                    Switch(
                                                                      value:
                                                                          isSwitchedOffMed,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                          () {
                                                                            isSwitchedOffMed =
                                                                                value;
                                                                            print(isSwitchedOffMed);
                                                                            if (isSwitchedOffMed ==
                                                                                true) {
                                                                              // openAlertBoxReason(context);
                                                                              openAlertBoxReasonOff(context);
                                                                            } else {
                                                                              print('ยกเลิก');
                                                                            }
                                                                          },
                                                                        );
                                                                      },
                                                                      activeTrackColor:
                                                                          Colors
                                                                              .blue[100],
                                                                      activeColor:
                                                                          Colors
                                                                              .blue,
                                                                    ),
                                                                    SizedBox(
                                                                        width: kDefaultPadding /
                                                                            2),
                                                                    Text(
                                                                      "Hold ยา",
                                                                      style:
                                                                          subtitleTextStyle,
                                                                    ),
                                                                    Switch(
                                                                      value:
                                                                          isSwitchedHoldMed,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          isSwitchedHoldMed =
                                                                              value;
                                                                          if (isSwitchedHoldMed ==
                                                                              true) {
                                                                            openAlertBoxReasonHold(context);
                                                                          } else {
                                                                            // isSwitchedHoldMed = false;
                                                                            print('ยกเลิก hold ยา');
                                                                          }
                                                                        });
                                                                      },
                                                                      activeTrackColor:
                                                                          Colors
                                                                              .blue[100],
                                                                      activeColor:
                                                                          Colors
                                                                              .blue,
                                                                    ),
                                                                    Spacer(),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (widget.medpatient.drugtype ==
                                                                            "2") {
                                                                          // openAlertBoxHADScan();
                                                                          alertsScan();
                                                                        }
                                                                        print(
                                                                            'กดจ่ายยา');
                                                                      },
                                                                      child: Text(
                                                                          'จ่ายยา',
                                                                          style:
                                                                              headerTextStyle2),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    );
                                  }
                                })
                            /* Expanded(
                        child: ListView.builder(
                            itemCount: medpatients.length,
                            itemBuilder: ( context, index) =>
                               MedicineCard(
                            isActive: Responsive.isMobile(context)
                                ? false
                                : index == 0,
                            medpatient: medpatients[index],
                          ),
                            }),
                      ),*/
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //);
  }

  //**********เชคว่ามียา STAT PRN ไหม ********//
  bool checkMealAdmin(MedPatient medpt) {
    if (medpt.mealid == "8" || medpt.mealid == "9") {
      return true;
    } else {
      return false;
    }
  }

//****************************************//

//**********เชค เงื่อนไข เพื่อแสดงแถบสี ********//
  //  8 คือ ยา STAT
  // 9 คือ ยา PRN
  // 2 คือยา  HAD
  Color getColor(MedPatient medpt) {
    if (medpt.mealid == '8' && medpt.drugtype == '2') {
      return Colors.pink[400];
    } else if (medpt.mealid == '8' && medpt.drugtype != '2') {
      return Colors.green[400];
    } else if (medpt.mealid == '9' && medpt.drugtype == '2') {
      return Colors.pink[400];
    } else if (medpt.mealid == '9' && medpt.drugtype != '2') {
      return Colors.yellow;
    } else {
      if (medpt.drugtype == '2') {
        return Colors.pink[400];
      }
      return Colors.blue;
    }
  }

//****************************************//
  bool isSwitchedOffMed = false;
  bool isSwitchedHoldMed = false;

  String _selectedReasonOff;
  String _selectedReasonHold;

  void openAlertBoxReasonHold(BuildContext context) {
    Dialog holdDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 180.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Color(0xff00bfa5),
                // gradient: g10,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "เลือกเหตุผลการ Hold ยา",
                  style: headerTextStylePatientPage,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter dropDownState) {
                    return DropdownButton<String>(
                      value: _selectedReasonHold,
                      underline: Container(color: Colors.transparent),
                      hint: Text(
                        "กรุณาเลือกเหตุผล",
                        style: subtitleCardTextStyle,
                      ),

                      // value: _selectedReason,

                      isExpanded: true,
                      onChanged: (String val) {
                        dropDownState(() {
                          _selectedReasonHold = val;
                        });
                        print(val);
                      },
                      // value: _selectedReasonHold,
                      items: reasons.map((Reasons reason) {
                        return new DropdownMenuItem<String>(
                          value: reason.reasonid,
                          child: new Text(
                            reason.reasonname,
                            style: subtitleCardTextStyle,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff00bfa5),
                    // gradient: g10,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "บันทึก",
                      style: headerTextStylePatientPage,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (isSwitchedHoldMed == true) {
                      isSwitchedHoldMed = false;
                    }
                  });

                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => holdDialog);
  }

  void openAlertBoxReasonOff(BuildContext context) {
    Dialog offDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 180.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Color(0xFFFA709A),
                // gradient: g11,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "เลือกเหตุผลการ OFF ยา",
                  style: headerTextStylePatientPage,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter dropDownState) {
                    return DropdownButton<String>(
                      //value: _selectedReason,
                      underline: Container(color: Colors.transparent),
                      hint: Text(
                        "กรุณาเลือกเหตุผล",
                        style: subtitleCardTextStyle,
                      ),

                      // value: _selectedReason,

                      isExpanded: true,
                      onChanged: (String val) {
                        dropDownState(() {
                          _selectedReasonOff = val;
                        });
                        print(val);
                      },
                      value: _selectedReasonOff,
                      items: reasons.map((Reasons reason) {
                        return new DropdownMenuItem<String>(
                          value: reason.reasonid,
                          child: new Text(
                            reason.reasonname,
                            style: subtitleCardTextStyle,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFA709A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "บันทึก",
                      style: headerTextStylePatientPage,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (isSwitchedOffMed == true) {
                      isSwitchedOffMed = false;
                    }
                  });

                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => offDialog);
  }

  alertsScan() {
    Alert(
      context: context,
      // type: AlertType.info,
      image: Image.asset(
        "assets/images/scanqr.PNG",
        //  width: 46,
        width: 120,
      ),
      title: "ยานี้เป็นยาความเสี่ยงสูง กรุณา Scan QR code หัวหน้าพยาบาล",
      style: AlertStyle(
        titleStyle: subtitleCardTextStyle,
      ),

      // desc: "ยืนยันรับยา",
      buttons: [
        DialogButton(
          child: Text(
            "Scan ",
            style: subtitleCardTextStyleAlert,
            // style: headerTextStyleRecivedPage,
          ),
          onPressed: () {
            // scan();
          },
          // onPressed: () => Navigator.pop(context),
          gradient: g10,
        ),
        DialogButton(
            child: Text(
              "ยกเลิก",
              style: subtitleCardTextStyleAlert,
            ),
            onPressed: () => Navigator.pop(context),
            gradient: g7)
      ],
    ).show();
  }
}
