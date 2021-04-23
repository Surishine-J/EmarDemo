

import 'package:flutter/material.dart';

import '../recievemed/part_card/list_of_patient_recievemed.dart';
import '../recievemed/part_menusidebar/side_menu_recieve.dart';
import '../recievemed/part_screen/recievemed_screen.dart';
import '../responsive.dart';

class MainRecieveMedScreen extends StatefulWidget {
  @override
  _MainRecieveMedScreenState createState() => _MainRecieveMedScreenState();
}

class _MainRecieveMedScreenState extends State<MainRecieveMedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ListOfRecieveMed(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfRecieveMed(),
            ),
            Expanded(
              flex: 9,
              child: RecieveMedScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              //child: SideMenu(),
              child: SideMenuRecieve(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfRecieveMed(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: RecieveMedScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
