import 'package:bmi_calculator/styling.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.icon,
    required this.cardText
  });

  final IconData icon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100.0,
        ),
        Text(
          cardText,
          style: kTextStyling
        )
      ],
    );
  }
}