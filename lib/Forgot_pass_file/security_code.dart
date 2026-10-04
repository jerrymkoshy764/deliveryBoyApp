import 'package:boy/Forgot_pass_file/change_pass.dart';
import 'package:flutter/material.dart';


class security_code extends StatefulWidget {
  const security_code({super.key});

  @override
  State<security_code> createState() => _security_codeState();
}

class _security_codeState extends State<security_code> {
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
      body: Center(
        child: Column(
          children: [
            // Image.asset(
            //                 "assets/icon/ic_forgot.png",
            //                 width: 170,
            //                 height: 170,
            //               ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Enter Security Code",
              style: TextStyle(
                  color: Color.fromARGB(218, 1, 24, 29),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),

            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Enter the 6 digit security code we just sent you to \n verify your account",
                style: TextStyle(
                    color: Color.fromARGB(178, 1, 24, 29),
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.only(right: 45, left: 45),
              child: TextField(
                maxLines: null, // Set maxLines to null for multiline input
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your code',
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 60), // Adjust vertical padding as needed
                  labelStyle: TextStyle(fontSize: 12.0),
                ),
              ),
            ),

            SizedBox(
              height: 35,
            ),

            SizedBox(
              height: 35,
              width: 290,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Changepass()));
                },
                style: ElevatedButton.styleFrom(
                   backgroundColor: Color.fromARGB(255, 248, 58, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the value as needed
                  ),
                ),
                child: const Text(
                  'RESET PASSWORD',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
