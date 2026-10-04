import 'package:flutter/material.dart';



class aboutcompany extends StatefulWidget {
  const aboutcompany({super.key});

  @override
  State<aboutcompany> createState() => _aboutcompanyState();
}

class _aboutcompanyState extends State<aboutcompany> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Company",
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
                            "About of Fresh To Table",
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
                          "\tFresh To Table is more than just an online marketplace for fish and meat products; it's a culinary destination dedicated to bringing the freshest and highest-quality ingredients directly to customers' doorsteps. Our passion for food and technology drives us to innovate and redefine the way people shop for seafood and meats. \n\n\tAt Fresh To Table, we believe in transparency, sustainability, and convenience. We source our products from trusted suppliers who adhere to the highest standards of quality and ethical practices. Our commitment to sustainability extends to our packaging and delivery methods, ensuring minimal environmental impact. \n\n\tWe understand that today's busy lifestyles demand convenience without compromising on quality. That's why we've developed an intuitive and user-friendly platform that allows customers to browse, select, and order their favorite seafood and meats with just a few taps. Our seamless ordering and delivery process ensures that customers receive their orders fresh and on time, every time. \n\n\tBeyond just providing a convenient shopping experience, we aim to inspire and educate our customers about the culinary world. From sharing mouthwatering recipes to providing cooking tips and recommendations, we're here to help customers unleash their inner chef and create unforgettable dining experiences. \n\n\tFresh To Table is more than just a marketplace; it's a community of food lovers, chefs, and artisans who share a passion for great-tasting, responsibly sourced ingredients. Join us on our journey to elevate the way people eat and experience seafood and meats. Welcome to Fresh To Table, where freshness meets convenience, and quality is always on the menu.",
                           style: TextStyle(
                              color: Color.fromARGB(255, 102, 100, 100),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
               
                       
                      ],
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
}
