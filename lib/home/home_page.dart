import 'dart:async';

import 'package:boy/Graph/Graph_display.dart';
import 'package:boy/Reviews/reviews.dart';

import 'package:boy/firebase/usermodal.dart';
import 'package:boy/home/home_inside.dart';
import 'package:boy/home/messaage_center.dart';

import 'package:boy/home/splash_boy.dart';
import 'package:boy/setting.dart';
import 'package:boy/youtube_player.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:fresh_to_table/forgot_password.dart';

class home_page extends StatefulWidget {
  home_page({
    super.key,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  String? name;
  String? did;

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('delivery_boy');

  DatabaseReference databaseReference_per =
      FirebaseDatabase.instance.ref().child('data_node').child('performance');

  List<UserModel> listData = [];

//********Timer set ********* */

  // Step 2
  Timer? countdownTimer;
  Duration myDuration = Duration();

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    print(myDuration.toString());
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds + reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

//********Timer set end ********* */

  bool button_val = false;

  void active_boy(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('active', val);
  }

  int? s;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      // active();
      print("bbbb**********$button_val");
      getDataFromFirebase();
      get_boy_data();
      List<Performance> listData = [];

      // void getDataFromFirebase_2() {
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
              // int  s = listData[k].sec.toString();

              s = int.parse(listData[k].sec.toString());

              myDuration = Duration(
                  seconds: int.parse(listData[k].sec.toString()),
                  minutes: int.parse(listData[k].min.toString()),
                  hours: int.parse(listData[k].hours.toString()));
              timer_set(myDuration.toString(), listData[k].min.toString(),
                  listData[k].sec.toString());
              print("time is " + myDuration.toString());
            }
          }

          // print(listData);

