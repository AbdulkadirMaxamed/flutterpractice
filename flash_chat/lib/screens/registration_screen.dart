import 'package:flash_chat/components/inputTextWidget.dart';
import 'package:flash_chat/components/widgetBtn.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool _showSpinner = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag:'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
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
                  setState(() {
                    _showSpinner=true;
                  });
                  try {
                    final  credential = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password
                    );
                    if(credential!=null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      _showSpinner=false;
                    });

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
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
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black45
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

