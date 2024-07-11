import 'package:flash_chat/components/inputTextWidget.dart';
import 'package:flash_chat/components/widgetBtn.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email="";
  String password="";
  bool _showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
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
                  setState(() {
                    _showSpinner=true;
                  });
                  try{
                    final existingUser = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password
                    );
                    print("success");
                    print(existingUser);
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      _showSpinner=false;
                    });
                  }on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-credential') {
                      setState(() {
                        _showSpinner=false;
                      });
                      print('Invalid email/password');
                    } else if (e.code == 'user-not-found') {
                      setState(() {
                        _showSpinner=false;
                      });
                      print('An account with the following email does not exist.');
                    }
                  } catch (e) {
                    setState(() {
                      _showSpinner=false;
                    });
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
      ),
    );
  }
}