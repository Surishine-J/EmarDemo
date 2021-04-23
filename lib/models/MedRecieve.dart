class MedRecieve {
  final String patientid;
  final String patientimage;
  final String patientname;
  final String gender;
  final String dateofbirth;
  final String age;
  final String bedno;

  final String wardid;
  final String wardname;
  final String drugid;
  final String drugimage;
  final String drugname;
  final String drugtype;
  final String mealtime;
  final String drugusage;
  final String mealid;
  final String mealadmin;

  final bool isRecieved;
  final String OrderDatetime;

  MedRecieve(
      {this.patientid,
      this.patientimage,
      this.patientname,
      this.gender,
      this.dateofbirth,
      this.age,
      this.bedno,
      this.wardid,
      this.wardname,
      this.drugid,
      this.drugimage,
      this.drugname,
      this.drugtype,
      this.mealtime,
      this.drugusage,
      this.mealid,
      this.mealadmin,
      this.isRecieved,
      this.OrderDatetime});
}

List<MedRecieve> medrecieves = List.generate(
  demo_data.length,
  (index) => MedRecieve(
    patientid: demo_data[index]['patientid'],
    patientimage: demo_data[index]['patientimage'],
    patientname: demo_data[index]['patientname'],
    gender: demo_data[index]['gender'],
    dateofbirth: demo_data[index]['dateofbirth'],
    age: demo_data[index]['age'],
    bedno: demo_data[index]['bedno'],
    wardid: demo_data[index]['wardid'],
    wardname: demo_data[index]["wardname"],
    drugid: demo_data[index]['drugid'],
    drugimage: demo_data[index]['drugimage'],
    drugname: demo_data[index]['drugname'],
    drugtype: demo_data[index]['drugtype'],
    mealtime: demo_data[index]['mealtime'],
    drugusage: demo_data[index]['drugusage'],
    mealid: demo_data[index]['mealid'],
    mealadmin: demo_data[index]['mealadmin'],
    isRecieved: demo_data[index]['isRecieved'],
    OrderDatetime: demo_data[index]['OrderDatetime'],
  ),
);

List demo_data = [
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาว กุ๊กไก่ ใจดี",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/diazepam5mg.jpg",
    "drugname": "DIAZEPAM 5 mg เม็ด",
    "drugtype": "2",
    "mealtime": "08.00",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง ",
    "mealid": "1",
    "mealadmin": "ก่อนอาหารเช้า ",
    "isRecieved": false,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/doxycyclinemonohydrate100mg.jpg",
    "drugname": "Doxycycline monohydrate 100 mg.",
    "drugtype": "1",
    "mealtime": "08.00",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง ",
    "mealid": "1",
    "mealadmin": "ก่อนอาหารเช้า ",
    "isRecieved": true,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/hydrochlorothiazide25mg.jpg",
    "drugname": "Hydrochlorothiazide 25 mg",
    "drugtype": "1",
    "mealtime": "STAT",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง  ",
    "mealid": "8",
    "mealadmin": "STAT ",
    "isRecieved": true,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/omeplazole20mg.jpg",
    "drugname": "Omeplazole 20 mg",
    "drugtype": "1",
    "mealtime": "PRN",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง  ",
    "mealid": "9",
    "mealadmin": "PRN ",
    "isRecieved": false,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/clonazepamsytemic0.5mg.jpg",
    "drugname": "Clonazepamsytemic 0.5 mg",
    "drugtype": "2",
    "mealtime": "PRN",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง  ",
    "mealid": "9",
    "mealadmin": "PRN ",
    "isRecieved": false,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/clonazepamsystemic1mg.jpg",
    "drugname": "clonazepamsystemic 1 mg.",
    "drugtype": "2",
    "mealtime": "PRN",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง  ",
    "mealid": "9",
    "mealadmin": "PRN ",
    "isRecieved": false,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/Ibuprofen200mg.jpg",
    "drugname": "Ibuprofen 200 mg.",
    "drugtype": "2",
    "mealtime": "PRN",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง  ",
    "mealid": "9",
    "mealadmin": "PRN ",
    "isRecieved": false,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
  {
    "patientid": "12345",
    "patientimage": "assets/images/patientinfo.jpg",
    "patientname": "นางสาวพิม นาคำไฮ",
    "gender": "หญิง",
    "dateofbirth": "03 ม.ค. 2563",
    "age": "25",
    "bedno": "B1201",
    "wardid": "SGIC",
    "wardname": "Surgผู้ป่วยหนักศัลยกรรมทรวงอกหัวใจและหลอดเลือด(Ward)",
    "drugid": "T0123",
    "drugimage": "assets/images/diazepam10mg.jpg",
    "drugname": "diazepam 10 mg",
    "drugtype": "2",
    "mealtime": "PRN",
    "drugusage": "รับประทานครั้งละ 1/4  เม็ด วันละ 1 ครั้ง  ",
    "mealid": "9",
    "mealadmin": "PRN ",
    "isRecieved": false,
    "OrderDatetime": "01 ก.พ. 2564   12:06"
  },
];
