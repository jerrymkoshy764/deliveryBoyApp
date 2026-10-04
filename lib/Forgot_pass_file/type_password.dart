import 'package:boy/home/splash_boy.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class type_password extends StatefulWidget {
  // String email;
  type_password({
    super.key,
    // required this.email
  });

  @override
  State<type_password> createState() => _type_passwordState();
}

class _type_passwordState extends State<type_password> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('delivery_boy');
  String? id_for_boy;
  TextEditingController _passwordController2 = TextEditingController();

  TextEditingController _passwordController3 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rem_saved();
  }

  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              controller: _passwordController2,
              obscureText: _obscureText2,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText2 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              controller: _passwordController3,
              obscureText: _obscureText3,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText3 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText3 = !_obscureText3;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 35,
            width: 290,
            child: ElevatedButton(
              onPressed: () {
                if (_passwordController2.text == _passwordController3.text) {
                  databaseReference
                      .child(id_for_boy.toString())
                      .child("password")
                      .set(_passwordController2.text);
                  showSuccessMessage("Your password is Changed");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  showErrorMessage("New Password is  Mismatched");
                }

                // forgot_pass_fun();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 248, 58, 0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(0), // Adjust the value as needed
                ),
              ),
              child: const Text(
                'SAVE PASSWORD',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
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

  void rem_saved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    id_for_boy = prefs.getString('id_for_boy') ?? '';
  }

  // void forgot_pass_fun() async {
  //   final new_pass = _passwordController2.text;
  //   final confirm_pass = _passwordController3.text;

  //   if (confirm_pass == new_pass) {
  //     print(widget.email);

  //     const key =
  //         "koFCpCMzm8hhn9ULj0BnUzZkpqM3rg9Mqdii3FwPRjBwZFQWriIJYgB5jjOhNIyasSl4RrmCFLW3tHDRtI39viQbYEP7nEkYvba2wstThYWjvkndZq0zaXJaWjuqeZo8vR3MMHa6OhBDKsFPmWOlIM4H1TgB1fudQndGKzUPg8YhAoaAoCxZ562zjbQdPO73ZkwyPV7iOIkyH11ZLAN42a5dgLH22Rs1VasEWBKdfkqMLPfDbLQpF9Ofqah4fqwc";
  //     final formdata = FormData.fromMap(
  //         {'email': widget.email, 'password': new_pass, 'key': key});
  //     final result = await ApiClass().type_password_api(formdata);
  //     // print("$id");
  //     if (result != null) {
  //       if (result.status == "success") {
  //         showSuccessMessage(result.message!);

  //         Timer(
  //             Duration(seconds: 4),
  //             () => Navigator.push(
  //                 context, MaterialPageRoute(builder: (context) => Home())));

  //         // }
  //       } else {
  //         showErrorMessage(result.message!);
  //       }
  //     }
  //   } else {
  //     showErrorMessage("New Password is  Mismatched");
  //   }
  // }
}
