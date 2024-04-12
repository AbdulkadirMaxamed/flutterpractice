import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(
    const MaterialApp(
      home: StoryApp(),
    )
  );
}

class StoryApp extends StatefulWidget {
  const StoryApp({super.key});

  @override
  State<StoryApp> createState() => _StoryAppState();
}


class _StoryAppState extends State<StoryApp> {

  Expanded btnBuilder(Color colour, response){
    return Expanded(
        child: TextButton(
          onPressed: (){
            print(response);
          },
          child: Container(
            height: 50.0,
            color: colour,
            child: Center(
              child: Text(
                "$response",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text("Question Goes here"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnBuilder(Colors.red, "path 1"),
                  btnBuilder(Colors.blue, "path 2")
                ],
              )
            ],
          )
      ),
    );
  }
}
