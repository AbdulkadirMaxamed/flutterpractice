import 'package:flutter/material.dart';

const Color cardColour = Color(0xff151641);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Row(
                children: [
                  ReuseableCard(text: "Male", colour: cardColour),
                  ReuseableCard(text: "Female", colour: cardColour)
                ],
              )
          ),
          const Expanded(
              child: ReuseableCard(text: "Height", colour: cardColour)
          ),
          const Expanded(
              child: Row(
                children: [
                  ReuseableCard(text: "Weight", colour: cardColour),
                  ReuseableCard(text: "Age", colour: cardColour)
                ],
              )
          ),
          Container(
            color: Color(0xffeb1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            child: TextButton(
                onPressed: (){
                  null;
                },
                child: const Text(
                    "Calculate",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                )
            ),
          )
        ],
      ),

    );
  }
}

class ReuseableCard extends StatelessWidget {

  //constructor
  const ReuseableCard({super.key,
    required this.colour,
    required this.text,
  });

  final Color colour;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
