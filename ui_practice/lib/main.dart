import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            const Row(
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
          ],
        ),
      ),
    );
  }
}
