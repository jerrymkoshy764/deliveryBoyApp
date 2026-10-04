import 'package:boy/Modals/get_order_details_modal.dart';
import 'package:boy/Order_Process/Cutomer_Delivery.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class shop_pick_up extends StatefulWidget {
  String? order_id;

  shop_pick_up({super.key, required this.order_id});

  @override
  State<shop_pick_up> createState() => _shop_pick_upState();
}

ValueNotifier<List<get_order_detailss>> get_order_details__Notifier =
    ValueNotifier([]);

class _shop_pick_upState extends State<shop_pick_up> {
  DatabaseReference databaseReference_orders =
      FirebaseDatabase.instance.ref().child('data_node').child('orders');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop Pick Up ",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 10, bottom: 10),
          child: Column(
            children: [
              InkWell(
                onTap: openGoogleMaps,
                child: Container(
                  color: Color.fromARGB(255, 214, 219, 214),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 0, right: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.store,
                              size: 50,
                              color: Color.fromARGB(255, 249, 188, 3),
                            ),
                            Text(
                              "Shop Location",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.assistant_direction,
                              size: 45,
                              color: Color.fromARGB(255, 21, 142, 247),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 50, right: 5, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                " Fresh To Table Shop\n Inchakalodil \n Perissery P O\n Chengannur\n 689126 ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 30, top: 0),
                child: Container(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showOrderConfirmationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 27, 198, 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Adjust the value as needed
                        ),
                      ),
                      child: const Text(
                        'PICK UP FROM SHOP',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
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

  void openGoogleMaps() async {
    // Replace latitude and longitude with the location you want to display
    double latitude = 10.081225;

    double longitude = 76.272894;

    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch Google Maps.';
    }
  }

  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Order Pick Up',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          content: Text(
              'Are you sure you want to Confirm the order pick from shop?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 53, 243, 0)),
              ),
            ),
            TextButton(
              onPressed: () {
//  databaseReference_orders.child(widget.order_id.toString()).child("order_id").set(widget.order_id);
//   databaseReference_orders.child(widget.order_id).child("boy_id").set(did);
                databaseReference_orders
                    .child(widget.order_id.toString())
                    .child("status")
                    .set("Shop Pick Up");

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customer_delivery(
                              order_id: widget.order_id,
                            )));
              },
              child: Text(
                'Confirm Order Pick Up',
                style: TextStyle(color: const Color.fromARGB(255, 248, 10, 10)),
              ),
            ),
          ],
        );
      },
    );
  }
}
