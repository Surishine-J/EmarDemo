import 'package:flutter/material.dart';

class BMI {
  final String hn;
  final double height;
  final double weight;
  final String gender;
  final int age;

  BMI({
    this.hn,
    this.height,
    this.weight,
    this.gender,
    this.age,
  });
}

List<BMI> bmies = List.generate(
  demo_data.length,
  (index) => BMI(
    hn: demo_data[index]['hn'], 
    height: demo_data[index]['height'],
    weight: demo_data[index]['weight'],
    gender:demo_data[index]['gender'],
    age:demo_data[index]['age'],
  ),
);

List demo_data = [
  {
     "hn": "1234",
    "height": 150.0,
    "weight": 45.0,
    "gender": "Female",
    "age": 27,
  },
  {
     "hn": "12345",
    "height": 170.0,
    "weight": 48.0,
    "gender": "Male",
    "age": 27,
  },
];
