import 'dart:async';

import 'package:boy/Forgot_pass_file/forgot_password.dart';
import 'package:boy/Forgot_pass_file/type_password.dart';
import 'package:boy/firebase/usermodal.dart';

import 'package:boy/home/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_boy extends StatefulWidget {
  const splash_boy({super.key});

  @override
  State<splash_boy> createState() => _splash_boyState();
}

class _splash_boyState extends State<splash_boy> {
  // bool _passwordVisible=false;
  List selectvalue = [];

  @override
  void initState() {
    super.initState();
    //  _passwordVisible = false;
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 12, 61, 82),
        child: Image.asset(
          "assets/image/kk.png",
          height: 50,
          width: 100,
        )
        // FlutterLogo(
        //   size: MediaQuery.of(context).size.height,
        // ),
        );
  }
}

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final refs = FirebaseDatabase.instance.ref();

//   void firebase() async {
//     final snapshot =
//         await refs.child('/data_node/delivery_boy/542/password').get();
//     if (snapshot.exists) {
//       // print(snapshot.value);
//     } else {
//       print('No data available.');
//     }
// // final snapshot = await refs.child('users/userId').get();

// // if (snapshot.exists) {
// //     // Retrieve the name and password from the snapshot value
// //     final data = snapshot.value;
// //     final name = data?[name];
// //     final password = data['password'];

// //     // Display the name and password (you can replace this with your actual UI code)
// //     print('Name: $name');
// //     print('Password: $password');
// // } else {
// //     print('No data available.');
// // }
//   }

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('delivery_boy');

  List<UserModel> listData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getDataFromFirebase();

      begin();

      // firebase();
    });
  }

  Future<void> begin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id.text = prefs.getString('re_email') ?? '';
    pass.text = prefs.getString('re_pass') ?? '';
  }

  TextEditingController _passwordController = TextEditingController();

  final user_id = TextEditingController();
  final pass = TextEditingController();

  bool _obscureText = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Splash screen Example"),),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Color.fromARGB(255, 5, 71, 84),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/image/kk.png",
                      width: 170,
                      height: 170,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
              ))
            ],
          ),
          Positioned(
              top: 170,
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 219, 220, 219),
                ),
                // height: 300,
                // width: 300,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: user_id,
                          decoration: InputDecoration(
                            labelText: 'username',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: pass,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 71, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              checkColor: Color.fromARGB(255, 11, 51, 251),
                              activeColor:
                                  const Color.fromARGB(255, 255, 253, 248),
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(151, 0, 0, 0),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      // Text('Your name - ${listData[0].user_id.toString()}'),
                      // Text('Age - ${listData[0].pass.toString()}'),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 35,
                        width: 270,
                        child: ElevatedButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            // final model = UserModel(
                            //     user_nme: user_id.text, pass: pass.text);
                            // databaseReference.child("544").set(model.toJson());
                            // Navigator.of(context).pop();

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => home_page()));
                            //     } else {
                            //       showErrorMessage("Failed");
                            //     }
                            //   }
                            // });

                            setState(() {
                              // getDataFromFirebase();
                              // firebase();

                              // print(listData);

                              // print("hhhh ${listData.length}");
                              var stop = "f";
                              for (int k = 0; k < listData.length; k++) {
                                print(pass.text);
                                print(listData[k].user_nme.toString());

                                if (user_id.text ==
                                        listData[k].user_nme.toString() &&
                                    pass.text == listData[k].pass.toString()) {
                                  boy_data(listData[k].did.toString(),
                                      listData[k].names.toString());
                                  showSuccessMessage("Succes");

                                  if (_rememberMe == true) {
                                    rem_saved();
                                  }
                                  stop = "t";

                                  // Navigator.of(context).pop();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => home_page(

                                              // listData[k].username.toString(),
                                              )));
                                }
                              }
                              if (stop == "f") {
                                showErrorMessage(
                                    "Invalid username or password");
                                print(listData[0].user_nme.toString());
                              }
                            });

                            // print(listData[0].pass.toString());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 5, 71, 84),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: const Color.fromARGB(255, 124, 122, 122),
                        indent: 110,
                        endIndent: 110,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void boy_data(id, name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('did', id);

    await prefs.setString('dname', name);

    await prefs.setString('dname', name);
  }

  void rem_saved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('re_email', user_id.text);

    await prefs.setString('re_pass', pass.text);

    user_id.text = prefs.getString('re_email') ?? '';
    pass.text = prefs.getString('re_pass') ?? '';
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

  void showSuccessMessage(String message) {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context as BuildContext);
  }

  void showErrorMessage(String message) {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context as BuildContext);
  }
}
