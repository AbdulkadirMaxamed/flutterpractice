import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

const Color inactiveCardColour = Color(0xff151641);
const Color activeCardColour = Color(0xff111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color _color = inactiveCardColour;
  Color _femaleCardColour = inactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _color == activeCardColour ?
                          _color = inactiveCardColour : _color = activeCardColour;
                        });
                      },
                      child: ReuseableCard(
                            childCard: const Center(
                                  child: IconContent(icon: Icons.male, cardText: "MALE")
                              ),
                            colour: _color
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                        childCard: GestureDetector(
                          onTap: (){
                            setState(() {
                              _femaleCardColour == activeCardColour ?
                                  _femaleCardColour = inactiveCardColour : _femaleCardColour = activeCardColour;
                            });
                          },
                          child: Center(
                              child: IconContent(icon: Icons.female, cardText: "FEMALE")
                          ),
                        ),
                        colour: _femaleCardColour
                    ),
                  ),
                ],
              )
          ),
          Expanded(
              child: ReuseableCard(
                  childCard: Center(
                      child: IconContent(icon: Icons.male, cardText: "Height")
                  ),
                  colour: inactiveCardColour
              ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _color == activeCardColour ?
                          _color = inactiveCardColour : _color = activeCardColour;
                        });
                      },
                      child: ReuseableCard(
                          childCard: const Center(
                              child: IconContent(icon: Icons.male, cardText: "MALE")
                          ),
                          colour: _color
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _color == activeCardColour ?
                          _color = inactiveCardColour : _color = activeCardColour;
                        });
                      },
                      child: ReuseableCard(
                          childCard: const Center(
                              child: IconContent(icon: Icons.male, cardText: "MALE")
                          ),
                          colour: _color
                      ),
                    ),
                  ),
                ],
              )
          ),
          Container(
            color: Color(0xffeb1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            child: TextButton(
                onPressed: (){
                  null;
                },
                child: const Text(
                    "Calculate",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
