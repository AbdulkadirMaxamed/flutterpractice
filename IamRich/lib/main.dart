import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('I Am Rich',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body:
        const Center(
          child:
          Image(
              image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/STS41B-35-1613_-_Bruce_McCandless_II_during_EVA_%28Retouched%29.jpg/800px-STS41B-35-1613_-_Bruce_McCandless_II_during_EVA_%28Retouched%29.jpg')
          ),
        ),
        // Text('I AM IN THE CENTER',
        //   style: TextStyle(
        //     color: Colors.white
        //   ),
        // ),
      ),
    ),
  );
}