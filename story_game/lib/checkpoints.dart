import 'story.dart';

class Checkpoints {

  List<StoryClass> storyCheckpoints = [
    StoryClass("you have reached checkpoint1", "CODE", "GAMES"),
    StoryClass("you have reached checkpoint2", "TAKEOUT", "COOK"),
    StoryClass("you have reached checkpoint3", "FOOTBALL", "MOVIES"),
    StoryClass("you have reached checkpoint4", "SLEEP", "PRODUCTIVENESS"),
  ];

  String getCheckpoint(int number){
    return storyCheckpoints[number].userSelection;
  }


}