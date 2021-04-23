import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/stylestext.dart';
import 'package:emar_demo/models/ward.dart';
import 'package:emar_demo/screens/main/main_adminmed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _selectedWard;
  // final formkey = GlobalKey<FormState>();
  // String userIdString, passwordString, wardIdString;
  String _barcode = "";
  final TextEditingController userIdString = TextEditingController();
  final TextEditingController passwordString = TextEditingController();
  final TextEditingController wardIdString = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* Future<void> checkAuthen() async {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signInAnonymously().then((response) {
        print('Authen Succes');
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => MainAdminMedScreen());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((response) {
        String title = response.code;
        String message = response.message;
        print(response.code);
        print(response.message);
        // myAlert(title, message);
      });
    }*/

    void getUser(
        String userIdString, String passwordString, String _selectedMeal) {
      String currentUser = "", currentWard = "";
      try {
        FirebaseFirestore.instance
            .collection("user")
            .where('username', isEqualTo: userIdString)
            .where('password', isEqualTo: passwordString)
            .where('wardid', isEqualTo: _selectedMeal)
            .get()
            .then(
          (querySnapshot) {
            querySnapshot.docs.forEach((result) {
              if (result.exists) {
                // print(result.data());
                //  print(result.get('name'));
                currentUser = result.get('name');
                currentWard = result.get('wardid');

                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => MainAdminMedScreen(
                        currentUser: currentUser, currentWard: currentWard));
                Navigator.of(context).pushAndRemoveUntil(
                    materialPageRoute, (Route<dynamic> route) => false);
                // print(currentUser);
                // print(currentWard);
              } else {
                //แสดง dialog box ข้อมูลไม่ถูกต้อง
              }
            });
          },
        );
      } catch (e) {
        print(e.toString());
      }
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        // radius: 48.0,
        radius: 60.0,
        child: Image.asset('assets/images/c66bg.png'),
      ),
    );

    final email = TextFormField(
      controller: userIdString,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        prefixIcon: Icon(CupertinoIcons.person_circle),
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), //32
        ),
      ),
    );

    final password = TextFormField(
      controller: passwordString,
      autofocus: false,
      // initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), //32
        ),
      ),
    );

    final selectward = Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0) //32

          ),
      child: DropdownButton<String>(
        value: _selectedWard,
        underline: Container(
            // padding: EdgeInsets.only(right: 20.0),
            color: Colors.transparent),
        isExpanded: true,
        onChanged: (String val) {
          //  dropDownState(() {
          setState(() {
            _selectedWard = val;
          });
          print(val);

          // wardIdString = _selectedMeal.trim();
        },
        // hint: Text("กรุณาเลือกหอผู้ป่วย"),
        hint: Text(
          'กรุณาเลือกหอผู้ป่วย',
          style: subtitleCardTextStyle,
        ),
        items: wards.map((Wards ward) {
          return new DropdownMenuItem<String>(
            value: ward.wardid,
            child: new Text(
              ward.wardname,
              style: subtitleCardTextStyle,
            ),
          );
        }).toList(),
      ),
    );

    final loginButton = Container(
      // padding: EdgeInsets.symmetric(vertical: 16.0),
      width: 580.0,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), //
        ),
        onPressed: () {
          print('userId: $userIdString password : $passwordString ');

          getUser(userIdString.text, passwordString.text, _selectedWard);

          /*  MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => MainAdminMedScreen());
          Navigator.of(context).push(materialPageRoute);*/
        },
        padding: EdgeInsets.all(12),
        // color: Colors.lightBlueAccent,
        color: kPrimaryColor,
        child: Text('Log In',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    final oRLabel = FlatButton(
      child: Text(
        '- OR -',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    final scanLoginButton = Container(
      width: 580.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), //24
        ),
        onPressed: () {
          // scan();
          print(_barcode);
          // Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        // color: Colors.lightBlueAccent,
        color: kPrimaryColor,
        // child: Text(' QR Code Scan', style: TextStyle(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              // Icons.arrow_forward,
              CupertinoIcons.qrcode_viewfinder,
              //size: 30.0,
              color: Colors.white,
            ),
            Text(
              ' QR Code Scan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        //key: formKey,
        stream: FirebaseFirestore.instance.collection('ward').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return Center(
              child: Container(
                //
                width: 600,
                height: 600,
                child: ListView(
                  children: <Widget>[
                    logo,
                    SizedBox(height: 48.0),
                    email,

                    SizedBox(height: 8.0),
                    password,

                    SizedBox(height: 8.0),
                    //selectward,
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0) //32

                          ),
                      child: DropdownButton<String>(
                        value: _selectedWard,
                        underline: Container(
                            // padding: EdgeInsets.only(right: 20.0),
                            color: Colors.transparent),
                        isExpanded: true,
                        onChanged: (String val) {
                          //  dropDownState(() {
                          setState(() {
                            _selectedWard = val;
                          });
                          print(val);
                        },
                        // hint: Text("กรุณาเลือกหอผู้ป่วย"),
                        hint: Text(
                          'กรุณาเลือกหอผู้ป่วย',
                          style: subtitleCardTextStyle,
                        ),

                        items:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                          return new DropdownMenuItem<String>(
                            value: document.get("wardid"),
                            child: new Text(
                              document.get("wardname"),
                              style: subtitleCardTextStyle,
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: 24.0),
                    loginButton,
                    // forgotLabel,
                    oRLabel,
                    scanLoginButton,
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

/*  Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      setState(() {
        this._barcode = barcode.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // The user did not grant the camera permission.
      } else {
        // Unknown error.
      }
    } on FormatException {
      // User returned using the "back"-button before scanning anything.
    } catch (e) {
      // Unknown error.
    }
  }*/
}
