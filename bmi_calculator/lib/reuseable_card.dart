import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {

  //constructor
  const ReuseableCard({super.key,
    required this.colour,
    required this.childCard,
    required this.onPress
  });

  final Color colour;
  final Widget childCard;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: childCard,
      ),
    );
  }
}