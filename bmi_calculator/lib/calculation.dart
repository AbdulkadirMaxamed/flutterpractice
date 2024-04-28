import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'styling.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({super.key, required this.calculation});

  final double calculation;

  @override
  Widget build(BuildContext context) {

    String status;
    String conclusion;

    if (calculation<=18.4){
      status = 'Normal';
      conclusion = 'You have a lower than normal bmi';
    }else if(calculation>=18.5 && calculation<=24.9){
      status = 'Normal';
      conclusion = 'You have a normal bmi keep it up!';
    }else if(calculation>=25.0 && calculation<=39.9){
      status = 'Overweight';
      conclusion = 'You have a higher than normal bmi';
    }else{
      status = 'Obese';
      conclusion = 'Your bmi is not healthy, look to reduce your bmi.';
    }

      return Scaffold(
        backgroundColor: kBackgroundColour,
        appBar: AppBar(
          title: const Text(
              "BMI CALCULATOR",
              style: kHeaderStyling
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Your Results", style: kHeaderStyling),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: inactiveCardColour,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Center(child: Text(status, style: kStatusStyling))
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text(calculation.toString(), style: kNumberTextStyle)
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child: Text(conclusion, style: kConclusionStyling)
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: const Color(0xffeb1555),
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
                child: const Center(
                  child: Text(
                    "Re-Calculate",
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}