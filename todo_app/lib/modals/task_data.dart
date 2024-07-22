import 'package:flutter/material.dart';
import 'package:todo_app/modals/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks=[
    Task(name: 'homework 1'),
    Task(name: 'homework 2'),
    Task(name: 'homework 3'),
    Task(name: 'homework 4'),
    Task(name: 'homework 5'),
  ];

  int get taskCount{
    return tasks.length;
  }

  void updateList(String title){
    tasks.add(
      Task(name: title)
    );

    notifyListeners();
  }
}