import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/MedRecieve.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'medrecieved.dart';
import 'waitmedrecieve.dart';

class RecieveMedScreen extends StatefulWidget {
  const RecieveMedScreen({
    Key key,
    this.mrc,
    this.index,
  }) : super(key: key);

  final int index;
  final MedRecieve mrc;

  @override
  _RecieveMedScreenState createState() => _RecieveMedScreenState();
}

class _RecieveMedScreenState extends State<RecieveMedScreen> {
  List<MedRecieve> medrc = medrecieves;

  Widget _buildLabel(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: Row(
        children: [
          Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black45,
              ),
            ),
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                  unselectedLabelColor: Color(0xff2196F3),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    gradient: g10,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color(0xff2196F3),
                  ),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "รายการยารอรับเข้า",
                          style: headerTextStyleRecivedPage,
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "รายการยารับเข้าแล้ว",
                          style: headerTextStyleRecivedPage,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          body: TabBarView(
            children: [
              WaitMedRecieve(),
              MedReieved(),
            ],
          ),
        ),
      ),
    );
  }
}
