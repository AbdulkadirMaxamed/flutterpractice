import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
      QuizApp()
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {


  List questions = ["hi","bye","try","why","lie"];

  List<Icon> results = [
    const Icon(
      Icons.check,
      color: Colors.green,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  String randomQuestionsGenerator(){
    int randomNum = Random().nextInt(questions.length);
    setState(() {
      newQuestion = questions[randomNum];
    });
    print(newQuestion);
    return newQuestion;
  }

  Expanded btnBuilder(Color boxColor, String bool){
    return Expanded(
      child: TextButton(
          onPressed: (){
            randomQuestionsGenerator();
          },
          child: Container(
            color: boxColor,
            child: Center(
                child: Text(bool,
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),
                )
            ),
          )
      ),
    );
  }
  String newQuestion = "First question";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                    child: Text(newQuestion,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                      ),
                    )
                ),
              ),
              btnBuilder(Colors.green, "True"),
              btnBuilder(Colors.red, "False"),
              //Todo: Create Score keeper
              //Todo: Create random question generator function
              Row(
                children: results,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//do a key and value pair
/*
  questions = [
    q.1: question
    a.1: answer
  ]

  if q.1 and buttonpressed = a.1
    then push Icon to the list of results
 */
