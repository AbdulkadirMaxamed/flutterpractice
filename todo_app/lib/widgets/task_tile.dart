import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.taskTitle, required this.isChecked,
    required this.checkedBoxCallBack, required this.deleteTaskItem});

  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkedBoxCallBack;
  final Function() deleteTaskItem;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: TextButton(
        onPressed: (){

        },
        onLongPress: deleteTaskItem,
        child: Text(taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none
          ),
        ),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkedBoxCallBack
        // toggleCheckBox: checkBoxState,
      ),
    );
  }
}