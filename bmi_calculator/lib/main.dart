import 'package:bmi_calculator/styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme:AppBarTheme(
          backgroundColor: kBackgroundColour,
        ),
        scaffoldBackgroundColor: kBackgroundColour,
      ),
      home: InputPage(),
    );
  }
}