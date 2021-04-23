import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/models/MedPatient.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'medicine_card.dart';

class MedicineWaitDispenseScreen extends StatefulWidget {
  const MedicineWaitDispenseScreen({
    Key key,
    this.medpatient,
    this.patientid,
    this.selectmeal,
  }) : super(key: key);

  final MedPatient medpatient;
  final String patientid;
  final String selectmeal;

  @override
  _MedicineWaitDispenseScreenState createState() =>
      _MedicineWaitDispenseScreenState();
}

class _MedicineWaitDispenseScreenState
    extends State<MedicineWaitDispenseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('medpatient')
                .where('patientid', isEqualTo: patientid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
                  color: Colors.white,
                  // color:scaffold,
                  child: SafeArea(
                    right: false,
                    child: Column(
                      children: [
                        PatientHeader(),
                        Divider(thickness: 1),

                        //SizedBox(height: kDefaultPadding),
                        Expanded(
                          child: ListView.builder(
                            itemCount: medpatients.length,
                            itemBuilder: (context, index) => MedicineCard(
                              isActive: Responsive.isMobile(context)
                                  ? false
                                  : index == 0,
                              medpatient: medpatients[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            })*/
      body: Container(
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
                  itemCount: medpatients.length,
                  itemBuilder: (context, index) => MedicineCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    medpatient: medpatients[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
