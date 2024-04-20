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

  Color _maleCardColour = inactiveCardColour;
  Color _femaleCardColour = inactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
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
                        if(_femaleCardColour == activeCardColour){
                          _femaleCardColour = inactiveCardColour;
                          _maleCardColour == activeCardColour ?
                          _maleCardColour = inactiveCardColour : _maleCardColour = activeCardColour;
                        }else{
                          _maleCardColour == activeCardColour ?
                          _maleCardColour = inactiveCardColour : _maleCardColour = activeCardColour;
                        }
                      });
                    },
                    child: ReuseableCard(
                      childCard: const Center(
                            child: IconContent(icon: Icons.male, cardText: "MALE")
                        ),
                      colour: _maleCardColour
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_maleCardColour == activeCardColour){
                          _maleCardColour = inactiveCardColour;
                          _femaleCardColour == activeCardColour ?
                          _femaleCardColour = inactiveCardColour : _femaleCardColour = activeCardColour;
                        }else{
                          _femaleCardColour == activeCardColour ?
                          _femaleCardColour = inactiveCardColour : _femaleCardColour = activeCardColour;
                        }
                      });
                    },
                    child: ReuseableCard(
                      childCard: const Center(
                          child: IconContent(icon: Icons.female, cardText: "FEMALE")
                      ),
                      colour: _femaleCardColour
                    ),
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

                      });
                    },
                    child: ReuseableCard(
                        childCard: const Center(
                            child: IconContent(icon: Icons.male, cardText: "MALE")
                        ),
                        colour: inactiveCardColour
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: ReuseableCard(
                        childCard: const Center(
                            child: IconContent(icon: Icons.male, cardText: "MALE")
                        ),
                        colour: inactiveCardColour
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
