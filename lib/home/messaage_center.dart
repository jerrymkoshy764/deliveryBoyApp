import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class message_center extends StatefulWidget {
  const message_center({super.key});

  @override
  State<message_center> createState() => _message_centerState();
}

class _message_centerState extends State<message_center> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message Center",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 210, 221, 226),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 5),
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                     padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 25),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Welcome to Fresh To Table Message Center",
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 6, 6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
 SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "We're here to ensure your experience with our platform is nothing short of exceptional. Whether you have a question, need assistance, or want to share feedback, our dedicated team is ready to assist you every step of the way.\n\nFrom browsing our extensive selection of fresh fish and meats to tracking your deliveries, we're committed to making your journey with us seamless and enjoyable. So, feel free to reach out to us anytime - we're here to help make your Fresh To Table experience truly unforgettable.\n\nThank you for choosing Fresh To Table - where quality meets convenience!",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),

 Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, bottom: 30, top: 0),
                child: Container(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // update_profile_fun();

                        Call_Dialer();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 47, 109, 202),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Adjust the value as needed
                        ),
                      ),
                      child: const Text(
                        'Call To Shop Center',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ),






                        // Row(
                        //   children: [
                        //     Text(
                        //       "Where does it come from?",
                        //       style: TextStyle(
                        //           color: Color.fromARGB(255, 139, 134, 134),
                        //           fontSize: 14.0,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hamp- den-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorumn The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet., comes from a line in section 1.10.32.",
                        //   style: TextStyle(
                        //       color: Color.fromARGB(255, 139, 134, 134),
                        //       fontSize: 12.0,
                        //       fontWeight: FontWeight.bold),
                        //   //       maxLines: 10,
                        //   // overflow: TextOverflow.clip,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "The standard chunk of Lorem Ipsum used since the 1500s is repro- duced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                        //   style: TextStyle(
                        //       color: Color.fromARGB(255, 139, 134, 134),
                        //       fontSize: 12.0,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(
                          height: 300,
                        )
                      ],
                    ),
                  ),
                ),
              ),
        
              
        // SizedBox(height: 20,)
        
              // SizedBox(
              //         height: 20,
              //       ),
            ],
          ),
        ),
      ),
    );
  }

  Call_Dialer() async {
    var phoneNumber = 'tel:8590293773';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }




}
