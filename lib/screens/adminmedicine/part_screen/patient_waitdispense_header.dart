import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/MedPatient.dart';
import 'package:flutter/material.dart';

typedef void StringCallback(int id);

class PatientHeader extends StatefulWidget {
  PatientHeader({
    Key key,
    this.medpatint,
    this.patientId,
    this.patientName,
    this.onPatientChanged,
  }) : super(key: key);
  final MedPatient medpatint;
  final String patientId;
  String patientName;
  final StringCallback onPatientChanged;
  @override
  _PatientHeaderState createState() => _PatientHeaderState();
}

class _PatientHeaderState extends State<PatientHeader> {
  //String _patientId = "";
  String _patientName = "";

  @override
  void initState() {
    setState(() {
      //_patientId = widget.PatientId;
      _patientName = widget.patientName;

      // print(_patientId);
      print(_patientName);
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    String xpatientId = widget.patientId;
    String xpatientName = widget.patientName;
    //=====================
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 0,
      // margin: EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
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
                                  AssetImage(medpatients[0].patientimage),
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
                                // "ชื่อ : " + medpatients[0].patientname,
                                "ชื่อ : " + xpatientName,
                                style: headerTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                "เพศ : " + medpatients[0].gender,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                "HN : " + medpatients[0].patientid,
                                style: subtitleTextStyle,
                              ),
                              // SizedBox(width: kDefaultPadding*2),
                              Spacer(),
                              Text(
                                "เตียง : " + medpatients[0].bedno,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              SizedBox(width: kDefaultPadding),
                              Text(
                                "อายุ : " + medpatients[0].age + "  ปี",
                                style: subtitleTextStyle,
                              ),
                              // SizedBox(width: kDefaultPadding*2),
                              Spacer(),
                              Text(
                                "วันเดือนปีเกิด : " +
                                    medpatients[0].dateofbirth,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 2),
                          Row(
                            children: [
                              Text(
                                "วอร์ด : " + medpatients[0].wardname,
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
