import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Expanded Containers(String text){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        width: 150,
        height: 150,
        color: Color(0xff151641),
        child: Center(child: Text(text)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Containers("Male"),
              Containers("Female"),
            ],
          ),
          Row(
            children: [
              Containers("HEIGHT"),
            ],
          ),
          Row(
            children: [
              Containers("WEIGHT"),
              Containers("AGE")
            ],
          ),
          TextButton(
              onPressed: (){
                null;
              },
              child: Text("Calculate"))
        ],
      ),

    );
  }
}
