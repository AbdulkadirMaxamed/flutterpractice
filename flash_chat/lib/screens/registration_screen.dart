import 'package:flash_chat/components/inputTextWidget.dart';
import 'package:flash_chat/components/widgetBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag:'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            inputTextWidget(
              hintText: 'Enter your email',
              colour: Colors.blueAccent,
              onChange: (value){
                email=value;
              }
            ),
            const SizedBox(
              height: 8.0,
            ),
            inputTextWidget(
              hintText: 'Enter your password',
              colour: Colors.lightBlueAccent,
              onChange: (value){
                password = value;
              }
            ),
            const SizedBox(
              height: 24.0,
            ),
            btnWidget(
              color: Colors.blueAccent,
              btnText: 'Register',
              onPress: ()async{
                try {
                  final credential = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password
                  );
                  print("Successfull");
                  print(credential);
                }catch(e){
                  print("failed");
                  print(e);
                }

              }
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Already have an account? Login Here',
              style: TextStyle(
                  decoration: TextDecoration.underline
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

