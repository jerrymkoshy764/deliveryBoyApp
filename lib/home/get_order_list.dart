import 'package:boy/Modals/get_order_details_modal.dart';
import 'package:boy/Modals/get_order_modal.dart';
import 'package:boy/Order_Process/Cutomer_Delivery.dart';
import 'package:boy/Order_Process/shop_pick_up.dart';
import 'package:boy/Order_Process/view_order_data.dart';
import 'package:boy/apiandurl/api.dart';
import 'package:boy/firebase/usermodal.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class order_list extends StatefulWidget {
  order_list({super.key});

  @override
  State<order_list> createState() => _order_listState();
}

ValueNotifier<List<get_orders>> get_order_Notifier = ValueNotifier([]);
ValueNotifier<List<Products>> boy_Notifier = ValueNotifier([]);

class _order_listState extends State<order_list> {
  DatabaseReference databaseReference_orders =
      FirebaseDatabase.instance.ref().child('data_node').child('orders');

  List<Orders_modal> listData = [];
  List orders_id_list = [];
  List Boy_order_id = [];
  List Shop_pickup_order_id = [];

  String? active;
  String active1 = 'dff';

  void load_active() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      active = prefs.getString('active') ?? '';

//  active = "true";
      print("*******$active");
    });
  }

  String button = "Delete";
  String? status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      load_active();
      get_order_fun();

      getDataFromFirebase();
      print("goooooo" + active.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 209, 208, 208),
      child: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: get_order_Notifier,
              builder: (context, List<get_orders> newproduct, child) {
                List<Widget> items = [];

                for (int index = 0; index < newproduct.length; index++) {
                  final product = newproduct[index];
                  // print(product.status.toString() + "+" + product.orderId.toString());

                  if (orders_id_list.contains(product.orderId) &&
                      !Shop_pickup_order_id.contains(product.orderId)) {
                    status = "Processing";

                    if (active == "true" &&
                        !Boy_order_id.contains(product.orderId)) {
                      items.add(
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Container(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            product.image.toString(),
                                            // "assets/image/boy.png",
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    // Text(Listsample[index]),
                                    Expanded(
                                      child: Container(
                                        // width: double.infinity,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.producName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  status.toString(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 213, 10),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.timeSlot.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 89, 90, 89),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 124, 122, 122),
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order ID: ${product.orderId.toString()}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 3, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 115, 227, 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          shop_pick_up(
                                                            order_id: product
                                                                .orderId
                                                                .toString(),
                                                          )));
                                            });
                                          },
                                          child: Text(
                                            "Processing",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  } else if (Shop_pickup_order_id.contains(product.orderId)) {
                    status = "Shop Pick Up";

                    if (active == "true" &&
                        !Boy_order_id.contains(product.orderId)) {
                      items.add(
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Container(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            product.image.toString(),
                                            // "assets/image/boy.png",
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    // Text(Listsample[index]),
                                    Expanded(
                                      child: Container(
                                        // width: double.infinity,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.producName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  status.toString(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 213, 10),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.timeSlot.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 89, 90, 89),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 124, 122, 122),
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order ID: ${product.orderId.toString()}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 3, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 6, 138, 232),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          customer_delivery(
                                                            order_id: product
                                                                .orderId
                                                                .toString(),
                                                          )));
                                            });
                                          },
                                          child: Text(
                                            "Shop Pick Up",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    status = "Pending";

                    if (active == "true" &&
                        !Boy_order_id.contains(product.orderId)) {
                      items.add(
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Container(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            product.image.toString(),
                                            // "assets/image/boy.png",
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    // Text(Listsample[index]),
                                    Expanded(
                                      child: Container(
                                        // width: double.infinity,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.producName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  status.toString(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 213, 10),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.timeSlot.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 89, 90, 89),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 124, 122, 122),
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order ID: ${product.orderId.toString()}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 3, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 237, 182, 4),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              print(status.toString() +
                                                  "+" +
                                                  product.orderId.toString());

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          view_order_data(
                                                            order_id: product
                                                                .orderId
                                                                .toString(),
                                                          )));
                                            });
                                          },
                                          child: Text(
                                            "Review Order",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                }

                if (active == "false" || active == "null") {
                  items.add(Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Image.asset(
                        "assets/image/image.png",
                        height: 500,
                      )));
                }
                // }

                // }

                return Container(
                  color: Color.fromARGB(255, 209, 208, 208),
                  child: SingleChildScrollView(
                    child: Column(
                      children: items,
                    ),
                  ),
                );
                // },
                // );
              },
            ),
          ),
        ],
      ),
    ));
  }

  void get_order_fun() async {
    List user_id = ["649", "658"];
    get_order_Notifier.value.clear();
    for (int i = 0; i < user_id.length; i++) {
      final cid = user_id[i];
      // final cid = "649";

      const key =
          "koFCpCMzm8hhn9ULj0BnUzZkpqM3rg9Mqdii3FwPRjBwZFQWriIJYgB5jjOhNIyasSl4RrmCFLW3tHDRtI39viQbYEP7nEkYvba2wstThYWjvkndZq0zaXJaWjuqeZo8vR3MMHa6OhBDKsFPmWOlIM4H1TgB1fudQndGKzUPg8YhAoaAoCxZ562zjbQdPO73ZkwyPV7iOIkyH11ZLAN42a5dgLH22Rs1VasEWBKdfkqMLPfDbLQpF9Ofqah4fqwc";
      final formdata = FormData.fromMap({'user_id': cid, 'key': key});
      final result = await ApiClass().get_order_api(formdata);
      // print("$id");
      if (result != null) {
        if (result.status == "success") {
          if (result.data != null) {
            setState(() {
              get_order_Notifier.value.addAll(result.data!);
            });
          } else {
            print(result.status);
          }
        }
      }
    }
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

  Future<void> getDataFromFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final did = prefs.getString('did') ?? '';

    List<Orders_modal> listDa1 = [];
    databaseReference_orders.onValue.listen((event) {
      listDa1.clear();
      listData.clear();
      for (final element in event.snapshot.children) {
        Orders_modal model = Orders_modal.fromJson(element.value as Map);
        listDa1.add(model);
      }

      setState(() {
        listData.addAll(listDa1);
        Boy_order_id.clear();
        print("fassssst" + did.toString());

        for (int k = 0; k < listData.length; k++) {
          orders_id_list.add(listData[k].order_id);
          if (did != listData[k].boy_id ||
              "Order Placed" == listData[k].status) {
            Boy_order_id.add(listData[k].order_id);
          }

          if ("Shop Pick Up" == listData[k].status) {
            Shop_pickup_order_id.add(listData[k].order_id);
          }
        }
        print("gghhhhggg" + Shop_pickup_order_id.toString());
      });
    });
  }
}
