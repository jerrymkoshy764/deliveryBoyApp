
// import 'package:boy/Graph/individual_bar.dart';


// class BarData {
//   final double sunAmount;
//   final double monAmount;
//   final double tueAmount;
//   final double wedAmount;
//   final double thuAmount;
//   final double friAmount;
//   final double satAmount;


//   final String date1;
//   final String date2;
//   final String date3;
//   final String date4;
//   final String date5;
//   final String date6;
//   final String date7;
  

//   BarData(
//       {required this.sunAmount,
//       required this.monAmount,
//       required this.tueAmount,
//       required this.wedAmount,
//       required this.thuAmount,
//       required this.friAmount,
//       required this.satAmount,
//       required this.date1,required this.date2,required this.date3,required this.date4,required this.date5,required this.date6,required this.date7,
      
      
//       });
//   List<IndividualBar> barData = [];
//   void initialiseBarData(){
//     barData=[
//       IndividualBar(x:0,y:sunAmount),
//       IndividualBar(x:1,y:monAmount),
//       IndividualBar(x:2,y:tueAmount),
//       IndividualBar(x:3,y:wedAmount),
//       IndividualBar(x:4,y:thuAmount),
//       IndividualBar(x:5,y:friAmount),
//       IndividualBar(x:6,y:satAmount),
      



//       //   IndividualBar(x:date1,y:sunAmount),
//       // IndividualBar(x:date2,y:monAmount),
//       // IndividualBar(x:date3,y:tueAmount),
//       // IndividualBar(x:date4,y:wedAmount),
//       // IndividualBar(x:date5,y:thuAmount),
//       // IndividualBar(x:date6,y:friAmount),
//       // IndividualBar(x:date7,y:satAmount),
      

//       ];
//   }


// }


import 'package:boy/Graph/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  BarData(
      {required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thuAmount,
      required this.friAmount,
      required this.satAmount});
  List<IndividualBar> barData = [];
  void initialiseBarData(){
    barData=[
      IndividualBar(x:0,y:sunAmount),
      IndividualBar(x:1,y:monAmount),
      IndividualBar(x:2,y:tueAmount),
      IndividualBar(x:3,y:wedAmount),
      IndividualBar(x:4,y:thuAmount),
      IndividualBar(x:5,y:friAmount),
      IndividualBar(x:6,y:satAmount),
      
      
      ];
  }


}