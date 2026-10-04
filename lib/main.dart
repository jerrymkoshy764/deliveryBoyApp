import 'package:boy/home/splash_boy.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: splash_boy(),
    );
  }
}













// class realtime extends StatefulWidget {
//   const realtime({super.key});

//   @override
//   State<realtime> createState() => _realtimeState();
// }

// class _realtimeState extends State<realtime> {
//   final ref = FirebaseDatabase.instance.ref('data_node').child('performance');

//   ///data_node/performance
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("real time database"),
//       ),
//       body: Column(children: [
//         // Expanded(child: FirebaseAnimatedList(query: ref, itemBuilder: (context,snapshot,animation,index)
//         // {
//         //   print(index);

//         //   return ListTile(
//         //     title: Text(snapshot.child('today').value.toString()),
//         //   );
//         // }))

//         Expanded(
//           child: FirebaseAnimatedList(
//             query: ref,
//             itemBuilder: (context, snapshot, animation, index) {
//               // Check if the index is 5
//               if (snapshot.child('did').value == 543) {
//                 // Retrieve the data at index 5
//                 var dataAtIndex5 = snapshot.child('earn').value;
//                 // Check if dataAtIndex5 is not null
//                 // if (dataAtIndex5 != null) {
//                 // Print the data
//                 print(dataAtIndex5.toString());
//                 // Return a ListTile with the data
//                 return ListTile(
//                   title: Text(dataAtIndex5.toString()),
//                 );
//                 // }
//               }
//               // If index is not 5 or data is null, return a placeholder widget or null
//               return SizedBox(); // Placeholder widget
//             },
//           ),
//         )
//       ]),
//     );
//   }
// }






//import 'package:firebase_auth/phoneauth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: phoneauth(),
//     );
//   }
// }

// import 'package:boy/otp/login.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';



// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter OTP Authentication',
//       theme: ThemeData(
//         primaryColor: const Color.fromARGB(255, 253, 188, 51),
//       ),
//       home: LoginScreen(),
//       // routes: <String, WidgetBuilder>{
//       //   '/otpScreen': (BuildContext ctx) => OtpScreen(),
//       //   '/homeScreen': (BuildContext ctx) => HomeScreen(),
//       // },
//     );
//   }
// }














// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';

// // class Screen extends StatefulWidget{
  
// //   Screen({super.key});

// //   @override
// //   _ScreenState createState() => _ScreenState();
// // }
// // class _ScreenState extends State<Screen>{
// //   String itemName = '';
// //   String itemImage = '';  //Initializing string bcz image requires a path
// //   String itemQuantity = '';
// //   CollectionReference collectionReference =
// //        FirebaseFirestore.instance.collection('data_node');//delivery_boy
// //   @override
// //   void initState(){
// //     //documentId is passed from previous widget
// //     collectionReference.doc('1').get().then((value) {
// //       //'value' is the instance of 'DocumentSnapshot'
// //       //'value.data()' contains all the data inside a document in the form of 'dictionary'
// //       setState(() {
// //         //name, image, quantity are the fields of document
// //         itemName = value.data()['name']; 
// //         itemImage = value.data()['image'];
// //         itemQuantity = value.data()['quantity'].toString(); //quantity field is of type number in firebase
// //         //while retrieving numerical value from firebase, convert it to string before displaying
// //       });
// //     });
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //   return Scaffold(
// //     body: Column(
// //       children: [
// //         Image.network(itemImage),
// //         Text(itemName),
// //         Text(itemQuantity),
// //       ]
// //     ));
// //   }
// // }









// // class testing extends StatefulWidget {
// //   const testing({super.key});

// //   @override
// //   State<testing> createState() => _testingState();
// // }
// // ValueNotifier<List<Products>> get_order_details__Notifiers = ValueNotifier([]);
// // class _testingState extends State<testing> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("hello"),),
// // body: ElevatedButton(onPressed: (){
// //   get_delivery_addrs_fun();
// // }, child: Text("testing")),





// //     );
// //   }

// //   void get_delivery_addrs_fun() async {
// //     // SharedPreferences prefs = await SharedPreferences.getInstance();
// //     // var uid = prefs.getString('data') ?? '';

