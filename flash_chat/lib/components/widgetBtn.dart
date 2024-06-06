import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class btnWidget extends StatelessWidget {
  const btnWidget({
    super.key,
    required this.color,
    required this.btnText,
    required this.onPress
  });

  final Color color;
  final String btnText;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(btnText,
                  speed: const Duration(milliseconds: 50))
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}