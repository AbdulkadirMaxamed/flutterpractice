import 'package:flutter/material.dart';
import 'package:todo_app/modals/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskDataObject, child){
        return ListView.builder(
          itemBuilder: (context, index){
            return TaskTile(
                taskTitle: taskDataObject.tasks[index].name,
                isChecked: taskDataObject.tasks[index].isDone,
                checkedBoxCallBack: (bool? checkbox){
                  // setState(() {
                  //   Provider.of<TaskData>(context).tasks.toggleDone();
                  // });
                }
            );
          },
          itemCount: taskDataObject.taskCount,
        );
      },

    );
  }
}