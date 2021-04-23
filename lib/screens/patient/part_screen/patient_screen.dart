import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/models/Patient.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'card_allergies.dart';
import 'card_bmi.dart';
import 'card_lab.dart';
import 'card_patient.dart';
import 'card_vitalsigns.dart';

class PatientScreen extends StatefulWidget {
  PatientScreen(
      {Key key,
      this.patient,
      this.selectedPatientName,
      this.patientadmit,
      this.index})
      : super(key: key);

  final Patient patient;
  // String selectedPatientId = "";
  String selectedPatientName;
  /*String _selectedPatientImage = "";
  String _selectedPatientAge = "";
  String _selectedGender = "";
  String _selectedWardName = "";
  String _selectedWardId = "";
  String _selectedBedNo = "";
  String _selectedDBO = "";
  */
  DocumentSnapshot patientadmit;
  int index;

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  int index;
  DocumentSnapshot _patientadmit;
  String _selectedPatientId = "";
  String _selectedPatientName = "";
  String _selectedPatientImage = "";
  String _selectedPatientAge = "";
  String _selectedGender = "";
  String _selectedWardName = "";
  String _selectedWardId = "";
  String _selectedBedNo = "";
  String _selectedDBO = "";
  @override
  void initState() {
    _patientadmit = widget.patientadmit;
    _selectedPatientName = widget.selectedPatientName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          //  child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CardPatientHearder(
                selectedPatientName: _selectedPatientName,
                patientadmit: _patientadmit,
                index: index,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
