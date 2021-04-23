

import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/extensions.dart';
import 'package:emar_demo/models/MedRecieve.dart';
import 'package:flutter/material.dart';

class RecievePatientCard extends StatefulWidget {
  const RecievePatientCard({
    Key key,
    this.isActive = true,
    this.mrc,
    this.press,
  }) : super(key: key);

  final bool isActive;

  final MedRecieve mrc;
  final VoidCallback press;

  @override
  _RecievePatientCardState createState() => _RecievePatientCardState();
}

class _RecievePatientCardState extends State<RecievePatientCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: widget.press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                // color: widget.isActive ? kPrimaryColor : kBgDarkColor,
                color: widget.isActive ? kPrimaryColor : Colors.white70,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    // maxRadius: 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(widget.mrc.patientimage),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${widget.mrc.patientname} ",
                                style: TextStyle(
                                  color: widget.isActive
                                      ? Colors.white
                                      : kTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  fontFamily: 'Prompt',
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 4),
                          Row(
                            children: [
                              Text(
                                "HN : ${widget.mrc.patientid}",
                                style: TextStyle(
                                  color: widget.isActive
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  fontFamily: 'Prompt',
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: kDefaultPadding / 4),
                          Row(
                            children: [
                              Text(
                                "เตียง : ${widget.mrc.bedno}",
                                style: TextStyle(
                                  color: widget.isActive
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  fontFamily: 'Prompt',
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
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
          ],
        ),
      ),
    );
  }
}
