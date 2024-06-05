import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;
  int animationVariable = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    //this carries the ticker forward
    controller.reverse(from: 1.0);

    controller.addListener(() {
      setState(() {
      });
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 100)
                    ),
                  ],
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        'login_screen'
                    );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Log In',
                      speed: const Duration(milliseconds: 100))
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'registration_screen');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Register',
                          speed: const Duration(milliseconds: 75))
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}