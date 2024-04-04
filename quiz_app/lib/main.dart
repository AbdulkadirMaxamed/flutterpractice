import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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


  List<String> questionsList = [
    "Sharks are mammal",
    "Sea otters have a favorite rock they use to break open food.",
    "The blue whale is the biggest animal to have ever lived."
  ];

  List<String> answerList = [
    "False",
    "True",
    "True"
  ];

  int questionNumber = 0;

  List<Icon> results = [

  ];

  // String randomQuestionsGenerator(){
  //   int randomNum = Random().nextInt(questions.length);
  //   setState(() {
  //     newQuestion = questions[randomNum];
  //   });
  //   print(newQuestion);
  //   return newQuestion;
  // }

  Expanded btnBuilder(Color boxColor, String bool){
    return Expanded(
      child: TextButton(
          onPressed: (){
            //checks if answer is correct
            if(answerList[questionNumber]==bool){
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
            if(questionNumber==questionsList.length-1){
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
                    child: Text(questionsList[questionNumber],
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