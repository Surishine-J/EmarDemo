import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/Patient.dart';
import 'package:flutter/material.dart';

class CardPatientHearder extends StatefulWidget {
  CardPatientHearder(
      {Key key,
      this.patient,
      this.patientadmit,
      this.selectedPatientName,
      this.index})
      : super(key: key);

  final Patient patient;
  int index;
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
  @override
  _CardPatientHearderState createState() => _CardPatientHearderState();
}

class _CardPatientHearderState extends State<CardPatientHearder> {
  DocumentSnapshot _patientadmit;
  int index;
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
    index = index;
    /* _selectedPatientName = widget.selectedPatientName;
    print('---- CardPatientHearder ------ ');
    print(_selectedPatientName);*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 0,
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            // title: _buildTitle(),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        alignment: Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                                maxRadius: 51, backgroundColor: Colors.blue),
                          ),
                          Container(
                            child: CircleAvatar(
                              maxRadius: 48,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Container(
                            child: CircleAvatar(
                              maxRadius: 45,
                              backgroundImage:
                                  AssetImage(patients[0].patientimage),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Spacer(),

                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                // "ชื่อ : " + patients[0].patientname,
                                "ชื่อ : " + _patientadmit.get('patientname'),
                                style: headerTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                "เพศ : " + patients[0].gender,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                "HN : " + patients[0].patientid,
                                style: subtitleTextStyle,
                              ),
                              // SizedBox(width: kDefaultPadding*2),
                              Spacer(),
                              Text(
                                "เตียง : " + patients[0].bedno,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                "อายุ : " + patients[0].age + "  ปี",
                                style: subtitleTextStyle,
                              ),
                              // SizedBox(width: kDefaultPadding*2),
                              Spacer(),
                              Text(
                                "วันเดือนปีเกิด : " + patients[0].dateofbirth,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              Text(
                                "วอร์ด : " + patients[0].wardname,
                                style: subtitleTextStyle,
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
    );
  }
}
