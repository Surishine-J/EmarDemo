import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/Allergies.dart';

import 'package:flutter/material.dart';


class CardAllergies extends StatefulWidget {
  const CardAllergies({
    Key key,
    this.allergies,
  }) : super(key: key);
  final Allergies allergies;
  @override
  _CardAllergiesState createState() => _CardAllergiesState();
}

class _CardAllergiesState extends State<CardAllergies> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              gradient: g1,
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
                        Icons.coronavirus,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'ข้อมูลการแพ้ยา',
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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "รายชื่อยา",
                          style: subtitleCardTextStyle,
                          // style: GoogleFonts.prompt(),
                        ),
                        Spacer(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          allergies[0].drugname,
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    // Text("Kursubersicht"),
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
