import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.teal,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = 5;
  int rightDiceNumber = 4;

  int randomiser(){
    Random random = new Random();
    int randomNumber = random.nextInt(6)+1;
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      leftDiceNumber = randomiser();
                    });
                    print("left dice is: $leftDiceNumber");
                  },
                  child: Image(
                      image: AssetImage('images/dice${leftDiceNumber}.png')
                  ),

                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    child: Image.asset(
                        'images/dice$rightDiceNumber.png'
                    ),
                    onPressed: (){
                      setState(() {
                        rightDiceNumber = randomiser();
                      });
                      print("right dice is: $rightDiceNumber");
                    },
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

