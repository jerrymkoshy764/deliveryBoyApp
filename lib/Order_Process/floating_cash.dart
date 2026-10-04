// Krips New code
//********************************** */

import 'package:boy/firebase/usermodal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class payment_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razorpay Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Cash(),
      routes: {
        '/payment-success': (context) => PaymentSuccessPage(),
      },
    );
  }
}

class Cash extends StatefulWidget {
  const Cash({super.key});

  @override
  State<Cash> createState() => _CashState();
}

class _CashState extends State<Cash> {
  final amount = TextEditingController();

  String? did;

  String? Floating_cash;

  DatabaseReference databaseReference_per =
      FirebaseDatabase.instance.ref().child('data_node').child('performance');

  List<Performance> listData = [];

  String? Order_len;

  int _counter = 0;
  String selectedvalue = '1';
  // void _incrementCounter() {
  //   String selectedvalue = 'option 1';

  //   void _handleradiovaluechange(String value) {
  //     setState(() {
  //       selectedvalue = value;
  //     });
  //   }

  //   bool _rememberMe = false;

  late Razorpay _razorpay;
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    get_boy_data();
    getDataFromFirebase();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    // get_order_fun();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
    _amountController.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Success: ${response.paymentId}");
    // minus();
    Navigator.pushNamed(context, '/payment-success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: ${response.code} - ${response.message}");
    // Handle payment failure
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
    // minus();
    // Handle external wallet payments (e.g., UPI)
  }

  void _startPayment(String a) {
    double amount = double.tryParse(a.toString()) ?? 0.0;
    if (amount <= 0) {
      // Show error message or handle invalid amount
      return;
    }

    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': (amount * 100).toInt(), // amount in paise (100 paise = 1 INR)
      'name': 'Flutter Test',
      'description': 'Test payment',
      'prefill': {'contact': '9123456789', 'email': 'test@example.com'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Floating Cash",
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
          height: 700,
          color: Color.fromARGB(255, 214, 231, 236),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(15), // Makes the border round
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  height: 200, width: double.infinity,
                  // color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      Text(
                        "Rs." + Floating_cash.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 24, 22, 22),
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                        //       maxLines: 10,
                        // overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Current balance",
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 118, 118),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        //       maxLines: 10,
                        // overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Limit : Rs.1500",
                        style: TextStyle(
                            color: Color.fromARGB(255, 235, 142, 11),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        //       maxLines: 10,
                        // overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showLogoutConfirmationDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 4, 122, 154),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the value as needed
                          ),
                        ),
                        child: const Text(
                          'Deposit Now',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ),
    );
  }

  void get_boy_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    did = prefs.getString('did') ?? '';
    print("dataaaaaa"+did.toString());
  }

  void getDataFromFirebase() {
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
            print("cashhhhh"+Floating_cash.toString());
          }
        }

        print(listData);

        print(listData[0].earn.toString());
      });
    });
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter Your Amount',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          content: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: TextField(
              controller: amount,
              decoration: InputDecoration(
                suffixText: '*',
                suffixStyle: TextStyle(
                  color: Colors.red,
                ),
                labelText: 'Amount',
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                // hintText: 'Entetr your name'
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 170, 6, 4)),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform logout actions here
                // Dismiss the dialog
                 
                print(amount.text);
                checking();
            
//                if(amount.text ==null)
//                {
// showErrorMessage("Enter the amount");
//                }

//                else if (double.parse( amount.toString()) > double.parse( Floating_cash.toString()))
//                {
// showErrorMessage("Enter the amount less than the floating cash");
//                }
//                else{
//  _startPayment(amount.text);
//                }
              },
              child: Text(
                'Pay',
                style: TextStyle(color: Color.fromARGB(255, 23, 158, 3)),
              ),
            ),
          ],
        );
      },
    );
  }

  void minus() {
 final money = amount.text;
final Cash = Floating_cash.toString();

final int total=int.parse(Cash.toString())-int.parse((money));
print("totalllllll"+total.toString());
   databaseReference_per.child("542").child("floating_cash").set(total);
  // databaseReference_per.child("542").child("floating_cash").set(int.parse(total.toString()));
  }




  void checking() {
    final money = amount.text;
// print(isNumbe(money)); 
    // final val= isNumber(money);

    if (money == null || money.isEmpty) {
      // Show error message or handle empty amount
      showErrorMessage("Enter the amount");
    } else if (double.parse(money.toString()) >
        double.parse(Floating_cash.toString())) {
      showErrorMessage("Enter the amount less than the floating cash");
    }
     else{
    
         minus();

 _startPayment(money.toString());
               }
   



// Function to check if a string is a valid number
// bool isNumeric(String str) {
//   try {
//     double.parse(str);
//     return true;
//   } catch (e) {
//     return false;
//   }
// }




  }

  void showErrorMessage(String message) {
    MotionToast.error(
      title: const Text(
        'Error',
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
}

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Successful'),
      ),
      body: Center(
        child: Text(
          'Your payment was successful!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
