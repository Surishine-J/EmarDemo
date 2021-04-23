import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  QuerySnapshot dbMedPatient;
  int countitems = 0;

  void getDataMealDispense(
      String _selectedMeal, String _currentWard, String hn) async {
    // DateTime _now = DateTime.now();
    // DateTime _start = DateTime(_now.year, _now.month, _now.day, 0, 0);
    // DateTime _end = DateTime(_now.year, _now.month, _now.day, 23, 59, 59);

    try {
      if (_selectedMeal == '0' && (hn == null || hn == "")) {
        dbMedPatient = await FirebaseFirestore.instance
            .collection('medpatient')
            .where('wardid', isEqualTo: _currentWard)
            .where('statusDispensed', isEqualTo: false)
            //.where('orderdate', isGreaterThanOrEqualTo: _start)
            //.where('orderdate', isLessThanOrEqualTo: _end)
            .orderBy('orderdate')
            .get();
      } else if (_selectedMeal == '0' && hn != null && hn != "") {
        dbMedPatient = await FirebaseFirestore.instance
            .collection('medpatient')
            .where('wardid', isEqualTo: _currentWard)
            //.where('patientid', isEqualTo: hn)
            .where('statusDispensed', isEqualTo: false)

            //.where('orderdate', isGreaterThanOrEqualTo: _start)
            //.where('orderdate', isLessThanOrEqualTo: _end)
            .orderBy('orderdate')
            .get();
      } else if (_selectedMeal != '0' && (hn == null || hn == "")) {
        dbMedPatient = await FirebaseFirestore.instance
            .collection('medpatient')
            .where('wardid', isEqualTo: _currentWard)
            .where('mealid', isEqualTo: _selectedMeal)
            .where('statusDispensed', isEqualTo: false)
            //.where('orderdate', isGreaterThanOrEqualTo: _start)
            //.where('orderdate', isLessThanOrEqualTo: _end)
            .orderBy('orderdate')
            .get();
        // return null;
      } else if (_selectedMeal != '0' && hn != null && hn != "") {
        dbMedPatient = await FirebaseFirestore.instance
            .collection('medpatient')
            .where('wardid', isEqualTo: _currentWard)
            .where('mealid', isEqualTo: _selectedMeal)
            // .where('patientid', isEqualTo: hn)
            .where('statusDispensed', isEqualTo: false)
            //.where('orderdate', isGreaterThanOrEqualTo: _start)
            //.where('orderdate', isLessThanOrEqualTo: _end)
            .orderBy('orderdate')
            .get();
      }
    } catch (e) {
      print(e.toString());
    }
    // QuerySnapshot  QSMedPatient = await dbMedPatient.get();

    countitems = dbMedPatient.docs.length;

    List<Map<String, dynamic>> listt =
        dbMedPatient.docs.map((e) => e.data()).toList();
    if (listt.length > 0) {
      listt =
          listt.where((e) => e['patientid'].toString().startsWith(hn)).toList();
      print("data :" + listt.length.toString());
      if (listt.length > 0) {
        countitems = listt.length;
      } else {
        countitems = 0;
      }
    } else {
      print("data : No Data");
    }
    print(countitems);

    notifyListeners();
  }
}
