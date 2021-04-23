//import 'dart:js';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:emar_demo/screens/main/main_adminmed_screen.dart';
//import 'package:flutter/material.dart';

/*void getUser(
    String userIdString, String passwordString, String _selectedMeal) {
  try {
    FirebaseFirestore.instance
        .collection("user")
        .where('username', isEqualTo: userIdString)
        .where('password', isEqualTo: passwordString)
        .where('wardid', isEqualTo: _selectedMeal)
        .get()
        .then(
          (querySnapshot) {
        querySnapshot.docs.forEach(
                (result) {

              if (result.exists) {
                print(result.data());
                print(result.get('name'));
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MainAdminMedScreen());
                Navigator.of(context).pushAndRemoveUntil(
                    materialPageRoute, (Route<dynamic> route) => false);
              } else {
                //แสดง dialog box ข้อมูลไม่ถูกต้อง
              }
            }

        );
      },
    );
  } catch (e) {
    print(e.toString());
  }
}*/
