import 'dart:math';


import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/bmi.dart';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardBMI extends StatefulWidget {
  const CardBMI({
    Key key,
    this.bmi,
  }) : super(key: key);
  final BMI bmi;
  @override
  _CardBMIState createState() => _CardBMIState();
}

class _CardBMIState extends State<CardBMI> {
  @override
  void initState() {
    super.initState();
  }

  double _bmi;

  String calculateBMI(double height, double weight) {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(double _bmi) {
    if (_bmi < 18.5) {
      return 'ผอม';
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return 'ปกติ';
    } else if (_bmi >= 23.0 && _bmi <= 24.9) {
      return 'น้ำหนักเกิน';
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return 'อ้วนระดับ 1';
    } else if (_bmi >= 30.0) {
      return 'อ้วนระดับ 2';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              //color: Colors.amber[400],
              gradient: g11,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Ionicons.body,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'ข้อมูล BMI',
                        style: headerTextStylePatientPage,
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
                          "Gender",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "Height",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "Weight ",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "BMI",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                        Text(
                          "Result",
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
                          bmies[0].gender.toString(),
                          style: subtitleTextStyle,
                        ),
                        Spacer(),
                        Text(
                          bmies[0].height.toString() + " cm.",
                          style: subtitleTextStyle,
                        ),
                        Spacer(),
                        Text(
                          bmies[0].weight.toString() + " kg.",
                          style: subtitleTextStyle,
                        ),
                        Spacer(),
                        Text(
                          calculateBMI(bmies[0].height, bmies[0].weight),
                          style: subtitleTextStyle,
                        ),
                        Spacer(),
                        Text(
                          getResult(_bmi),
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
