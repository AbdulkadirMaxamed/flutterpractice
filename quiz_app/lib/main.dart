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

  int questionNumber = 0;

  int totalQuestions = questionsBank.getNumberOfQuestions();

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

            //TODO: make a right answers variable that tracks how many right answers submitted
            //todo: make a function for the alerts
            //todo: need to make the icon not reach the end of the screen

            //iterates to the next question
            if(questionNumber==questionsBank.getNumberOfQuestions()-1){
              print("im here");
              Alert(
                context: context,
                type: AlertType.warning,
                title: "You completed the quiz",
                desc: "You got x/$totalQuestions right",
                buttons: [
                  DialogButton(
                    onPressed: (){
                      setState(() {
                        questionNumber=0;
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
            }else{
              if(questionNumber==9){
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "You completed FIRST 10",
                  desc: "You got x/$totalQuestions? right $questionNumber",
                  buttons: [
                    DialogButton(
                      onPressed: (){
                        setState(() {
                          questionNumber=0;
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
                          questionNumber++;
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
              }else if(questionNumber==4){
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "You completed FIRST 5",
                  desc: "You got x/10? right",
                  buttons: [
                    DialogButton(
                      onPressed: (){
                        setState(() {
                          questionNumber=0;
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
                          questionNumber++;
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
              setState(() {
                questionNumber++;
              });
              print("loop again $questionNumber is our question number & $totalQuestions");
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
  // _onBasicAlertPressed(context) {
  //   Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
  // }

}


