import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';


void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Xylophone App"),
          backgroundColor: Colors.brown,
        ),
        body: SafeArea(
          child: xylophoneApp(),
        ),
        backgroundColor: Colors.blueGrey,
      ),
    ),
  );
}

class xylophoneApp extends StatelessWidget {
  const xylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {

    void playSound(sound){
      final player = AudioPlayer();
      player.play(AssetSource(sound));
    }

    Expanded buildComponent(Color boxColor,String sound){
      return Expanded(
        child: TextButton(
          onPressed: (){
            playSound(sound);
          },
          child: Container(
            color: boxColor,
          ),
        ),
      );
    };

    return Column(
      children: [
        buildComponent(Colors.red,"note1.wav"),
        buildComponent(Colors.orange,"note2.wav"),
        buildComponent(Colors.yellow,"note3.wav"),
        buildComponent(Colors.green,"note4.wav"),
        buildComponent(Colors.teal,"note5.wav"),
        buildComponent(Colors.blue,"note6.wav"),
        buildComponent(Colors.purple,"note7.wav"),
      ],
    );
  }
}
