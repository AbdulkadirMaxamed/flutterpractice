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
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xff8d8e98)
          ),
        )
      ],
    );
  }
}