class MealMedicine {
  //field
  String patientid;
  String patientimage;
  String patientname;
  String gender;
  String dateofbirth;
  String age;
  String bedno;
  String wardid;
  String wardname;
  String drugid;
  String drugimage;
  String drugname;
  String drugtype;
  String mealtime;
  String drugusage;
  String mealid;
  String mealadmin;
  bool overtime;
  bool ischecked;

  MealMedicine({
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
    this.ischecked,
  });
}

/* MealMedicine.fromSnapshot(DocumentSnapshot snapshot){
        patientid = snapshot.data()['patientid'],
        patientimage = snapshot.data()['patientimage'],
        patientname = snapshot.data()['patientname'],
        gender = snapshot.data()['gender'],
        dateofbirth = snapshot.data()['dateofbirth'],
        age = snapshot.data()['age'],
        bedno = snapshot.data()['bedno'],
        wardid = snapshot.data()['wardid'],
        wardname = snapshot.data()['wardname'],
        drugid = snapshot.data()['drugid'],
        drugimage = snapshot.data()['drugimage'],
        drugname = snapshot.data()['drugname'],
        drugtype = snapshot.data()['drugtype'],
        mealtime = snapshot.data()[ 'mealtime'],
        drugusage = snapshot.data()['drugusage'],
        mealid = snapshot.data()['mealid'],
        mealadmin=snapshot.data()['mealadmin'],
        overtime= snapshot.data()['overtime'],
        ischecked= snapshot.data()['isChecked']



}*/
