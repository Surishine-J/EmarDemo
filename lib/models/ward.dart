class Wards {
  final String wardid;
  final String wardname;

  Wards({
    this.wardid,
    this.wardname,
  });
}

List<Wards> wards = List.generate(
  demo_data.length,
  (index) => Wards(
    wardid: demo_data[index]['wardid'],
    wardname: demo_data[index]['wardname'],
  ),
);

List demo_data = [
  /* {
    "wardid": "000",
    "wardname": "กรุณาเลือกหอผู้ป่วย",
  },*/
  {
    "wardid": "001",
    "wardname": "ICUศัลย์หัวใจและทรวงอก",
  },
  {
    "wardid": "002",
    "wardname": "Pedผู้ป่วยหนักกุมารเวชกรรมโรคหัวใจ(PCICU)(Ward)",
  },
  {
    "wardid": "003",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
  },
  {
    "wardid": "004",
    "wardname": "Eyeจักษุ2(Ward)",
  },
  {
    "wardid": "005",
    "wardname": "หอผู้ป่วย1(ชั้น6)ศูนย์เวชศาสตร์ผู้สูงอายุ(Ward)",
  },
  {
    "wardid": "006",
    "wardname": "หอผู้ป่วย2(ชั้น5)ศูนย์เวชศาสตร์ผู้สูงอายุ(Ward)",
  },
  {
    "wardid": "007",
    "wardname": "Gynนรีเวชกรรม(Ward)",
  },
  {
    "wardid": "008",
    "wardname": "Medผู้ป่วยหนักโรคหัวใจและหลอดเลือด1(Ward)",
  },
  {
    "wardid": "009",
    "wardname": "Medวิกฤตโรคหลอดเลือดสมอง(Ward)",
  },
  {
    "wardid": "010",
    "wardname": "Medโรคปอด(Ward)",
  },
  {
    "wardid": "011",
    "wardname": "Medผู้ป่วยหนักโรคหัวใจและหลอดเลือด2(Ward)",
  },
  {
    "wardid": "012",
    "wardname": "Medปลูกถ่ายไขกระดูกและให้ยาเคมีบำบัดขนาดสูง(Ward)",
  },
];
