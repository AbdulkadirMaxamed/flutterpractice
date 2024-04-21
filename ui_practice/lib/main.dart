import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main(){
  runApp(
    const MaterialApp(
      home: UIPractice(),
    )
  );
}

class UIPractice extends StatelessWidget {
  const UIPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(10.0),
                  child: Text("Flutter Layout Demo")
              ),
            ),
            const Image(
                image: NetworkImage('https://www.wildlensbyabrar.com/images/easyblog_articles/100/a1sx2_custom_DSC01640.jpg')
            ),
            const Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text("Oeschinensee Lake Campground"),
                        Text("Kandersteg, Switzerland")
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text("41")
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.deepPurple,
                    ),
                    Text("Call")
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.route,
                      color: Colors.deepPurple,
                    ),
                    Text("Route")
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.deepPurple,
                    ),
                    Text("Share")
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("This is where the paragraph going to go"),
            )
          ],
        ),
      ),
    );
  }
}
