import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/extensions.dart';
import 'package:emar_demo/models/Patient.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatefulWidget {
  PatientCard({
    Key key,
    this.isActive = true,
    this.patient,
    this.patientAdmit,
    this.press,
  }) : super(key: key);

  final bool isActive;
  final Patient patient;
  QueryDocumentSnapshot patientAdmit;
  final VoidCallback press;

  @override
  _PatientCardState createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
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
                    backgroundImage: AssetImage(widget.patient.patientimage),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                // "${widget.medpatient.patientname} ",
                                "${widget.patient.patientname} ",

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
                                "HN : ${widget.patient.patientid}",
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .bodyText2
                                //     .copyWith(
                                //       color:
                                //           isActive ? Colors.white : kTextColor,
                                //     ),

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
                                "เตียง : ${widget.patient.bedno}",
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .bodyText2
                                //     .copyWith(
                                //       color:
                                //           isActive ? Colors.white : kTextColor,
                                //     ),

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
            /* if (!widget.medpatient.isChecked)
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
              ),*/
          ],
        ),
      ),
    );
  }
}
