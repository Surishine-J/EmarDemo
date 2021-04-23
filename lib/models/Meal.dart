class Meal {
  final String mealid;
  final String mealname;

  Meal({
    this.mealid,
    this.mealname,
  });
}

List<Meal> meals = List.generate(
  demo_data.length,
  (index) => Meal(
    mealid: demo_data[index]['mealid'],
    mealname: demo_data[index]['mealname'],
  ),
);

List demo_data = [
  // {
  //   "mealid": "000",
  //   "mealname": " กรุณาเลือกมื้อบริหารยา",
  // },
  {
    "mealid": "001",
    "mealname": " ก่อนอาหาร - เช้า",
  },
  {
    "mealid": "002",
    "mealname": " หลังอาหาร - เช้า",
  },
  {
    "mealid": "003",
    "mealname": "ก่อนอาหาร - กลางวัน",
  },
  {
    "mealid": "004",
    "mealname": "หลังอาหาร - กลางวัน",
  },
  {
    "mealid": "005",
    "mealname": "ก่อนอาหาร - เย็น",
  },
  {
    "mealid": "006",
    "mealname": "หลังอาหาร - เย็น",
  },
  {
    "mealid": "007",
    "mealname": "ก่อนนอน",
  },
];
