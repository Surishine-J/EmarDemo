
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/vitalsign.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardVitalSign extends StatefulWidget {
  const CardVitalSign({
    Key key,
    this.vitalSign,
  }) : super(key: key);
  final VitalSign vitalSign;

  @override
  _CardVitalSignState createState() => _CardVitalSignState();
}

class _CardVitalSignState extends State<CardVitalSign> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 64,
            decoration: BoxDecoration(
              gradient: g7,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            // margin: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Ionicons.pulse,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'ข้อมูล Vital Signs',
                        style: headerTextStylePatientPage,
                      ),
                      // SizedBox(width: 20),
                      Spacer(),

                      IconButton(
                        iconSize: 32.0,
                        icon: Icon(
                          CupertinoIcons.add_circled_solid,
                        ),
                        color: Colors.white,
                        // tooltip: 'Increase volume by 10',
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            elevation: 0.5,
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ExpansionTile(
                backgroundColor: Colors.white,
                // title: _buildTitle(),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Temperature",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "Heart rate ",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "Blood pressure",
                          style: subtitleCardTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          vitalsigns[0].temperature.toString() + " C",
                          style: subtitleTextStyle,
                        ),
                        // Spacer(),
                        SizedBox(
                          width: kDefaultPadding * 9,
                        ),

                        Text(
                          // "60-99 bpm. test",
                          vitalsigns[0].heartrate.toString() + "  bpm.",
                          style: subtitleTextStyle,
                        ),

                        SizedBox(
                          width: kDefaultPadding * 6.5,
                        ),

                        Text(
                          vitalsigns[0].bloodpressure.toString() + "  mmHg",
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "SYS",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "DIA",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "Pulse",
                          style: subtitleCardTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          vitalsigns[0].sys.toString() + " mmHg",
                          style: subtitleTextStyle,
                        ),
                        Spacer(),
                        Text(
                          vitalsigns[0].dia.toString() + " mmHg",
                          style: subtitleTextStyle,
                        ),
                        Spacer(),
                        Text(
                          vitalsigns[0].pulse.toString() + " bpm.",
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: SizedBox(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
