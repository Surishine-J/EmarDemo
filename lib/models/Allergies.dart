import 'package:flutter/material.dart';

class Allergies {
  final String hn;
  final String drugid;
  final String drugname;

  Allergies({
    this.hn,
    this.drugid,
    this.drugname,
  });
}

List<Allergies> allergies = List.generate(
  demo_data.length,
  (index) => Allergies(
    hn: demo_data[index]['hn'],
    drugid: demo_data[index]['drugid'],
    drugname: demo_data[index]['drugname'],
  ),
);

List demo_data = [
  {
     "hn": "12345",
    "drugid": "T00003",
    "drugname": "Dafiro Tab 10/160 mg,\r\nDextromethorphan Tab 15 mg",
  },
  {
     "hn": "12345",
    "drugid": "T00001",
    "drugname": "Dextromethorphan Tab 15 mg",
  },
 
];
