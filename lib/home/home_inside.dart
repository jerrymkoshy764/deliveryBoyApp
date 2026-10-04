import 'package:boy/home/get_order_list.dart';

import 'package:boy/firebase/usermodal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:fresh_to_table/forgot_password.dart';

class home_inside extends StatefulWidget {
  const home_inside({super.key});

  @override
  State<home_inside> createState() => _home_insideState();
}
// ValueNotifier<List<Categories>> categoryNotifier = ValueNotifier([]);

class _home_insideState extends State<home_inside> {
  String? did;
  String? earnings;
  String? Floating_cash;
  String? order_count;
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
                                child: 
                                LimitedBox(
                                    maxHeight: 450, child: order_list()),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 120,
                                                color: Color.fromARGB(
                                                    255, 67, 111, 120),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/image/wallet.png",
                                                          height: 50,
                                                          width: 80,
                                                        ),
                                                        Text(
                                                          earnings.toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255)),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text('Your name - ${listData[0].earn.toString()}'),
                                                    Text(
                                                      "Today's earnings",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              255, 255, 255),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Expanded(
                                            child: Container(
                                                height: 120,
                                                color: Color.fromARGB(
                                                    255, 67, 111, 120),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                     
                                                    // Image.asset(
                                                    //   "assets/image/money.png",
                                                    //   height: 50,
                                                    //   width: 200,
                                                    // ),
                                                      Row(
                                                      children: [
                                                        Image.asset(
                                                           "assets/image/delivered.png",
                                                          height: 50,
                                                          width: 80,
                                                        ),

                                                         Text(
                                                     order_count.toString(),
                                                   
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color.fromARGB(255, 255, 255, 255),
                                                          fontSize: 20),
                                                    ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "Total Orders",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              255, 255, 255),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          // Text("jerry"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 120,
                                                color: Color.fromARGB(
                                                    255, 67, 111, 120),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  

                                                 
                                                     Row(
                                                      children: [
                                                        Image.asset(
                                                           "assets/image/income.png",
                                                          height: 50,
                                                          width: 80,
                                                        ),

                                                         Text(
                                                     Floating_cash.toString(),
                                                   
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color.fromARGB(255, 255, 255, 255),
                                                          fontSize: 20),
                                                    ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "Floating cash",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              255, 255, 255),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Expanded(
                                            child: Container(
                                                height: 120,
                                                color: Color.fromARGB(
                                                    255, 67, 111, 120),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/image/time-passing.png",
                                                          height: 50,
                                                          width: 80,
                                                        ),

                                                         Text(
                                                     time.toString(),
                                                    //  +":"+min.toString() +":"+sec.toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color.fromARGB(255, 255, 255, 255),
                                                          fontSize: 20),
                                                    ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "Login duration",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              255, 255, 255),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          // Text("jerry"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              )
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
            order_count= listData[k].order_count.toString();
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
