import 'package:boy/otp/cuttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _contactEditingController = TextEditingController();

  //callback function of country picker
  // void _callBackFunction(String name, String dialCode, String flag) {
  //   _dialCode = dialCode;
  // }

  //Alert dialogue to show error and response

  //build method for UI Representation
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: screenHeight * 0.05,
                // ),
                Image.asset(
                  'assets/image/kk.png',
                  width: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
                // SizedBox(
                //   height: screenHeight * 0.05,
                // ),
                // Image.asset(
                //   'assets/image/kk.png',
                //   height: screenHeight * 0.3,
                //   fit: BoxFit.contain,
                // ),
                // SizedBox(
                //   height: screenHeight * 0.02,
                // ),
                // const Text(
                //   'Login',
                //   style: TextStyle(fontSize: 28, color: Colors.black),
                // ),
                // SizedBox(
                //   height: screenHeight * 0.02,
                // ),
                const Text(
                  'Enter your registered email id ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth > 600 ? screenWidth * 0.2 : 16),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 7, 68, 114),
                          ),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // CountryPicke(
                            //   callBackFunction: _callBackFunction,
                            //   headerText: 'Select Country',
                            //   headerBackgroundColor:
                            //       Theme.of(context).primaryColor,
                            //   headerTextColor: Colors.white,
                            // ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Email Id',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 13.5),
                                ),
                                controller: _contactEditingController,
                                // keyboardType: TextInputType.number,
                                // inputFormatters: [
                                //   LengthLimitingTextInputFormatter(10)
                                // ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomButton(
                          // clickOnLogin
                          _contactEditingController.text),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
