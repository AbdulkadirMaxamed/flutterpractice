import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_game/checkpoints.dart';

Checkpoints storyQuestion = Checkpoints();

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

  int StoryCheckpointPosition = 0;

class _StoryAppState extends State<StoryApp> {

  //setup button builder for selection of next options
  Expanded btnBuilder(Color colour, String response, bool visibility){
    return Expanded(
        child: TextButton(
          onPressed: (){

            //get story length
            if(StoryCheckpointPosition<storyQuestion.getStoryLength()){
              //check if the response chosen by user
              if(response==storyQuestion.getChoice1(StoryCheckpointPosition) && StoryCheckpointPosition==2) {
                setState(() {
                  StoryCheckpointPosition += 3;
                });
              }else if(response==storyQuestion.getChoice2(StoryCheckpointPosition) && StoryCheckpointPosition==1) {
                setState(() {
                  StoryCheckpointPosition += 2;
                });
              }else if(response==storyQuestion.getChoice1(StoryCheckpointPosition) && StoryCheckpointPosition==0){
                setState(() {
                  StoryCheckpointPosition+=2;
                });
              }else{
                setState(() {
                  StoryCheckpointPosition++;
                });
              }
            }

            if(response=="Restart") {
              setState(() {
                StoryCheckpointPosition = 0;
              });
            }
            print(StoryCheckpointPosition);
          },
          child: Visibility(
            visible: visibility,
            child: Container(
              color: colour,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    response,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  //todo: add background image to make the app look better
  //todo: add alert buttons to say you lose/you won after story logic fixed

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
                  child: Text(
                      storyQuestion.getCheckpoint(StoryCheckpointPosition),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnBuilder(Colors.red, storyQuestion.getChoice1(StoryCheckpointPosition), true),
                  btnBuilder(Colors.blue, storyQuestion.getChoice2(StoryCheckpointPosition), storyQuestion.getVisibility(StoryCheckpointPosition))
                ],
              )
            ],
          )
      ),
    );
  }
}
