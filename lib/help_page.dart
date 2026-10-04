import 'package:flutter/material.dart';

class help_page extends StatefulWidget {
  const help_page({super.key});

  @override
  State<help_page> createState() => _help_pageState();
}

class _help_pageState extends State<help_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help Page",
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
                            "Help Centre",
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
                          "We're dedicated to making your experience with our delivery app as seamless as possible. Whether you're a new user or a seasoned pro, this help page aims to provide you with comprehensive assistance. Below, you'll find detailed guidance on various aspects of our app, including placing orders, tracking deliveries, managing your account, and troubleshooting common issues. If you can't find the answers you're looking for here, don't hesitate to reach out to our support team for further assistance. Let's make your delivery experience exceptional!",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 15,
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
                          height: 20,
                        ),

                        Container( height: 400,
  color:Color.fromARGB(255, 255, 255, 255) ,
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
}
