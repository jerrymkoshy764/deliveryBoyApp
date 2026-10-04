import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class rating extends StatefulWidget {
   final double ratings;
  const rating({super.key,required this.ratings});

  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
    double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rating of Delivery",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(height: 700,
          color: Color.fromARGB(255, 237, 239, 237),
          child: Column(
            children: [
                  SizedBox(
                          height: 40,
                        ),
        // Center(
        // child: RatingBar.builder(
        //   initialRating: _rating,
        //   minRating: 1,
        //   direction: Axis.horizontal,
        //   allowHalfRating: true,
        //   itemCount: 5,
        //   itemSize: 60,
        //   itemBuilder: (context, _) => Icon(
        //     Icons.star,
        //     color: Colors.amber,
        //   ),
        //   onRatingUpdate: (rating) {
        //     rating=_rating;
        //   },
        // ),
        //       ),

 Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          if (index < widget.ratings) {
            return Icon(
              Icons.star,
              size: 60,
              color: Colors.amber,
            );
          } else {
            return  Icon(
              
               size: 60,
            Icons.star,
            color: Color.fromARGB(255, 158, 158, 157),
          );
          }
        },
      ),
    ),




        
         SizedBox(
                          height: 10,
                        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 200,  color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hamp- den-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorumn The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet., comes from a line in section 1.10.32.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 24, 22, 22),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                                //       maxLines: 10,
                                // overflow: TextOverflow.clip,
                              ),
            ),
          ),
        ),
        
        
        
        
             /* Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 5),
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                     padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 25),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "About Company",
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 6, 6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
         SizedBox(
                          height: 10,
                        ),
        
                        Row(
                          children: [
                            Text(
                              "What is Lorem Ipsum?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Where does it come from?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 134, 134),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hamp- den-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorumn The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet., comes from a line in section 1.10.32.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                          //       maxLines: 10,
                          // overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "The standard chunk of Lorem Ipsum used since the 1500s is repro- duced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 134, 134),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),*/
        
              
        // SizedBox(height: 20,)
        
              // SizedBox(
              //         height: 20,
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}





class MyRatingScreen extends StatefulWidget {
  @override
  _MyRatingScreenState createState() => _MyRatingScreenState();
}

class _MyRatingScreenState extends State<MyRatingScreen> {
  double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Star Example'),
      ),
      body: Center(
        child: RatingBar.builder(
          initialRating: _rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 48,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: MyRatingScreen(),
//   ));
// }




// class DeliveryBoyRating extends StatefulWidget {
//     final double rating;
 
//   const DeliveryBoyRating({super.key,required this.rating});

//   @override
//   State<DeliveryBoyRating> createState() => _DeliveryBoyRatingState();
// }

// class _DeliveryBoyRatingState extends State<DeliveryBoyRating> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(
//         5,
//         (index) {
//           if (index < widget.rating) {
//             return Icon(
//               Icons.star,
//               size: 24,
//               color: Colors.amber,
//             );
//           } else {
//             return Icon(
//               Icons.star_border,
//               size: 24,
//               color: Colors.amber.withOpacity(0.6),
//             );
//           }
//         },
//       ),
//     );
//   }
// }






// class DeliveryBoyRating extends StatelessWidget {
  
//   final double rating;
//   final double starSize;
//   final Color starColor;

//   const DeliveryBoyRating({
//     required Key key,
//     required this.rating,
//     this.starSize = 24,
//     this.starColor = Colors.amber,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(
//         5,
//         (index) {
//           if (index < rating) {
//             return Icon(
//               Icons.star,
//               size: starSize,
//               color: starColor,
//             );
//           } else {
//             return Icon(
//               Icons.star_border,
//               size: starSize,
//               color: starColor.withOpacity(0.6),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
