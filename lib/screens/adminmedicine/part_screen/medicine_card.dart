import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/MedPatient.dart';
import 'package:emar_demo/models/reason.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class MedicineCard extends StatefulWidget {
  MedicineCard({
    Key key,
    this.isActive = true,
    this.medpatient,
    this.reasons,
    this.medpatient3,
  }) : super(key: key);

  final bool isActive;
  final MedPatient medpatient;
  DocumentSnapshot medpatient3;
  final Reasons reasons;

  @override
  _MedicineCardState createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  bool isSwitchedOffMed = false;
  bool isSwitchedHoldMed = false;

  String _selectedReasonOff;
  String _selectedReasonHold;

  @override
  void initState() {
    super.initState();
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

  /* Future scan() async {
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

  /*openAlertBoxHADScan() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 370.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Scan QR code หัวหน้าพยาบาล",
                      style: subtitleCardTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      color: kBadgeColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "ยานี้เป็นยาความเสี่ยงสูง กรุณา Scan ยืนยัน ให้ยา",
                          style: subtitleCardTextStyleAlert,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          CupertinoIcons.qrcode_viewfinder,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    //Navigator.of(context).pop();
                    //  scan();
                    print(_barcode);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/

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

//**********เชคว่ามียา STAT PRN ไหม ********//
  bool checkMealAdmin(MedPatient medpt) {
    if (medpt.mealid == "8" || medpt.mealid == "9") {
      return true;
    } else {
      return false;
    }
  }

  //****************************************//
  String _barcode = "";
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(kDefaultPadding / 2),
            //  padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                // SizeBox(width:10.0),

                Container(
                  width: 100.0,
                  height: 100.0,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    // color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Center(
                      child: Image.asset(
                        //patients[0].image,
                        widget.medpatient.drugimage,
                        width: 100.0,
                        height: 100.0,
                      ),
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
                            if (checkMealAdmin(widget.medpatient))
                              Text(
                                widget.medpatient.mealtime,
                                style: subtitleTextStyle,
                              )
                            else
                              Text(
                                widget.medpatient.mealtime + "  น.",
                                style: subtitleTextStyle,
                              )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: kDefaultPadding),
                            // Spacer(flex: 1,),

                            Text(
                              "${widget.medpatient.drugname} ",
                              style: headerTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: kDefaultPadding),
                            Text(
                              'test',
                              // widget.medpatient.drugusage,
                              style: subtitleTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: kDefaultPadding),
                            Text(
                              'test',
                              // widget.medpatient.mealadmin,
                              style: subtitleTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: kDefaultPadding),
                            Text(
                              "OFF ยา",
                              style: subtitleTextStyle,
                            ),
                            Switch(
                              value: isSwitchedOffMed,
                              onChanged: (value) {
                                setState(
                                  () {
                                    isSwitchedOffMed = value;
                                    print(isSwitchedOffMed);
                                    if (isSwitchedOffMed == true) {
                                      // openAlertBoxReason(context);
                                      openAlertBoxReasonOff(context);
                                    } else {
                                      print('ยกเลิก');
                                    }
                                  },
                                );
                              },
                              activeTrackColor: Colors.blue[100],
                              activeColor: Colors.blue,
                            ),
                            SizedBox(width: kDefaultPadding / 2),
                            Text(
                              "Hold ยา",
                              style: subtitleTextStyle,
                            ),
                            Switch(
                              value: isSwitchedHoldMed,
                              onChanged: (value) {
                                setState(() {
                                  isSwitchedHoldMed = value;
                                  if (isSwitchedHoldMed == true) {
                                    openAlertBoxReasonHold(context);
                                  } else {
                                    // isSwitchedHoldMed = false;
                                    print('ยกเลิก hold ยา');
                                  }
                                });
                              },
                              activeTrackColor: Colors.blue[100],
                              activeColor: Colors.blue,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                if (widget.medpatient.drugtype == "2") {
                                  // openAlertBoxHADScan();
                                  alertsScan();
                                }
                                print('กดจ่ายยา');
                              },
                              child: Text('จ่ายยา', style: headerTextStyle2),
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
  }
}
