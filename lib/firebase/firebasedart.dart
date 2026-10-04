

// import 'package:boy/firebase/pop.dart';
// import 'package:boy/firebase/usermodal.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   DatabaseReference databaseReference =
//       FirebaseDatabase.instance.ref().child('data_nodes').child('users');

//   List<UserModel> listData = [];
//   @override
//   void initState() {
//     getDataFromFirebase();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showPopUp(context, databaseReference, "", "", false);
//         },
//         child: Text('+'),
//       ),
//       body: SafeArea(
//           child: ListView.separated(
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Material(
//                     child: InkWell(
//                       onTap: () {
//                         showPopUp(
//                             context,
//                             databaseReference,
//                             listData[index].user_nme,
//                             listData[index].pass,
//                             true);
//                         // databaseReference.child(listData[index].name!).remove();
//                       },
//                       child: Column(
//                         children: [
//                           Text(
//                               'Your name - ${listData[index].user_nme.toString()}'),
//                           Text('Age - ${listData[index].pass.toString()}')
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Divider();
//               },
//               itemCount: listData.length)),
//     );
//   }

//   void addDataToFirebase() {
//     final model = UserModel(user_nme: "joe", pass: "20");
//     databaseReference.child(model.user_nme.toString()).set(model.toJson());
//   }

//   void getDataFromFirebase() {
//     // databaseReference.onValue.listen((event) {
//     //   print(event.snapshot.value);
//     // });
//     // databaseReference.child('joe/age').onValue.listen((event) {
//     //   print("2nd${event.snapshot.value}");
//     // });

//     // databaseReference.child('joe').onValue.listen((event) {
//     //   UserModel model = UserModel.fromJson(event.snapshot.value as Map);
//     //   print(model.age);
//     // });

//     // databaseReference.onValue.listen((event) {
//     //   List<NewUserModel> userList = [];
//     //   UserModel model = UserModel.fromJson(event.snapshot.value as Map);
//     //   NewUserModel newUserModel =
//     //       NewUserModel(key: event.snapshot.key, model: model);

//     //   userList.add(newUserModel);

//     //   print(newUserModel.model);
//     //   print(userList);
//     // });
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

// print("${listData[0].user_nme.toString()}");





//       });
//     });
//   }
// }



import 'package:boy/firebase/firebasemodal.dart';
import 'package:boy/firebase/pop.dart';
import 'package:boy/firebase/usermodal.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('performance');

  List<FirebaseModel1> listData = [];
  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPopUp(context, databaseReference, "", "", false);
        },
        child: Text('+'),
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        showPopUp(
                            context,
                            databaseReference,
                            listData[index].earn.toString(),
                            listData[index].status.toString(),
                            true);
                        // databaseReference.child(listData[index].name!).remove();
                      },
                      child: Column(
                        children: [
                          Text(
                              'Your name - ${listData[index].earn.toString()}'),
                          Text('Age - ${listData[index].status.toString()}'),
                          //  Text(
                          //     'Your name - ${listData[index].names.toString()}'),
                          // Text('Age - ${listData[index].did.toString()}')
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: listData.length)),
    );
  }

  // void addDataToFirebase() {
  //   final model = FirebaseModel(name: "joe", age: 20);
  //   databaseReference.child(model.name.toString()).set(model.toJson());
  // }

  void getDataFromFirebase() {
    // databaseReference.onValue.listen((event) {
    //   print(event.snapshot.value);
    // });
    // databaseReference.child('joe/age').onValue.listen((event) {
    //   print("2nd${event.snapshot.value}");
    // });

    // databaseReference.child('joe').onValue.listen((event) {
    //   UserModel model = UserModel.fromJson(event.snapshot.value as Map);
    //   print(model.age);
    // });

    // databaseReference.onValue.listen((event) {
    //   List<NewUserModel> userList = [];
    //   UserModel model = UserModel.fromJson(event.snapshot.value as Map);
    //   NewUserModel newUserModel =
    //       NewUserModel(key: event.snapshot.key, model: model);

    //   userList.add(newUserModel);

    //   print(newUserModel.model);
    //   print(userList);
    // });
    List<FirebaseModel1> listDa1 = [];
    databaseReference.onValue.listen((event) {
      listDa1.clear();
      listData.clear();
      for (final element in event.snapshot.children) {
        FirebaseModel1 model = FirebaseModel1.fromJson(element.value as Map);
        listDa1.add(model);
      }

      setState(() {
        listData.addAll(listDa1);
        print(listDa1);
      });
    });
  }
}








