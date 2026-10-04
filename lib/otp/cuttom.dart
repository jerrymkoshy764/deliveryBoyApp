import 'package:boy/firebase/usermodal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomButton extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  // final clickOnLogin;
  final String email;

  // ignore: sort_constructors_first
  const CustomButton(
      // this.clickOnLogin,
      this.email);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  String? id_for_boy;
  //  var _contactEditingController = TextEditingController();
  String? num;

  var _dialCode = '+91';

  //Login click with contact number validation
  Future<void> clickOnLogin() async {
    if (num!.isEmpty) {
      showErrorDialog(context, 'Contact number can\'t be empty.');
    } else {
      final responseMessage = await Navigator.pushNamed(context, '/otpScreen',
          arguments: '$_dialCode${num.toString()}');
      if (responseMessage != null) {
        showErrorDialog(context, responseMessage as String);
      }
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('delivery_boy');

  List<UserModel> listData = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checking();

        // widget.clickOnLogin(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 13, 90, 161),
          borderRadius: BorderRadius.circular(36),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Send OTP',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 16.0),
        ),
      ),
    );
  }

  void checking() {
    String g = widget.email.toString();
    var stop = "f";
    for (int k = 0; k < listData.length; k++) {
      // print(pass.text);
      print(listData[k].user_nme.toString());

      if (g == listData[k].user_nme.toString()) {
        // boy_data(listData[k].did.toString(), listData[k].names.toString());

        stop = "t";
        num = listData[k].mob.toString();
        // showErrorMessage(num.toString()); 
        id_for_boy = listData[k].did.toString();
        rem_saved();
        clickOnLogin();

        // _contactEditingController="8590293773" as TextEditingController;
        // Navigator.of(context).pop();

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => (

        //             // listData[k].username.toString(),
        //             )));
      }
    }
    if (stop == "f") {
      showErrorMessage("invalid email");
      // print(listData[0].user_nme.toString());
    }
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

  void rem_saved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id_for_boy', id_for_boy.toString());
  }
}
