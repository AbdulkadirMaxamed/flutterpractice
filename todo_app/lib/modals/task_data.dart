import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/modals/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks=[
    Task(name: 'homework 1'),
    Task(name: 'homework 2'),
    Task(name: 'homework 3'),
    Task(name: 'homework 4'),
    Task(name: 'homework 5'),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void updateList(String title){
    _tasks.add(
      Task(name: title)
    );

    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(index){
    _tasks.removeAt(index);
    notifyListeners();
  }

}