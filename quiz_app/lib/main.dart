import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'questionsBank.dart';

QuestionsBank questionsBank = QuestionsBank();

void main() {
  runApp(
      const QuizApp()
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int questionNumber = 0;

  List<Icon> results = [

  ];

  Expanded btnBuilder(Color boxColor, bool answerText){
    return Expanded(
      child: TextButton(
          onPressed: (){
            //checks if answer is correct
            if(questionsBank.getAnswer(questionNumber)==answerText){
              results.add(
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
              );
            }else{
              results.add(
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  )
              );
            }

            //iterates to the next question
            if(questionNumber==questionsBank.getNumberOfQuestions()-1){
              setState(() {
                questionNumber=0;
              });
            }else{
              setState(() {
                questionNumber++;
              });
            }
          },
          child: Container(
            color: boxColor,
            child: Center(
                child: Text("$answerText".toUpperCase(),
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
                    child: Text(questionsBank.getQuestions(questionNumber),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                      ),
                    )
                ),
              ),
              btnBuilder(Colors.green, true),
              btnBuilder(Colors.red, false),
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