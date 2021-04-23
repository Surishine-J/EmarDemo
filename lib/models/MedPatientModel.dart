class MedPatientModel {
  //field
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
  final bool overtime;
  final bool ischecked;

  //method constructor
  MedPatientModel(
      this.patientid,
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
      this.overtime,
      this.ischecked);

//method ทำหน้าที่เป็นตัวsetter ให้กับ field แต่นำเข้ามาในรูปแบบค่า map คือ แบบ key ,value
  MedPatientModel.fromMap(
      Map<String, dynamic> map,
      this.patientid,
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
      this.overtime,
      this.ischecked) {
    patientid:
    map['patientid'];
    patientimage:
    map['patientimage'];
    patientname:
    map['patientname'];
    gender:
    map['gender'];
    dateofbirth:
    map['dateofbirth'];
    age:
    map['age'];
    bedno:
    map['bedno'];
    wardid:
    map['wardid'];
    wardname:
    map["wardname"];
    drugid:
    map['drugid'];
    drugimage:
    map['drugimage'];
    drugname:
    map['drugname'];
    drugtype:
    map['drugtype'];
    mealtime:
    map['mealtime'];
    drugusage:
    map['drugusage'];
    mealid:
    map['mealid'];
    mealadmin:
    map['mealadmin'];
    overtime:
    map['overtime'];
    ischecked:
    map['isChecked'];
  }
}
