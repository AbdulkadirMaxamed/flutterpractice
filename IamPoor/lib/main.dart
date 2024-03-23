import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('I am Poor',
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Image(
            image: NetworkImage('https://static.vecteezy.com/system/resources/previews/011/480/742/original/poor-icon-design-free-vector.jpg'),
          ),
        ),
        backgroundColor: Colors.blueGrey,
      )
    )
  );
}