          // print(listData[0].earn.toString());
        });
      });
      // }
    });
  }

  var mainpage = [
    home_inside(),
    Settings(),
  ];
  int seelectindex = 0;
  void ontap(int index) {
    setState(() {
      seelectindex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    var seconds = strDigits(myDuration.inSeconds.remainder(60));

    //  seconds="25";

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120, // Set this height

        // automaticallyImplyLeading: false,
        title: Container(
          height: 200,
          child: Row(
            children: [
              // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  "assets/image/kk.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(),

              SizedBox(
                width: 10,
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => message_center()));
                },
                child: new Stack(
                  children: <Widget>[
                    new Icon(Icons.help),
                    // new Positioned(
                    //   right: 0,
                    //   child: new Container(
                    //     padding: EdgeInsets.all(1),
                    //     decoration: new BoxDecoration(
                    //       color: Colors.red,
                    //       borderRadius: BorderRadius.circular(6),
                    //     ),
                    //     constraints: BoxConstraints(
                    //       minWidth: 12,
                    //       minHeight: 12,
                    //     ),
                    //     child: 
                    //     new Text(
                    //       '22',
                    //       style: new TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 9,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              // title: Text('Notifications'),

              SizedBox(
                width: 10,
              ),

            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name.toString()),
              accountEmail: Text("Welcome to Fresh To Table"),
              currentAccountPicture:
                  // CircleAvatar(
                  // backgroundColor: Colors.orange,
                  Image.asset("assets/image/user.png"),
              // ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/image/back_ground.png"), // Change to your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.work_history,
                color: Colors.red,
              ),
              title: Text("Duty Status",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              trailing: Switch(
                  value: button_val,
                  onChanged: (value) {
                    setState(() {
                      button_val = value;

                      if (button_val == true) {
                        startTimer();
                        active_boy("true");
                      } else {
                        stopTimer();
                        timer_set(hours.toString(), minutes.toString(),
                            seconds.toString());
                        active_boy("false");
                        print(seconds.toString());

                        databaseReference_per
                            .child(int.parse(did.toString()).toString())
                            .child("hours")
                            .set(int.parse(hours.toString()));

                        databaseReference_per
                            .child(int.parse(did.toString()).toString())
                            .child("min")
                            .set(int.parse(minutes.toString()));

                        databaseReference_per
                            .child(int.parse(did.toString()).toString())
                            .child("sec")
                            .set(int.parse(seconds.toString()));

                        // final model = Performance(
                        //     did: int.parse(did.toString()),
                        //     earn: 4857,
                        //     sec: int.parse(seconds.toString()),
                        //     min: int.parse(minutes.toString()),
                        //     hours: int.parse(hours.toString()));
                        // databaseReference_per
                        //     .child(did.toString())
                        //     .set(model.toJson());

                        // final model = Performance(
                        //       time: "bjbjb",);

                        //   databaseReference_per
                        //       .push()
                        //       .set(model.toJson());

                        //                     final model = Performance(time: 45);
                        // databaseReference_per.child("1").set(model.toJson());
                      }

                      print(button_val.toString());
                    });
                  }),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => home()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.input,
                color: Colors.red,
              ),
              title: Text(
                '$hours:$minutes:$seconds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.input,
                color: Colors.red,
              ),
              title: Text("Logout",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              onTap: () {
                if (button_val == true) {
                  stopTimer();
                  timer_set(
                      hours.toString(), minutes.toString(), seconds.toString());
                  active_boy("false");
                  print(seconds.toString());

                          databaseReference_per
                            .child(int.parse(did.toString()).toString())
                            .child("hours")
                            .set(int.parse(hours.toString()));

                        databaseReference_per
                            .child(int.parse(did.toString()).toString())
                            .child("min")
                            .set(int.parse(minutes.toString()));

                        databaseReference_per
                            .child(int.parse(did.toString()).toString())
                            .child("sec")
                            .set(int.parse(seconds.toString()));

                  // final model = Performance(
                  //     did: int.parse(did.toString()),
                  //     earn: 4857,
                  //     sec: int.parse(seconds.toString()),
                  //     min: int.parse(minutes.toString()),
                  //     hours: int.parse(hours.toString()));
                  // databaseReference_per
                  //     .child(did.toString())
                  //     .set(model.toJson());
                }

                _showLogoutConfirmationDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("My Performance",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Graph_display(did: did.toString(),)));
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Eranings",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => refer_earn()));
              },
            ),
    
            ListTile(
              leading: Icon(Icons.sports_motorsports),
              title: Text("Ride Guide",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Feed()));
              },
            ),
            ListTile(
              leading: Icon(Icons.reviews),
              title: Text("Review",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => reviews()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Message Center",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 9, 19))),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => message_center()));
              },
            ),
          ],
        ),
      ),
      body:

// Text("jerry")
          Center(child: mainpage.elementAt(seelectindex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Choose your border color here
              width: 3.0, // Adjust the width of the border
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 255, 254, 253),
          currentIndex: seelectindex,
          onTap: ontap,
          selectedItemColor: Colors.blue, // Color for the selected item
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
        ),
      ),
    );
  }

  void getDataFromFirebase() {
    List<UserModel> listDa1 = [];
    databaseReference.onValue.listen((event) {
      listDa1.clear();
      listData.clear();
      for (final element in event.snapshot.children) {
        UserModel model = UserModel.fromJson(element.value as Map);
        listDa1.add(model);
      }

      setState(() {
        listData.addAll(listDa1);

        print(listData);
      });
    });
  }

  void timer_set(a, b, c) async {
    String time = a.substring(0, 7);
    print(time.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('time', time.toString());

    // await prefs.setString('min', b.toString());
    // await prefs.setString('sec', c.toString());
  }

  void get_boy_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('dname') ?? '';
    did = prefs.getString('did') ?? '';
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Logout',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                 startTimer();
                        active_boy("true");
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 53, 243, 0)),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform logout actions here
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home())); // Dismiss the dialog
              },
              child: Text(
                'Logout',
                style: TextStyle(color: const Color.fromARGB(255, 248, 10, 10)),
              ),
            ),
          ],
        );
      },
    );
  }
}
