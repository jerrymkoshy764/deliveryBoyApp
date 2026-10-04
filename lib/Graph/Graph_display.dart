import 'package:boy/Graph/bar_graph.dart';
import 'package:boy/firebase/usermodal.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Graph_display extends StatefulWidget {
  final String did;
  Graph_display({super.key, required this.did});

  @override
  State<Graph_display> createState() => _Graph_displayState();
}

class _Graph_displayState extends State<Graph_display>
    with SingleTickerProviderStateMixin {
  String? did;

  late DatabaseReference databaseReference_his_orders;
  late DatabaseReference databaseReference_his_earnings;
  //  DatabaseReference databaseReference =
  //     FirebaseDatabase.instance.ref().child('data_node').child('history_orders').child('542');

  List<History_Earnings_modal> listData = [];
  List<History_orders_modal> listData22 = [];

  void get_boy_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    did = prefs.getString('did') ?? '';
  }

  List<double> weeklySummary = [];
  late List<String> dates = ["65", "47", "78", "23", "74", "88"];
  late List<String> dates22 = ["65", "47", "78", "23", "74", "88"];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    databaseReference_his_orders = FirebaseDatabase.instance
        .ref()
        .child('data_node')
        .child('history_orders')
        .child("542");

    databaseReference_his_earnings = FirebaseDatabase.instance
        .ref()
        .child('data_node')
        .child('history_earnings')
        .child(widget.did);

    // putDataFromFirebase();
    getDataFromFirebase();
    getDataFromFirebase222();
    print(dates);

    _tabController = TabController(vsync: this, length: 2); // Number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perforance",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        bottom: TabBar(
          dividerColor: Color.fromARGB(255, 228, 188, 9),
          controller: _tabController,
          labelColor: Colors.white, // Text color for selected tab
          unselectedLabelColor: Color.fromARGB(
              255, 114, 121, 126), // Text color for unselected tabs

          tabs: [
            Tab(text: 'Earnings'),
            Tab(text: 'Orders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content of Tab 1
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 255, 255, 254),
                width: 650,
                child: new Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        dates[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -160,
                      child: Text(
                        dates[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -80,
                      child: Text(
                        dates[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 0,
                      child: Text(
                        dates[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 80,
                      child: Text(
                        dates[1],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 160,
                      child: Text(
                        dates[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 240,
                      child: Text(
                        dates[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child: SizedBox(
                      height: 300,
                      child: MyBarGRaph(
                        weeklySummary: weeklySummary,
                      ))),
              Container(
                color: const Color.fromARGB(255, 255, 255, 254),
                width: 650,
                child: new Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        dates[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -160,
                      child: Text(
                        dates[1],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -80,
                      child: Text(
                        dates[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 0,
                      child: Text(
                        dates[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 80,
                      child: Text(
                        dates[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 160,
                      child: Text(
                        dates[1],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 240,
                      child: Text(
                        dates[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Content of Tab 2
          // Content of Tab 1
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 255, 255, 254),
                width: 650,
                child: new Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        dates22[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -160,
                      child: Text(
                        dates22[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -80,
                      child: Text(
                        dates22[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 0,
                      child: Text(
                        dates22[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 80,
                      child: Text(
                        dates22[1],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 160,
                      child: Text(
                        dates22[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 240,
                      child: Text(
                        dates22[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child: SizedBox(
                      height: 300,
                      child: MyBarGRaph(
                        weeklySummary: weeklySummary,
                      ))),
              Container(
                color: const Color.fromARGB(255, 255, 255, 254),
                width: 650,
                child: new Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        dates22[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -160,
                      child: Text(
                        dates22[1],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: -80,
                      child: Text(
                        dates22[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 0,
                      child: Text(
                        dates22[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 80,
                      child: Text(
                        dates22[0],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 160,
                      child: Text(
                        dates22[1],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Positioned(
                      right: 0,
                      left: 240,
                      child: Text(
                        dates22[2],
                        style: new TextStyle(
                          color: Color.fromARGB(255, 4, 0, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//  List<History_orders_modal> listData = [];

  void putDataFromFirebase() {
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);

    final model = History_Earnings_modal(
      date: currentDate.toString().replaceAll("00:00:00.000", ""),
      count: 455,
    );
    databaseReference_his_earnings
        .child(currentDate.toString().replaceAll("00:00:00.000", ""))
        .set(model.toJson());
  }

  Future<void> getDataFromFirebase() async {
    List<History_Earnings_modal> listDa1 = [];
    databaseReference_his_earnings.onValue.listen((event) {
      listDa1.clear();
      listData.clear();
      for (final element in event.snapshot.children) {
        History_Earnings_modal model =
            History_Earnings_modal.fromJson(element.value as Map);
        listDa1.add(model);
      }

      setState(() {
        listData.addAll(listDa1);
        print(listData.length);
        dates.clear();
        for (int k = 0; k < listData.length; k++) {
// prefs.getString('did') ?? '';
          // if (listData[k].count.toString() == "455") {
          print(listData[k].date.toString());
          weeklySummary.add(double.parse(listData[k].count.toString()));
          dates.add(listData[k].date.toString());
          // _name.text = listData[k].names.toString();
          // _email.text = listData[k].user_nme.toString();
          // _city.text = listData[k].pass.toString();
          // }
        }
        //  print(dates);
      });
    });
  }

  Future<void> getDataFromFirebase222() async {
    List<History_orders_modal> listDa1 = [];
    databaseReference_his_orders.onValue.listen((event) {
      listDa1.clear();
      listData22.clear();
      for (final element in event.snapshot.children) {
        History_orders_modal model =
            History_orders_modal.fromJson(element.value as Map);
        listDa1.add(model);
        print(listDa1);
      }

      setState(() {
        listData22.addAll(listDa1);
        print(listData22.length);
        dates22.clear();
        for (int k = 0; k < listData22.length; k++) {
// prefs.getString('did') ?? '';
          // if (listData[k].count.toString() == "455") {
          print(listData22[k].date.toString());
          weeklySummary.add(double.parse(listData22[k].count.toString()));
          dates22.add(listData22[k].date.toString());
          // _name.text = listData[k].names.toString();
          // _email.text = listData[k].user_nme.toString();
          // _city.text = listData[k].pass.toString();
          // }
        }
      });
    });
  }

//   Future<void> getDataFromFirebase() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // did_id = prefs.getString('did') ?? '';
//     var did = prefs.getString('did') ?? '';

//     List<UserModel> listDa1 = [];
//     databaseReference.onValue.listen((event) {
//       listDa1.clear();
//       listData.clear();
//       for (final element in event.snapshot.children) {
//         UserModel model = UserModel.fromJson(element.value as Map);
//         listDa1.add(model);
//       }

//       setState(() {
//         listData.addAll(listDa1);

//         for (int k = 0; k < listData.length; k++) {
// // prefs.getString('did') ?? '';
//           if (listData[k].did.toString() == "555") {
//             print(listData[k].user_nme.toString());
//             // _name.text = listData[k].names.toString();
//             // _email.text = listData[k].user_nme.toString();
//             // _city.text = listData[k].pass.toString();
//           }
//         }
//       });
//     });
//   }
}
