import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:flutter/material.dart';

class CardLab extends StatefulWidget {
  CardLab({Key key}) : super(key: key);

  @override
  _CardLabState createState() => _CardLabState();
}

class _CardLabState extends State<CardLab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              gradient: g12,
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
                    children: [
                      Icon(
                        Icons.science_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'ข้อมูล LAB',
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
                          "ดูข้อมูล LAB",
                          style: subtitleCardTextStyle,
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Spacer(),
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
