import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo_app/modals/task.dart';

class TaskList extends StatefulWidget {

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  List<Task> tasks=[
    Task(name: "Buy milk"),
    Task(name: "Code"),
    Task(name: "Call Stephen"),
    Task(name: "Call Stephen"),
    Task(name: "Call Stephen")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkedBoxCallBack: (bool? checkbox){
            setState(() {
              tasks[index].isDone=checkbox??false;
              print(tasks[index].isDone);
            });
          }
        );
      },
      itemCount: tasks.length,
    );
  }
}