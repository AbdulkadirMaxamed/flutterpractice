import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'styling.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({super.key, required this.calculation});

  final double calculation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColour,
        ),
        scaffoldBackgroundColor: kBackgroundColour
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
                "Your Results",
                style: kHeaderStyling
              )
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: inactiveCardColour,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Text("Your Results")
                  ),
                  Expanded(
                      child: Text(
                        calculation.toString(),
                        style: kHeaderStyling
                      )
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
                          "Restart",
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
