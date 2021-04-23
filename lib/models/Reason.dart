class Reasons {
  final String reasonid;
  final String reasonname;

  Reasons({
    this.reasonid,
    this.reasonname,
  });
}

List<Reasons> reasons = List.generate(
  demo_data.length,
  (index) => Reasons(
    reasonid: demo_data[index]['reasonid'],
    reasonname: demo_data[index]['reasonname'],
  ),
);

List demo_data = [
  //  {
  //   "reasonid": "000",
  //   "reasonname": "กรุณาระบุเหตุผล",
  // },
  {
    "reasonid": "001",
    "reasonname": "ผุ้ป่วยไปฟอกไต",
  },
  {
    "reasonid": "002",
    "reasonname": "ผุ้ป่วยเข้าห้องน้ำ",
  },
  {
    "reasonid": "003",
    "reasonname": "แพทย์สั่งหยุด",
  },
  {
    "reasonid": "004",
    "reasonname": "เฝ้า/ดูอาการ",
  },
  {
    "reasonid": "005",
    "reasonname": "ผู้ป่วยไปเอ็กซเรย์",
  },
  {
    "reasonid": "006",
    "reasonname": "ลืม",
  },
];
