import 'package:flutter/material.dart';
import 'styling.dart';

const name = "abdulkadir";

class CalculationPage extends StatelessWidget {
  const CalculationPage({super.key, required this.calculation});

  final double calculation;

  @override
  Widget build(BuildContext context) {

    if(calculation>25){

    }

    return Scaffold(
        backgroundColor: kBackgroundColour,
        appBar: AppBar(
          title: Text(
              "BMI CALCULATOR",
              style: kHeaderStyling
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Results", style: kHeaderStyling),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: inactiveCardColour,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Column(
                  children: [
                    Text("Overweight"),
                    Text("data")
                  ],
                ),
              ),
          ],
        ),
    );
  }
}

// class CalculationPage extends StatelessWidget {
//   const CalculationPage({super.key, required this.calculation});
//
//   final double calculation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kBackgroundColour,
//         appBar: AppBar(
//           title: const Center(
//               child: Text(
//                   "Your Results",
//                   style: kHeaderStyling
//               )
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: inactiveCardColour,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: const Expanded(
//                     child: Text("Your Results")
//                 ),
//               ),
//             ),
//
//             Expanded(
//                 child: Text(
//                     calculation.toString(),
//                     style: kHeaderStyling
//                 )
//             ),
//           ],
//         )
//     );
//   }
// }


// GestureDetector(
// onTap: (){
// Navigator.pop(context);
// },
// child: Container(
// color: const Color(0xffeb1555),
// margin: const EdgeInsets.only(top: 10.0),
// width: double.infinity,
// height: 80.0,
// child: const Center(
// child: Text(
// "Re-Calculate",
// style: kButtonTextStyle,
// ),
// ),
// ),
// )