
// class UserModel {
//   String? user_nme;
//   String? pass;
//   String? did;
//   String? names;
//   String? mob;
//   String? city;
//   String? addrs;
//   String? pincode;

//   UserModel(
//       {this.user_nme,
//       this.pass,
//       this.did,
//       this.names,
//       this.addrs,
//       this.city,
//       this.mob,
//       this.pincode});

//   UserModel.fromJson(Map<dynamic, dynamic> json) {
//     user_nme = json['username'];
//     pass = json['password'];
//     names = json['name'];
//     did = json['did'];
//     mob = json['mob'];
//     city = json['city'];
//     addrs = json['address'];
//     pincode = json['pincode'];
//   }

//   Map<String, dynamic> toJson() => {
//         'username': user_nme,
//         'password': pass,
//         'name': names,
//         'did': did,
//         'mob': mob,
//         'city': city,
//         'address': addrs,
//         'pincode': pincode
//       };
// }



// import 'package:boy/firebase/usermodal.dart';

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// import 'package:motion_toast/motion_toast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class editprofile extends StatefulWidget {
//   const editprofile({super.key});

//   @override
//   State<editprofile> createState() => _editprofileState();
// }

// // ValueNotifier<List<BillingAddress>> profileNotifier = ValueNotifier([]);
// // ValueNotifier<List<BillingAddress>> billing_address_Notifier =
// //     ValueNotifier([]);

// class _editprofileState extends State<editprofile> {
//   String? pass;
//   String? did_id;

//   DatabaseReference databaseReference =
//       FirebaseDatabase.instance.ref().child('data_node').child('delivery_boy');

//   List<UserModel> listData = [];
//   var _name = TextEditingController();
//   var _mobile = TextEditingController();
//   var _email = TextEditingController();
//   var _city = TextEditingController();

//   var _addrs1 = TextEditingController();

//   var _pincode = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDataFromFirebase();
//     print("gggggg"+pass.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Edit Profile",
//           style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
//         ),
//         backgroundColor: Color.fromARGB(255, 5, 71, 84),
//         iconTheme: IconThemeData(
//           color:
//               const Color.fromARGB(255, 255, 255, 255), //change your color here
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Color.fromARGB(255, 132, 135, 132),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 10, right: 10, top: 10, bottom: 5),
//                 child: Container(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 15, right: 15, top: 5),
//                         child: TextField(
//                           controller: _name,
//                           decoration: InputDecoration(
//                             suffixText: '*',
//                             suffixStyle: TextStyle(
//                               color: Colors.red,
//                             ),

//                             labelText: 'Name *',
//                             labelStyle: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.bold),
//                             // hintText: 'Entetr your name'
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                         ),
//                         child: TextField(
//                           controller: _mobile,
//                           decoration: InputDecoration(
//                             suffixText: '*',
//                             suffixStyle: TextStyle(
//                               color: Colors.red,
//                             ),
//                             labelText: 'Mobile *',
//                             labelStyle: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.bold),
//                             // hintText: 'Entetr your name'
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                         ),
//                         child: TextField(
//                           controller: _email,
//                           decoration: InputDecoration(
//                             suffixText: '*',
//                             suffixStyle: TextStyle(
//                               color: Colors.red,
//                             ),
//                             labelText: 'Email *',
//                             labelStyle: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.bold),
//                             // hintText: 'Entetr your name'
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 10, right: 10, top: 10, bottom: 5),
//                 child: Container(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 15, right: 15, top: 5),
//                         child: TextField(
//                           controller: _city,
//                           decoration: InputDecoration(
//                             suffixText: '*',
//                             suffixStyle: TextStyle(
//                               color: Colors.red,
//                             ),

