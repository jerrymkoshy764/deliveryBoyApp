import 'package:boy/Forgot_pass_file/type_password.dart';
import 'package:boy/firebase/usermodal.dart';
import 'package:boy/home/splash_boy.dart';
import 'package:boy/otp/login.dart';
import 'package:boy/otp/otpscrren.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class forgot_pass extends StatefulWidget {
  const forgot_pass({super.key});

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('delivery_boy');

  List<UserModel> listData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromFirebase();
  }

  var _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/image/password.jpg",
                width: 190,
                height: 190,
              ),
              Text(
                "Forgot Password ?",
                style: TextStyle(
                    color: Color.fromARGB(144, 1, 24, 29),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We will send you instructions to reset your password",
                style: TextStyle(
                    color: Color.fromARGB(201, 1, 24, 29),
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.email_outlined), //if click we get the icon
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                    // hintText: 'Entetr your name'
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
                    checking();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => type_password(
                    //               email: _email.text,
                    //             )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 58, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          0), // Adjust the value as needed
                    ),
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checking() {
    var stop = "f";
    for (int k = 0; k < listData.length; k++) {
      // print(pass.text);
      print(listData[k].user_nme.toString());

      if (_email.text == listData[k].user_nme.toString()) {
        // boy_data(listData[k].did.toString(), listData[k].names.toString());
        showErrorMessage("success");
        stop = "t";

        // Navigator.of(context).pop();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyApp(

                    // listData[k].username.toString(),
                    )));
      }
    }
    if (stop == "f") {
      showErrorMessage("Invalid username or password");
      // print(listData[0].user_nme.toString());
    }
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter OTP Authentication',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 253, 188, 51),
      ),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/otpScreen': (BuildContext ctx) => OtpScreen(),
        '/homeScreen': (BuildContext ctx) => type_password(),
      },
    );
  }
}
