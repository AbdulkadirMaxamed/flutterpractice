import 'package:flutter/material.dart';

const Color cardColour = Color(0xff151641);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                      childCard: Center(
                          child: IconContent(icon: Icons.male, cardText: "MALE")
                      ),
                      colour: cardColour
                  ),
                  ReuseableCard(
                      childCard: Center(
                          child: IconContent(icon: Icons.female, cardText: "FEMALE")
                      ),
                      colour: cardColour
                  ),
                ],
              )
          ),
          const Expanded(
              child: ReuseableCard(
                  childCard: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                                fontSize: 20.0
                            ),
                          ),
                          Icon(
                            Icons.female,
                            size: 100,
                            semanticLabel: "Male",
                          ),
                        ],
                      )
                  ),
                  colour: cardColour
              ),
          ),
          const Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                      childCard: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ),
                              Icon(
                                Icons.female,
                                size: 100,
                              ),
                            ],
                          )
                      ),
                      colour: cardColour
                  ),
                  ReuseableCard(
                      childCard: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ),
                              Icon(
                                Icons.female,
                                size: 100,
                              ),
                            ],
                          )
                      ),
                      colour: cardColour
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

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.icon,
    required this.cardText
  });

  final IconData icon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100.0,
        ),
        Text(
          cardText,
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xff8d8e98)
          ),
        )
      ],
    );
  }
}

class ReuseableCard extends StatelessWidget {

  //constructor
  const ReuseableCard({super.key,
    required this.colour,
    required this.childCard
  });

  final Color colour;
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: childCard,
      ),
    );
  }
}
