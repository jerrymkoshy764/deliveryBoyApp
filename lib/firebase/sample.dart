// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class MyWidget extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder(
// //       stream: FirebaseFirestore.instance.collection('your_collection').snapshots(),
// //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //         if (!snapshot.hasData) {
// //           return CircularProgressIndicator(); // or other loading indicator
// //         }
// //         return ListView(
// //           children: snapshot.data.docs.map((DocumentSnapshot document) {
// //             Map<String, dynamic> data = document.data()!;
// //             return ListTile(
// //               title: Text(data['your_field']),
// //               // Other widgets to display data
// //             );
// //           }).toList(),
// //         );
// //       },
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class FirebaseDataPrinter extends StatefulWidget {
//   @override
//   _FirebaseDataPrinterState createState() => _FirebaseDataPrinterState();
// }

// class _FirebaseDataPrinterState extends State<FirebaseDataPrinter> {
//   final DatabaseReference databaseReferences =
//       FirebaseDatabase.instance.ref().child('data_nodes');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Data Printer'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _fetchDataFromFirebase();
//           },
//           child: Text('Fetch Data'),
//         ),
//       ),
//     );
//   }

//   void _fetchDataFromFirebase() {
//     databaseReferences.once().then((DataSnapshot snapshot) {
//       // Loop through each child of the root node
//       snapshot.value.forEach((key, value) {
//         print('Key: $key, Value: $value');
//       });
//     }).catchError((error) {
//       print('Failed to fetch data: $error');
//     });
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: FirebaseDataPrinter(),
//   ));
// }

