import 'package:bmi_calculator/styling.dart';
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: (){
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
                    childCard: const Center(
                          child: IconContent(icon: Icons.male, cardText: "MALE")
                      ),
                    colour: _maleCardColour
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: (){
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
                    childCard: const Center(
                        child: IconContent(icon: Icons.female, cardText: "FEMALE")
                    ),
                    colour: _femaleCardColour
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: ReuseableCard(
              onPress: (){

              },
              childCard: Column(
                children: [
                  Text("Height", style: kTextStyling),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("193", style: kNumberTextStyle,),
                      Text("cm", style: kTextStyling)
                    ],
                  )
                ],
              ),
              colour: inactiveCardColour
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: (){

                    },
                    childCard: const Center(
                        child: IconContent(icon: Icons.male, cardText: "MALE")
                    ),
                    colour: inactiveCardColour
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                      onPress: (){

                      },
                    childCard: const Center(
                        child: IconContent(icon: Icons.male, cardText: "MALE")
                    ),
                    colour: inactiveCardColour
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
