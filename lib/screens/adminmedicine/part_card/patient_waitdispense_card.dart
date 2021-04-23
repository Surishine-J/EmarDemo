import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/extensions.dart';
import 'package:flutter/material.dart';

class PatientWaitDispenseCard extends StatefulWidget {
  const PatientWaitDispenseCard({
    Key key,
    this.isActive,
    this.medpatient,
    this.press,
    //this.patientName,
  }) : super(key: key);
  // final int tappedIndex;
  final bool isActive;

  final VoidCallback press;
  final DocumentSnapshot medpatient;

  // final String patientName;

  @override
  _PatientWaitDispenseCardState createState() =>
      _PatientWaitDispenseCardState();
}

class _PatientWaitDispenseCardState extends State<PatientWaitDispenseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: widget.press,

        // onTapDown: ,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: widget.isActive ? kPrimaryColor : Colors.white54,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    // maxRadius: 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        // AssetImage(widget.medpatient.get('patientimage')),
                        NetworkImage(widget.medpatient.get('patientimage')),
                    // NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${widget.medpatient.get('patientname')} ",
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
                                "HN : ${widget.medpatient.get('patientid')}",
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
                                "เตียง : ${widget.medpatient.get('bedno')}",
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
            if (!widget.medpatient.get('ischecked'))
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