//                             labelText: 'City *',
//                             labelStyle: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.bold),
//                             // hintText: 'Entetr your name'
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                         ),
//                         child: TextField(
//                           controller: _addrs1,
//                           decoration: InputDecoration(
//                             suffixText: '*',
//                             suffixStyle: TextStyle(
//                               color: Colors.red,
//                             ),
//                             labelText: 'Locality,area or street *',
//                             labelStyle: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.bold),
//                             // hintText: 'Entetr your name'
//                           ),
//                         ),
//                       ),
              
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                         ),
//                         child: TextField(
//                           controller: _pincode,
//                           decoration: InputDecoration(
//                             suffixText: '*',
//                             suffixStyle: TextStyle(
//                               color: Colors.red,
//                             ),
//                             labelText: 'Pincode *',
//                             labelStyle: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.bold),
//                             // hintText: 'Entetr your name'
//                           ),
//                         ),
//                       ),
                    
//                       SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 10, right: 10, bottom: 30, top: 0),
//                 child: Container(
//                   child: SizedBox(
//                     height: 35,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         final model = UserModel(
//                             did: did_id,
//                             pass: pass,
//                             names: _name.text,
//                             mob: _mobile.text,
//                             user_nme: _email.text,
//                             city: _city.text,
//                             addrs: _addrs1.text,
//                             pincode: _pincode.text);
//                         databaseReference
//                             .child("444")
//                             .set(model.toJson());
//                         // databaseReference.child("545").child("password").set(_city.text);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color.fromARGB(255, 5, 71, 84),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                               0), // Adjust the value as needed
//                         ),
//                       ),
//                       child: const Text(
//                         'UPDATE',
//                         style: TextStyle(color: Colors.white, fontSize: 12.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               Container(
//                 height: 100,
//                 color: Color.fromARGB(255, 132, 135, 132),
//               )

// // SizedBox(height: 20,)

//               // SizedBox(
//               //         height: 20,
//               //       ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showSuccessMessage(String message) {
//     MotionToast.success(
//       title: const Text(
//         'Success',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       description: Text(message),
//       position: MotionToastPosition.top,
//       barrierColor: Colors.black.withOpacity(0.3),
//       width: 300,
//       height: 80,
//       dismissable: false,
//     ).show(context as BuildContext);
//   }

//   void showErrorMessage(String message) {
//     MotionToast.error(
//       title: const Text(
//         'Error',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       description: Text(message),
//       position: MotionToastPosition.top,
//       barrierColor: Colors.black.withOpacity(0.3),
//       width: 300,
//       height: 80,
//       dismissable: false,
//     ).show(context as BuildContext);
//   }

// //   Future<void> getDataFromFirebase() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     did_id = prefs.getString('did') ?? '';
// //     var did = prefs.getString('did') ?? '';

// //     List<UserModel> listDa1 = [];
// //     databaseReference.onValue.listen((event) {
// //       listDa1.clear();
// //       listData.clear();
// //       for (final element in event.snapshot.children) {
// //         UserModel model = UserModel.fromJson(element.value as Map);
// //         listDa1.add(model);
// //       }

// //       setState(() {
// //         listData.addAll(listDa1);
// // print("gggggggggggggg");


// //         for (int k = 0; k < listData.length; k++) {
// // // prefs.getString('did') ?? '';
// //           if (listData[k].did.toString() == did) {
// //             print(listData[k].user_nme.toString());
// //             _name.text = listData[k].names.toString();
// //             _email.text = listData[k].user_nme.toString();
// //             pass = listData[k].pass.toString();
// //             _addrs1.text = listData[k].addrs.toString();
// //             _mobile.text = listData[k].mob.toString();
// //             _pincode.text = listData[k].pincode.toString();
// //             _city.text = listData[k].city.toString();
// //           }
// //         }
// //       });
// //     });
// //   }

//   void getDataFromFirebase() {
//     List<UserModel> listDa1 = [];
//     databaseReference.onValue.listen((event) {
//       listDa1.clear();
//       listData.clear();
//       for (final element in event.snapshot.children) {
//         UserModel model = UserModel.fromJson(element.value as Map);
//         listDa1.add(model);
//       }

//       setState(() {
//         listData.addAll(listDa1);
//         print(listData);
//       });
//     });
//   }







// }
