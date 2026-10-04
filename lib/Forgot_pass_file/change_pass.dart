
import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';


class Changepass extends StatefulWidget {
  const Changepass({super.key});

  @override
  State<Changepass> createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();

  TextEditingController _passwordController3 = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              controller: _passwordController1,
              obscureText: _obscureText1,
              decoration: InputDecoration(
                labelText: 'Old Password',
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText1 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },
                ),
              ),
            ),
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
                // forgot_pass_fun();
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => home()));

//                 if (_passwordController2 != _passwordController3) {

// showErrorMessage("Password Mismatch");
// print(_passwordController2);
// print(_passwordController3);

//                 } else {
//                    forgot_pass_fun();
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => home()));
//                 }
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

//   void forgot_pass_fun() async {

// SharedPreferences prefs = await SharedPreferences.getInstance();
//     var uid = prefs.getString('data') ?? '';

//     final old_pass = _passwordController1.text;
//     final new_pass = _passwordController2.text;
//        final confirm_pass = _passwordController3.text;


// if(confirm_pass==new_pass)
// {

//     const key =
//         "koFCpCMzm8hhn9ULj0BnUzZkpqM3rg9Mqdii3FwPRjBwZFQWriIJYgB5jjOhNIyasSl4RrmCFLW3tHDRtI39viQbYEP7nEkYvba2wstThYWjvkndZq0zaXJaWjuqeZo8vR3MMHa6OhBDKsFPmWOlIM4H1TgB1fudQndGKzUPg8YhAoaAoCxZ562zjbQdPO73ZkwyPV7iOIkyH11ZLAN42a5dgLH22Rs1VasEWBKdfkqMLPfDbLQpF9Ofqah4fqwc";
//     final formdata = FormData.fromMap({
//       'user_id': uid,
//       'old_password': old_pass,
//       'new_password': new_pass,
//       'key': key
//     });
//     final result = await ApiClass().forgot_pass_api(formdata);
//     // print("$id");
//     if (result != null) {
//       if (result.status == "success") {
//         showSuccessMessage(result.message!);

//         // if (result.data != null) {
//         // saveval2(result.data!.categories!);
// // productNotifier.value.clear();
// //           productNotifier.value.addAll(result.data!);

// //           // showSuccessmessage();
// //           print("*****product*****$productNotifier");
// //              print(widget.cat_val);
//         // }
//       } else {
//         showErrorMessage(result.message!);
//       }
//     }
// }

// else{

//   showErrorMessage("New Password is  Mismatched");
// }




//   }
}
