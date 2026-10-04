import 'package:boy/Modals/get_order_details_modal.dart';
import 'package:boy/Order_Process/shop_pick_up.dart';
import 'package:boy/apiandurl/api.dart';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class view_order_data extends StatefulWidget {
  String order_id;
  view_order_data({super.key, required this.order_id});

  @override
  State<view_order_data> createState() => _view_order_dataState();
}

ValueNotifier<List<Products>> get_order_details__Notifier = ValueNotifier([]);

class _view_order_dataState extends State<view_order_data> {
  String? did;

  DatabaseReference databaseReference_orders =
      FirebaseDatabase.instance.ref().child('data_node').child('orders');

  String? name, addres1, address2, place, city, pincode, long, lati;

  String? order_pro_id, pro_name, Quantity, Price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_delivery_addrs_fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
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
                              Icons.person_pin_circle,
                              size: 50,
                              color: Color.fromARGB(255, 249, 188, 3),
                            ),
                            Text(
                              "Delivery Location",
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
                                " $name\n $addres1 \n $address2\n $city\n $pincode ",
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
              Container(
                color: Color.fromARGB(255, 214, 219, 214),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 0, right: 10, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.restaurant_menu,
                            size: 40,
                            color: Color.fromARGB(255, 247, 179, 21),
                          ),
                          Text(
                            "Product details",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 50, right: 5, bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                " Order Id: $order_pro_id\n Product Name: $pro_name\n Quantity: $Quantity\n Price: $Price\n  ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                        'CONFIRM ORDER',
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
    String latitude = lati.toString();

    String longitude = long.toString();

    print(longitude);

    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch Google Maps.';
    }
  }

  void get_delivery_addrs_fun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    did = prefs.getString('did') ?? '';

    var uid = prefs.getString('data') ?? '';
    print(widget.order_id);

    const key =
        "koFCpCMzm8hhn9ULj0BnUzZkpqM3rg9Mqdii3FwPRjBwZFQWriIJYgB5jjOhNIyasSl4RrmCFLW3tHDRtI39viQbYEP7nEkYvba2wstThYWjvkndZq0zaXJaWjuqeZo8vR3MMHa6OhBDKsFPmWOlIM4H1TgB1fudQndGKzUPg8YhAoaAoCxZ562zjbQdPO73ZkwyPV7iOIkyH11ZLAN42a5dgLH22Rs1VasEWBKdfkqMLPfDbLQpF9Ofqah4fqwc";
    final formdata = FormData.fromMap(
        {'user_id': "649", 'order_id': widget.order_id, 'key': key});
    final result = await ApiClass().get_order_details_api(formdata);
    // print("$id");
    if (result != null) {
      if (result.status == "success") {
        if (result.data != null) {
          setState(() {
            print(result.status);
            get_order_details__Notifier.value.clear();
            get_order_details__Notifier.value.addAll(result.data!.products!);

            print("****product*****$get_order_details__Notifier");
            print(
                "****product*****${get_order_details__Notifier.value[0].orderProductId}");

//user details*********************
            name = result.data!.customerName;
            addres1 = result.data!.address1;
            address2 = result.data!.address2;

            city = result.data!.city;
            pincode = result.data!.postcode;
            lati = result.data!.latitude;
            long = result.data!.longitude;

//product details********************
            order_pro_id = get_order_details__Notifier.value[0].orderProductId;
            pro_name = get_order_details__Notifier.value[0].name;
            Quantity = get_order_details__Notifier.value[0].quantity;
            Price = get_order_details__Notifier.value[0].price;
          });
        }
      } else {
        print(result.status);
      }
    }
  }

  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Order',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          content: Text('Are you sure you want to Confirm the order?'),
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
                databaseReference_orders
                    .child(widget.order_id)
                    .child("order_id")
                    .set(widget.order_id);
                databaseReference_orders
                    .child(widget.order_id)
                    .child("boy_id")
                    .set(did);
                databaseReference_orders
                    .child(widget.order_id)
                    .child("status")
                    .set("Processing");

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => shop_pick_up(
                              order_id: widget.order_id,
                            )));
              },
              child: Text(
                'Confirm Order',
                style: TextStyle(color: const Color.fromARGB(255, 248, 10, 10)),
              ),
            ),
          ],
        );
      },
    );
  }
}
