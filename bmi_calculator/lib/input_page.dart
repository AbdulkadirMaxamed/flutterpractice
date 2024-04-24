import 'package:bmi_calculator/styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const Color inactiveCardColour = Color(0xff151641);
const Color activeCardColour = Color(0xff111328);
//0xff4c4f5e

//values
double startingHeight = 100;
int startingWeight = 60;
int startingAge = 18;

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
                  child: ReusableCard(
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
                  child: ReusableCard(
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
            child: ReusableCard(
              onPress: (){

              },
              childCard: Column(
                children: [
                  const Text("Height", style: kTextStyling),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(startingHeight.round().toString(), style: kNumberTextStyle),
                      const Text("cm", style: kTextStyling)
                    ],
                  ),
                  Slider.adaptive(
                    value: startingHeight,
                    max: 250,
                    min: 50,
                    onChanged: (double value){
                      setState(() {
                        startingHeight = value.roundToDouble();
                      });
                    },
                    inactiveColor: Colors.white,
                    activeColor: const Color(0xffeb1555),
                    thumbColor: const Color(0xffeb1555),
                  ),
                ],
              ),
              colour: inactiveCardColour
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){

                    },
                    childCard: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: kTextStyling
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              startingWeight.toString(),
                              style: kNumberTextStyle
                            ),
                            const Text(
                              "kg",
                              style: kTextStyling,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: (){
                                setState(() {
                                  startingWeight--;
                                });
                              },
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: (){
                                setState(() {
                                  startingWeight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    colour: inactiveCardColour
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: (){

                      },
                    childCard: Column(
                      children: [
                        const Text("Age", style: kTextStyling),
                        Text(startingAge.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: (){
                                setState(() {
                                  startingAge--;
                                });
                              },
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: (){
                                setState(() {
                                  startingAge++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    colour: inactiveCardColour
                  ),
                ),
              ],
            )
          ),
          Container(
            color: const Color(0xffeb1555),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            child: TextButton(
              onPressed: (){
                Alert(
                    context: context,
                    title: "$startingHeight $startingWeight $startingAge",
                    desc: "Flutter is awesome."
                ).show();
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

//creating a custom button using RawMaterialButton
class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPress
  });

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56
      ),
      shape: const CircleBorder(),
      fillColor: activeCardColour,
      child: Icon(
          icon
      )
    );
  }
}
