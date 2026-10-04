import 'package:boy/Modals/get_order_details_modal.dart';
import 'package:boy/apiandurl/api.dart';
import 'package:boy/firebase/usermodal.dart';
import 'package:boy/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class customer_delivery extends StatefulWidget {
  String? order_id;

  customer_delivery({super.key, required this.order_id});

  @override
  State<customer_delivery> createState() => _customer_deliveryState();
}

ValueNotifier<List<Products>> get_order_details__Notifier = ValueNotifier([]);

class _customer_deliveryState extends State<customer_delivery> {
  List<Performance> listData = [];
  String? did;
  String? Floating_cash;
  String? order_count;

  DatabaseReference databaseReference_orders =
      FirebaseDatabase.instance.ref().child('data_node').child('orders');

  DatabaseReference databaseReference_per =
      FirebaseDatabase.instance.ref().child('data_node').child('performance');

  @override
  void initState() {
    print("order id thisssssssss" + widget.order_id.toString());
    // TODO: implement initState
    super.initState();
    get_boy_data();
    getDataFromFirebase_get_cash();
    get_delivery_addrs_fun();
  }

  String? name, addres1, address2, place, city, pincode, mobileNumber, payment;

  String? order_pro_id, pro_name, Quantity, Price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Place Details",
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
                                " $name\n $addres1 \n $address2\n $city\n $pincode\n$mobileNumber ",
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
                height: 10,
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
                        'Call To Customer',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0,
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
                                " Order Id: $order_pro_id\n Product Name: $pro_name\n Quantity: $Quantity\n Price: $Price\n Payment Method:$payment  ",
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
                        'ORDER PLACED',
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

  Call_Dialer() async {
    var phoneNumber = 'tel:$mobileNumber';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void openGoogleMaps() async {
    // Replace latitude and longitude with the location you want to display
    double latitude = 10.000861;

    double longitude = 76.301370;

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
    var uid = prefs.getString('data') ?? '';

    const key =
        "koFCpCMzm8hhn9ULj0BnUzZkpqM3rg9Mqdii3FwPRjBwZFQWriIJYgB5jjOhNIyasSl4RrmCFLW3tHDRtI39viQbYEP7nEkYvba2wstThYWjvkndZq0zaXJaWjuqeZo8vR3MMHa6OhBDKsFPmWOlIM4H1TgB1fudQndGKzUPg8YhAoaAoCxZ562zjbQdPO73ZkwyPV7iOIkyH11ZLAN42a5dgLH22Rs1VasEWBKdfkqMLPfDbLQpF9Ofqah4fqwc";
    final formdata = FormData.fromMap(
        {'user_id': "658", 'order_id': widget.order_id, 'key': key});
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
            mobileNumber = result.data!.telephone;
            payment = result.data!.paymentMethod;

//product details********************

            order_pro_id = get_order_details__Notifier.value[0].orderId;
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
            'Confirm Order Placed',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          content: Text('Are you sure you want to Confirm the order placed?'),
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
                // final sum = double.parse(Floating_cash.toString()) + double.parse(Price.toString());

                final sum = double.parse(Floating_cash.toString()) +
                    double.parse(Price.toString());

// Example value, replace it with your actual value

final num = "1";
double Order_sum = double.parse(order_count.toString()) + double.parse(num);


              

                print("summmmmm" + Order_sum.toString());

                databaseReference_orders
                    .child(widget.order_id.toString())
                    .child("status")
                    .set("Order Placed");

                if (payment == "online") {
                  databaseReference_orders
                      .child(widget.order_id.toString())
                      .child("Payment")
                      .set("Online Payment");
                } else {
                  databaseReference_orders
                      .child(widget.order_id.toString())
                      .child("Payment")
                      .set("Cash on Delivery");

                  databaseReference_per
                      .child(did.toString())
                      .child("floating_cash")
                      .set(sum);
                }

                databaseReference_per
                    .child(did.toString())
                    .child("order_count")
                    .set(Order_sum);

                showSuccessMessage("Successfully Order Placed");

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => home_page()));
              },
              child: Text(
                'Confirm Order Placed',
                style: TextStyle(color: const Color.fromARGB(255, 248, 10, 10)),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSuccessMessage(String message) {
    MotionToast.success(
      title: const Text(
        'Success',
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

  void getDataFromFirebase_get_cash() {
    List<Performance> listDa1 = [];
    databaseReference_per.onValue.listen((event) {
      listDa1.clear();
      listData.clear();
      for (final element in event.snapshot.children) {
        Performance model = Performance.fromJson(element.value as Map);
        listDa1.add(model);
      }

      setState(() {
        listData.addAll(listDa1);

        for (int k = 0; k < listData.length; k++) {
          if (did == listData[k].did.toString()) {
            Floating_cash = listData[k].Float_cash.toString();
            order_count = listData[k].order_count.toString();
            // print("cashssss" + order_count.toString());
          }
        }

        // print(listData);

        // print(listData[0].earn.toString());
      });
    });
  }

  void get_boy_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    did = prefs.getString('did') ?? '';
  }
}
