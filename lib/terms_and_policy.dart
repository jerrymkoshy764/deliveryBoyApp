import 'package:flutter/material.dart';


class terms_and_policy extends StatefulWidget {
  const terms_and_policy({super.key});

  @override
  State<terms_and_policy> createState() => _terms_and_policyState();
}

class _terms_and_policyState extends State<terms_and_policy> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms of Service & Privacy Policy",
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
          color: Color.fromARGB(255, 132, 135, 132),
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
                            "Terms of Service",
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 6, 6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
 SizedBox(
                          height: 10,
                        ),

                        // Row(
                        //   children: [
                        //     Text(
                        //       "What is Lorem Ipsum?",
                        //       style: TextStyle(
                        //           color: Color.fromARGB(255, 139, 134, 134),
                        //           fontSize: 14.0,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Welcome to Fresh To Table App These Terms of Service  govern your use of our website, mobile application, and services (collectively referred to as the Service. By accessing or using the Service, you agree to be bound by these Terms. Please read them carefully before using the Service.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "1. Use of the Service",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You must be at least 18 years old to use the Service You agree to use the Service only for lawful purposes and in compliance with all applicable laws and regulations. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          //       maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                       Row(
                          children: [
                            Text(
                              "2.Orders and Payments",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "By placing an order through the Service, you agree to pay all fees and charges associated with the order.Prices and availability of products/services are subject to change without notice.We reserve the right to refuse or cancel any order for any reason.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          //       maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),



 SizedBox(
                          height: 10,
                        ),
                       Row(
                          children: [
                            Text(
                              "3.User Content",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You retain ownership of any content you submit or upload to the Service.By submitting content, you grant us a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, adapt, publish, translate, distribute, and display such content.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          //       maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),
 SizedBox(
                          height: 10,
                        ),
 Center(
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 6, 6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
 SizedBox(
                          height: 10,
                        ),
  Text(
                          "Our Privacy Policy outlines how [Delivery App Name] collects, uses, and protects your personal information. By using our Service, you consent to the collection and use of your information as described in this Privacy Policy.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),

 SizedBox(
                          height: 10,
                        ),
 Row(
                          children: [
                            Text(
                              "1.Information We Collect",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We collect information you provide to us when you register an account, place an order, or interact with the Service in any way.This may include your name, email address, phone number, delivery address, payment information, and other relevant details.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          //       maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),


 SizedBox(
                          height: 10,
                        ),
 Row(
                          children: [
                            Text(
                              "2.How We Use Your Information",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We use your information to process orders, provide customer support, improve our services, and communicate with you about promotions and updates.We may also use your information to personalize your experience and deliver targeted advertisements.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          //       maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),


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
}
