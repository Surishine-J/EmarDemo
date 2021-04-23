import 'dart:async';

//import 'package:firebase_core/firebase_core.dart';
import 'package:emar_demo/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*void main() {
  runApp(MyApp());
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Login(),
      /* home: Scaffold(
        appBar: AppBar(),
        body: SearchWidget(),
      ),*/
      //  home: MainAdminMedScreen(),

      // home: MainAdminMedScreen(),
    );
  }
}

//===================
class SearchWidget extends StatelessWidget {
  SearchWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(onChanged: _filter),
          StreamBuilder<List<User>>(
            // StreamBuilder<QuerySnapshot> in your code.
            initialData:
                _dataFromQuerySnapShot, // you won't need this. (dummy data).
            // stream: Your querysnapshot stream.
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              return StreamBuilder<List<User>>(
                key: ValueKey(snapshot.data),
                initialData: snapshot.data,
                stream: _stream,
                builder:
                    (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  print(snapshot.data);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(snapshot.data[index].name);
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

StreamController<List<User>> _streamController = StreamController<List<User>>();
Stream<List<User>> get _stream => _streamController.stream;
_filter(String searchQuery) {
  List<User> _filteredList = _dataFromQuerySnapShot
      .where((User user) =>
          user.name.toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();
  _streamController.sink.add(_filteredList);
}

List<User> _dataFromQuerySnapShot = <User>[
  // every user has same enviornment because you are applying
  // such filter on your query snapshot.
  // same is the reason why every one is approved user.
  User('Zain Emery', 'some_enviornment', true),
  User('Dev Franco', 'some_enviornment', true),
  User('Emilia ONeill', 'some_enviornment', true),
  User('Zohaib Dale', 'some_enviornment', true),
  User('May Mcdougall', 'some_enviornment', true),
  User('LaylaRose Mitchell', 'some_enviornment', true),
  User('Beck Beasley', 'some_enviornment', true),
  User('Sadiyah Walker', 'some_enviornment', true),
  User('Mae Malone', 'some_enviornment', true),
  User('Judy Mccoy', 'some_enviornment', true),
];

class User {
  final String name;
  final String environment;
  final bool approved;

  const User(this.name, this.environment, this.approved);

  @override
  String toString() {
    return 'name: $name environment: $environment approved: $approved';
  }
}
//===================
