import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
      const QuizApp()
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  Expanded btnBuilder(Color boxColor, String bool){
    return Expanded(
      child: TextButton(
          onPressed: (){
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
              const Expanded(
                flex: 3,
                child: Center(
                    child: Text(
                      "This is where the questions will go",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                      ),
                    )
                ),
              ),
              btnBuilder(Colors.green, "True"),
              btnBuilder(Colors.red, "Abdulkadir")
            ],
          ),
        ),
      ),
    );
  }
}


