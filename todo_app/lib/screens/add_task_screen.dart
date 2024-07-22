import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modals/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w700,
              )
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent)
              ),
              onPressed: (){
                if(newTaskTitle!=null && newTaskTitle!.isNotEmpty){
                  Provider.of<TaskData>(context, listen: false).updateList(newTaskTitle!);
                  Navigator.pop(context);
                }else{
                  Navigator.pop(context);
                }
              },
              child: const Text('Add',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                )
              )
            )
          ],
        ),
      )
    );
  }
}
