import 'package:boy/Reviews/placed_orders.dart';
import 'package:boy/firebase/usermodal.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class reviews extends StatefulWidget {
  const reviews({super.key});

  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  String? did;
  String? earnings;
  String? Floating_cash;
  String? time;

  DatabaseReference databaseReference_per =
      FirebaseDatabase.instance.ref().child('data_node').child('performance');

  List<Performance> listData = [];

  var id = "";

  // late Future <List<Categories>> items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataFromFirebase();

    setState(() {
      getDataFromFirebase();
      get_boy_data();
      get_time();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 209, 208, 208),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Orders",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: LimitedBox(
                                    maxHeight: 650, child: placed_orders()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getDataFromFirebase() {
    List<Performance> listDa1 = [];
    databaseReference_per.onValue.listen((event) {
      listDa1.clear();
      listData.clear();
      for (final element in event.snapshot.children) {
        Performance model = Performance.fromJson(element.value as Map);
        listDa1.add(model);
      }

      setState(() {
        listData.addAll(listDa1);

        for (int k = 0; k < listData.length; k++) {
          if (did == listData[k].did.toString()) {
            earnings = listData[k].earn.toString();
            Floating_cash = listData[k].Float_cash.toString();
          }
        }

        print(listData);

        print(listData[0].earn.toString());
      });
    });
  }

  void get_time() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      time = prefs.getString('time') ?? '';
    });
  }

  void get_boy_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    did = prefs.getString('did') ?? '';
  }
}
