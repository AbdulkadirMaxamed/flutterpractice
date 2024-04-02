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
          backgroundColor: Colors.brown,
        ),
        body: xylophoneApp(),
      ),
    ),
  );
}

class xylophoneApp extends StatelessWidget {
  const xylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {

    String name = "Abdulkadir";

    return Row(
      children: [
        Column(
          children: [
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note1.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note2.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.orange,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note3.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.yellow,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note4.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.green,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note5.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.teal,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note6.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final player = AudioPlayer();
                player.play(AssetSource('note7.wav'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
