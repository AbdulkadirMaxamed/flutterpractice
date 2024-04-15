import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_game/checkpoints.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Checkpoints storyQuestion = Checkpoints();

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
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
            if(StoryCheckpointPosition<storyQuestion.getStoryLength() && response!="Restart"){
              //check if the response chosen by user
              if(response==storyQuestion.getChoice1(StoryCheckpointPosition) && StoryCheckpointPosition==2) {
                setState(() {
                  StoryCheckpointPosition += 3;
                });
              }else if(response==storyQuestion.getChoice2(StoryCheckpointPosition) && StoryCheckpointPosition==1||StoryCheckpointPosition==2) {
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
            if(response=="Restart" && StoryCheckpointPosition==4) {
              Alert(context: context,
                  title: "You Lose",
                  desc: "The man runs you over for not getting in the car")
                  .show();
              setState(() {
                StoryCheckpointPosition = 0;
              });
            }else if(response=="Restart" && StoryCheckpointPosition==4) {
              Alert(context: context, title: "You Lose", desc: "The man runs you over for not getting in the car").show();
              setState(() {
                StoryCheckpointPosition = 0;
              });
            }else if(response=="Restart"){
              setState(() {
                StoryCheckpointPosition = 0;
              });
            }



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://w.forfun.com/fetch/67/674d9f64c8a3c0110654ebdd1e037503.jpeg'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                        storyQuestion.getCheckpoint(StoryCheckpointPosition),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white
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
            ),
          )
      ),
    );
  }
}
