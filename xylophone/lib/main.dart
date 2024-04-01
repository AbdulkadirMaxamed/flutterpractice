import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';


void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Xylophone App"),
          backgroundColor: Colors.red,
        ),
        body: xylophoneApp(),
        backgroundColor: Colors.teal,
      ),
    ),
  );
}

class xylophoneApp extends StatelessWidget {
  const xylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {

    String name = "Abdulkadir";

    return Center(
      child: TextButton(
        onPressed: (){
          final player = AudioPlayer();
          player.play(AssetSource('note1.wav'));
        },
        child: Text("$name", style:
          TextStyle(
            color: Colors.red
          ),
        ),
      ),
    );
  }
}
