import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/MedRecieve.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class MedReieved extends StatefulWidget {
  @override
  _MedReievedState createState() => _MedReievedState();
}

class _MedReievedState extends State<MedReieved> {
  List<MedRecieve> medrc = medrecieves;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: Colors.white,
      // color:scaffold,
      child: SafeArea(
        right: false,
        child: Column(
          children: [
            // PatientHeader(),
            Divider(thickness: 1),

            //SizedBox(height: kDefaultPadding),
            Expanded(
              child: ListView.builder(
                itemCount: medrc.length,
                // On mobile this active dosen't mean anything
                itemBuilder: (context, index) => WaitMedRecieveCard(
                  isActive: Responsive.isMobile(context) ? false : index == 0,
                  medrc: medrc[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*alert() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "ตรวจสอบรายการยาถูกต้องครบถ้วนแล้ว ?",
      // desc: "ยืนยันรับยา",
      buttons: [
        DialogButton(
          child: Text(
            "ยืนยันรับยา",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "ยกเลิก",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }*/
}

class WaitMedRecieveCard extends StatefulWidget {
  const WaitMedRecieveCard({
    Key key,
    this.isActive = true,
    this.medrc,
  }) : super(key: key);

  final bool isActive;
  final MedRecieve medrc;

  @override
  _WaitMedRecieveCardState createState() => _WaitMedRecieveCardState();
}

class _WaitMedRecieveCardState extends State<WaitMedRecieveCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //semanticContainer: true,
      shape: Border(
        left: BorderSide(
          color: getColor(widget.medrc),
          width: 10,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: kDefaultPadding),
              // Text('logo'),
              Image.asset(
                "assets/images/Logo_MED_TH.png",
                //  width: 46,
                width: 50,
              ),
              SizedBox(width: kDefaultPadding),
              Text(
                'โรงพยาบาลมหาราชนครเชียงใหม่  โทร 0-55393-6150 ห้องยา 0-5393-5616',
                style: headerSubTextStyle,
              ),
            ],
          ),
          // SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        //color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset(
                            //patients[0].image,
                            widget.medrc.drugimage,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(width: kDefaultPadding),
                    Row(
                      children: [
                        SizedBox(width: kDefaultPadding),
                        Text(
                          "${widget.medrc.wardname} ",
                          style: stickerTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Row(
                      children: <Widget>[
                        SizedBox(width: kDefaultPadding),
                        Text(
                          " HN : ${widget.medrc.patientid} ",
                          style: stickerTextStyle,
                        ),
                        SizedBox(width: kDefaultPadding),
                        Text(
                          "${widget.medrc.patientname} ",
                          style: headerTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Row(
                      children: <Widget>[
                        SizedBox(width: kDefaultPadding),
                        Text(
                          "${widget.medrc.OrderDatetime} ",
                          style: stickerTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Row(
                      children: [
                        SizedBox(width: kDefaultPadding),
                        // Spacer(flex: 1,),

                        Text(
                          "${widget.medrc.drugname} ",
                          style: headerTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: kDefaultPadding),
                        Text(
                          widget.medrc.drugusage,
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: kDefaultPadding),
                        Text(
                          widget.medrc.mealadmin,
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Color getColor(MedRecieve medrev) {
    if (medrev.mealid == '8' && medrev.drugtype == '2') {
      return Colors.pink[400];
    } else if (medrev.mealid == '8' && medrev.drugtype != '2') {
      return Colors.green[400];
    } else if (medrev.mealid == '9' && medrev.drugtype == '2') {
      return Colors.pink[400];
    } else if (medrev.mealid == '9' && medrev.drugtype != '2') {
      return Colors.yellow;
    } else {
      if (medrev.drugtype == '2') {
        return Colors.pink[400];
      }
      return Colors.blue;
    }
  }
}
