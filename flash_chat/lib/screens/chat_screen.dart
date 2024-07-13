import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User user;
  String ? messageText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try{
      if(_auth.currentUser!=null){
        print(_auth.currentUser);
        setState(() {
          user = _auth.currentUser!;
        });
      }
    }catch (e){
      print(e);
    }
  }

  // void getMessage(){
  //   print('here');
  //   _firestore.collection('messages').snapshots().listen((event) {
  //     for(var docSnapshot in event.docs){
  //       print(docSnapshot.data());
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot){
                  List<MessageBubble> messageBubbles = [];
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs;
                    for (var message in messages) {
                      final messageData = message.data() as Map<String, dynamic>;
                      final messageText = messageData['text'];
                      final messageSender = messageData['sender'];

                      final messageBubble = MessageBubble(
                          sender: messageSender,
                          text: messageText);
                      messageBubbles.add(messageBubble);
                    }

                    return Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                          children: messageBubbles
                        )
                    );  // Return a Column containing all the message widgets
                  } else {
                    return CircularProgressIndicator();  // Handle the loading state
                  }
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': user.email
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.sender, required this.text});

  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(sender),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
