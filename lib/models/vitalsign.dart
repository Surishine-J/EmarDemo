import 'package:flutter/material.dart';

class VitalSign {
  final String hn;
  final double temperature;
  final int heartrate;
  final String bloodpressure;
  final int sys;
  final int dia;
  final int  pulse;

  VitalSign({
   this.hn,
  this.temperature,
   this.heartrate,
   this.bloodpressure,
    this.sys,
    this.dia,
    this.pulse,
  });
}

List<VitalSign> vitalsigns = List.generate(
  demo_data.length,
      (index) => VitalSign(
    hn: demo_data[index]['hn'],
        temperature: demo_data[index]['temperature'],
        heartrate: demo_data[index]['heartrate'],
        bloodpressure:demo_data[index]['bloodpressure'],
        sys:demo_data[index]['sys'],
        dia:demo_data[index]['dia'],
        pulse:demo_data[index]['pulse'],
  ),
);

List demo_data = [
  {
    "hn": "1234",
    "temperature": 37.0,
    "heartrate": 80,
    "bloodpressure": "120/80",
    "sys": 27,
    "dia": 27,
    "pulse": 27,
  },
  {
    "hn": "12345",
    "temperature": 37.0,
    "heartrate": 80,
    "bloodpressure": "120/60",
    "sys": 27,
    "dia": 27,
    "pulse": 27,
  },
];
