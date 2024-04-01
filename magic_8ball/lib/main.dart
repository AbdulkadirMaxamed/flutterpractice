import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Magic 8 Ball"),
          backgroundColor: Colors.teal,
        ),
        body: myApp(),
        backgroundColor: Colors.red,
      ),
    )
  );
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

int DecisionMaker(){
  Random random = new Random();
  int randomDecision = random.nextInt(5)+1;

  return randomDecision;
}

int decision = 1;

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: (){
                setState(() {
                  decision = DecisionMaker();
                  print("$decision");
                });
              },
              child: Image(
                image: AssetImage('images/ball$decision.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

