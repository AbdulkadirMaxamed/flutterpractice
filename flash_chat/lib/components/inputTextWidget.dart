import 'package:flutter/material.dart';

class inputTextWidget extends StatelessWidget {
  const inputTextWidget({
    super.key,
    required this.hintText,
    required this.colour,
    required this.onChange,
  });



  final String hintText;
  final Color colour;
  final void Function(dynamic) onChange;

  @override
  Widget build(BuildContext context) {
    bool ans = false;
    if(hintText.contains('password')){
      ans = true;
    }
    return TextField(
      obscureText: ans,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}