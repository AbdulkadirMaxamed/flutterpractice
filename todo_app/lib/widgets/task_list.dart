import 'package:flutter/material.dart';
import 'package:todo_app/modals/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modals/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskDataObject, child){
        return ListView.builder(
          itemBuilder: (context, index){
            final taskData = taskDataObject.tasks[index];
            return TaskTile(
              taskTitle: taskData.name,
              isChecked: taskData.isDone,
              deleteTaskItem: (){
                taskDataObject.removeTask(index);
              },
              checkedBoxCallBack: (bool? checkbox){
                taskDataObject.updateTask(taskData);
              }
            );
          },
          itemCount: taskDataObject.taskCount,
        );
      },

    );
  }
}