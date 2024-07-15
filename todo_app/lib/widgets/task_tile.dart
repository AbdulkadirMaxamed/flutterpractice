import 'package:flutter/material.dart';
import 'package:todo_app/screens/tasks_screen.dart';

class TaskTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Task 1'),
      trailing: CheckedBox(),
    );
  }
}