import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'questionsBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionsBank questionsBank = QuestionsBank();

void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizApp(),
      )
  );

}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  //todo: change logo for the app

  int questionNumber = 0;

  int totalQuestions = questionsBank.getNumberOfQuestions();

  int usersAnswers = 0;

  List<Icon> results = [

  ];

  Expanded btnBuilder(Color boxColor, bool answerText){
    return Expanded(
      child: TextButton(
          onPressed: (){
            //checks if answer is correct
            if(questionsBank.getAnswer(questionNumber)==answerText){
              usersAnswers++;
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
              completed(context);
            }else{
              //this checks if the question we are currently on meets the first 5 or 10 questions
              if(questionNumber==14){
                firstFifteen(context, 15);
              }else if(questionNumber==9){
                firstTen(context, 10);
              }else if(questionNumber==4){
                firstFive(context, 5);
              }
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
    return Scaffold(
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
              Row(
                children: results,
              )
            ],
          ),
        ),
      );
  }

  //questions alert point
  void completed(context){
    Alert(
        context: context,
        style: const AlertStyle(
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 300)
        ),
        type: AlertType.warning,
        title: "You completed the quiz",
        desc: "You got $usersAnswers/$totalQuestions right",
        buttons: [
          DialogButton(
            onPressed: (){
              setState(() {
                questionNumber=0;
                usersAnswers=0;
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.red,
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]
    ).show();
  }

  void firstFifteen(context, questionsCompleted){
    if(usersAnswers<=questionsCompleted-3){
      unsuccessful(context, 15);
    }else{
      Alert(
        context: context,
        style: const AlertStyle(
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 300)
        ),
        type: AlertType.warning,
        title: "You completed FIRST $questionsCompleted",
        desc: "You got $usersAnswers/$questionsCompleted",
        buttons: [
          DialogButton(
            onPressed: (){
              setState(() {
                questionNumber=0;
                usersAnswers=0;
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.red,
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: (){
              setState(() {
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.green,
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  void firstTen(context, questionsCompleted){
    if(usersAnswers<=questionsCompleted-3){
      unsuccessful(context, 10);
    }else{
      Alert(
        context: context,
        style: const AlertStyle(
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 300)
        ),
        type: AlertType.warning,
        title: "You completed FIRST $questionsCompleted",
        desc: "You got $usersAnswers/$questionsCompleted",
        buttons: [
          DialogButton(
            onPressed: (){
              setState(() {
                questionNumber=0;
                usersAnswers=0;
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.red,
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: (){
              setState(() {
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.green,
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  void firstFive(context, questionsCompleted){
    if(usersAnswers<=questionsCompleted-2){
      unsuccessful(context, 5);
    }else{
      Alert(
        context: context,
        style: const AlertStyle(
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 300)
        ),
        type: AlertType.warning,
        title: "You completed FIRST $questionsCompleted",
        desc: "You got $usersAnswers/$questionsCompleted right",
        buttons: [
          DialogButton(
            onPressed: (){
              setState(() {
                questionNumber=0;
                usersAnswers=0;
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.red,
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: (){
              setState(() {
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.green,
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }

  }

  void unsuccessful(context, questionCompleted){
    Alert(
        context: context,
        style: const AlertStyle(
            animationType: AnimationType.fromBottom,
            animationDuration: Duration(milliseconds: 300)
        ),
        type: AlertType.warning,
        title: "Unsuccessful, try again",
        desc: "You got $usersAnswers/$questionCompleted right",
        buttons: [
          DialogButton(
            onPressed: (){
              setState(() {
                questionNumber=0;
                usersAnswers=0;
                results.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.red,
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]
    ).show();
  }

}


