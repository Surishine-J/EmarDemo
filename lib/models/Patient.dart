import 'package:flutter/material.dart';

class Patient {
  final String patientimage;
  final String patientname;
  final String patientid;
  final String age;
  final String drugallergy;
  final String gender;
  final String wardname;
  final String bedno;
  final String dateofbirth;

  //final Color tagColor;

  Patient({
    this.patientimage,
    this.patientname,
    this.patientid,
    this.dateofbirth,
    this.age,
    this.drugallergy,
    this.gender,
    this.wardname,
     this. bedno
  });
}

List<Patient> patients = List.generate(
  demo_data.length,
  (index) => Patient(
    patientname: demo_data[index]['patientname'],
    patientimage: demo_data[index]['patientimage'],
    patientid: demo_data[index]['patientid'],
    age: demo_data[index]['age'],
    dateofbirth: demo_data[index]['dateofbirth'],
    gender: demo_data[index]['gender'],
    wardname: demo_data[index]["wardname"],
    bedno: demo_data[index]["bedno"],
    drugallergy: demo_data[index]['drugallergy'],
  ),
);

List demo_data = [
  {
    "patientname": "นางสาวกุ๊กไก่ ใจดี ",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientid": "12345",
    "age": "25",
    "dateofbirth": "3 ม.ค. 2563",
    "gender": "หญิง",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
   "bedno": "B1201",
    "drugallergy": "Phenytoin Sodium (DITOIN) inj. 250 mg/5 mL",
  },
  {
    "patientname": "นางสาวพิม นาคำไฮ",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientid": "12345",
    "age": "25",
    "dateofbirth": "3 ม.ค. 2563",
    "gender": "หญิง",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "bedno": "B1201",
    "drugallergy": "Phenytoin Sodium (DITOIN) inj. 250 mg/5 mL",
  },
  {
    "patientname": "นายบุญมี เกิดเมื่อวาน",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientid": "12345",
    "age": "25",
    "dateofbirth": "3 ม.ค. 2563",
    "gender": "หญิง",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "bedno": "B1201",
    "drugallergy": "Phenytoin Sodium (DITOIN) inj. 250 mg/5 mL",
  },
  {
    "patientname": "นายบุญหลาย อยู่ดี",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientid": "12345",
    "age": "25",
    "dateofbirth": "3 ม.ค. 2563",
    "gender": "หญิง",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "bedno": "B1201",
    "drugallergy": "Phenytoin Sodium (DITOIN) inj. 250 mg/5 mL",
  },
  {
    "patientname": "นางสาวบุญเหลือ แบ่งปัน",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientid": "12345",
    "age": "25",
    "dateofbirth": "3 ม.ค. 2563",
    "gender": "หญิง",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "bedno": "B1201",
    "drugallergy": "Phenytoin Sodium (DITOIN) inj. 250 mg/5 mL",
  }
];