// //     const key =
// //         "koFCpCMzm8hhn9ULj0BnUzZkpqM3rg9Mqdii3FwPRjBwZFQWriIJYgB5jjOhNIyasSl4RrmCFLW3tHDRtI39viQbYEP7nEkYvba2wstThYWjvkndZq0zaXJaWjuqeZo8vR3MMHa6OhBDKsFPmWOlIM4H1TgB1fudQndGKzUPg8YhAoaAoCxZ562zjbQdPO73ZkwyPV7iOIkyH11ZLAN42a5dgLH22Rs1VasEWBKdfkqMLPfDbLQpF9Ofqah4fqwc";
// //     final formdata =
// //         FormData.fromMap({'user_id': "649",'order_id': "224",'key': key});
// //     final result = await ApiClass().get_order_details_api(formdata);
// //     // print("$id");
// //     if (result != null) {
// //       if (result.status == "success") {
// //         if (result.data != null) {
// //           setState(() {
// //             print(result.status);
       

// //             // print("****product*****$get_order_details__Notifiers");
       

// //           });
// //         }
// //       } else {
// //         print(result.status);
// //       }
// //     }
// //     else{
// //       print("error");
// //     }
// //   }


// // }









// // import 'package:delivery_boy/home/splash_boy.dart';
// // import 'package:flutter/material.dart';

// // void main(List<String> args) {
// //   runApp(app());
// // }

// // class app extends StatelessWidget {
// //   const app({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: splash_boy(),
// //     );
// //   }
// // }


// // ignore: unused_import

  
// // import 'package:firebase_core/firebase_core.dart';

// // import 'package:flutter/material.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: splash_boy(),
// //     );
// //   }
// // }




// class CountdownTimerDemoState extends StatefulWidget {
//   const CountdownTimerDemoState({super.key});

//   @override
//   State<CountdownTimerDemoState> createState() => _CountdownTimerDemoStateState();
// }

// class _CountdownTimerDemoStateState extends State<CountdownTimerDemoState> {

//   // Step 2
//   Timer? countdownTimer;
//   Duration myDuration = Duration(days: 5);
//   @override
//   void initState() {
//     super.initState();
//   }
//   /// Timer related methods ///
//   // Step 3
//   void startTimer() {
//     countdownTimer =
//         Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
//   }
//   // Step 4
//   void stopTimer() {
//     setState(() => countdownTimer!.cancel());
//   }
//   // Step 5
//   void resetTimer() {
//     stopTimer();
//     setState(() => myDuration = Duration(days: 5));
//   }
//   // Step 6
//   void setCountDown() {
//     final reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds + reduceSecondsBy;
//       if (seconds < 0) {
//         countdownTimer!.cancel();
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     String strDigits(int n) => n.toString().padLeft(2, '0');
//     final days = strDigits(myDuration.inDays);
//     // Step 7
//     final hours = strDigits(myDuration.inHours.remainder(24));
//     final minutes = strDigits(myDuration.inMinutes.remainder(60));
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     return Scaffold(
//       // appBar: ...,
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             // Step 8
//             Text(
//               '$hours:$minutes:$seconds',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 50),
//             ),
//             SizedBox(height: 20),
//             // Step 9



//             ElevatedButton(
//               onPressed: startTimer,
//               child: Text(
//                 'Start',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             // Step 10



//             ElevatedButton(
//               onPressed: () {
//                 // if (countdownTimer == null || countdownTimer!.isActive) {
//                   stopTimer();
//                 // }
//               },
//               child: Text(
//                 'Stop',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             // Step 11


//             ElevatedButton(
//                 onPressed: () {
//                   resetTimer();
//                 },
//                 child: Text(
//                   'Reset',
//                   style: TextStyle(
//                     fontSize: 30,
//                   ),
//                 ))



//           ],
//         ),
//       ),
//     );
//   }
// }



// //import 'package:firebase_auth/phoneauth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:otpvalidation/phoneauth.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PhoneAuth(),
//     );
//   }
// }

// import 'package:boy/firebase/firebasedart.dart';
// import 'package:boy/otp/login.dart';
// import 'package:boy/otp/otpscrren.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter OTP Authentication',
//       theme: ThemeData(
//         primaryColor: const Color.fromARGB(255, 253, 188, 51),
//       ),
//       home: LoginScreen(),
//       routes: <String, WidgetBuilder>{
//         '/otpScreen': (BuildContext ctx) => OtpScreen(),
//         '/homeScreen': (BuildContext ctx) => HomeScreen(),
//       },
//     );
//   }
// }
