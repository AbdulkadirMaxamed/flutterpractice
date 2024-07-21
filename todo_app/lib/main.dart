import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modals/task_data.dart';
import 'package:todo_app/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<Data>(
//       create: (context) => Data(),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: MyText(),
//           ),
//           body: Level1(),
//         ),
//       ),
//     );
//   }
// }
//
//
// class Level1 extends StatelessWidget {
//   const Level1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Level2(),
//     );
//   }
// }
//
// class Level2 extends StatelessWidget {
//   const Level2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MyTextField(),
//         Level3()
//       ],
//     );
//   }
// }
//
// class Level3 extends StatelessWidget {
//   const Level3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context, listen: false).changedData);
//   }
// }
//
// class MyText extends StatelessWidget {
//   const MyText({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context).changedData);
//   }
// }
//
// class MyTextField extends StatelessWidget {
//   const MyTextField({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: (newValue){
//         Provider.of<Data>(context, listen: false).updatedData(newValue);
//       },
//     );
//   }
// }
//
// class Data extends ChangeNotifier{
//   String changedData = '12345';
//
//   void updatedData(newData){
//     changedData=newData;
//     notifyListeners();
//   }
// }