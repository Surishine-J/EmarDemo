
import 'package:emar_demo/components/circle_button.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/models/MedPatient.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../responsive.dart';
import 'medicine_card.dart';



class MedicineScreen extends StatelessWidget {
  const MedicineScreen({
    Key key,
    this.medpatient,
  }) : super(key: key);

  final MedPatient medpatient;

  @override
  Widget build(BuildContext context) {
    /*  return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              MedicineHeader(),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(patients[1].image),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: patients[1].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                          children: [
                                            TextSpan(
                                                text:
                                                    "  <elvia.atkins@gmail.com> to Jerry Torp",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Inspiration for our new home",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: kDefaultPadding / 2),
                                Text(
                                  "Today at 15:32",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            SizedBox(height: kDefaultPadding),
                            LayoutBuilder(
                              builder: (context, constraints) => SizedBox(
                                width: constraints.maxWidth > 850
                                    ? 800
                                    : constraints.maxWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello my love, \n \nSunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quo unde magnam numquam pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore. \n \nLove you, \n\nElvia",
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Color(0xFF4D5875),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: kDefaultPadding),
                                    Row(
                                      children: [
                                        Text(
                                          "6 attachments",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Download All",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                        SizedBox(width: kDefaultPadding / 4),
                                        WebsafeSvg.asset(
                                          "assets/Icons/Download.svg",
                                          height: 16,
                                          color: kGrayColor,
                                        ),
                                      ],
                                    ),
                                    Divider(thickness: 1),
                                    SizedBox(height: kDefaultPadding / 2),
                                    SizedBox(
                                      height: 200,
                                      child: StaggeredGridView.countBuilder(
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 4,
                                        itemCount: 3,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            "assets/images/Img_$index.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        staggeredTileBuilder: (int index) =>
                                            StaggeredTile.count(
                                          2,
                                          index.isOdd ? 2 : 1,
                                        ),
                                        mainAxisSpacing: kDefaultPadding,
                                        crossAxisSpacing: kDefaultPadding,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );*/

    return Scaffold(
      // body: Container(
      //   color: Colors.white,
      //   child: SafeArea(
      //     child: Column(
      //       children: [
      //         PatientHeader(),
      //         Divider(thickness: 1),
      //       ],
      //     ),
      //   ),
      // ),

      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: Colors.white,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Seearch bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          // _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search ",
                          fillColor: kBgLightColor,
                          filled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(
                                kDefaultPadding * 0.75), //15
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(
                                kDefaultPadding * 0.75), //15
                            child: WebsafeSvg.asset(
                              "assets/Icons/Search.svg",
                              width: 24,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    Spacer(),
                    Spacer(),
                    CircleButtonScan(
                      icon: Ionicons.scan,
                      iconSize: 30.0,
                      onPressed: () {
                        // setState(
                        //   () {},
                        // );
                        print('ํYou click Icon Qr Scan  Scan จ่ายยา');
                        // MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        //     builder: (BuildContext context) => SearchScan());
                        // Navigator.of(context).push(materialPageRoute);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: medpatients.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder: (context, index) => MedicineCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    medpatient: medpatients[index],

                    //==== กดแล้วไปหน้าผู้ป่วย =====
                    // press: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           PatientScreen(patient: patients[index]),
                    //     ),
                    //   );
                    // },
                    //==== จบกดแล้วไปหน้าผู้ป่วย =====
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
