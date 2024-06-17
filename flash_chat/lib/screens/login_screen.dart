import 'package:flash_chat/components/inputTextWidget.dart';
import 'package:flash_chat/components/widgetBtn.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email="";
  String password="";

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
            Hero(
              tag: 'logo',
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
                  password=value;
                }
            ),
            const SizedBox(
              height: 24.0,
            ),
            btnWidget(
              color: Colors.lightBlueAccent,
              btnText: 'Log In',
              onPress: ()async{
                //log in functionality so some checks before opening the chat page
                print("here");
                try{
                  final existingUser = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password);
                  print("success");
                  print(existingUser);
                  Navigator.pushNamed(context, ChatScreen.id);
                }on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-emai') {
                    print('Invalid email/password');
                  } else if (e.code == 'user-not-found') {
                    print('An account with the following email does not exist.');
                  }
                } catch (e) {
                  print(e);
                }
              }
            ),
            btnWidget(
                color: Colors.blueAccent,
                btnText: 'Back',
                onPress: (){
                  Navigator.pop(context);
                }
            ),
          ],
        ),
      ),
    );
  }
}