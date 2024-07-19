import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/modals/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> tasks=[
    // Task(name: "Buy milk"),
    // Task(name: "Code"),
    // Task(name: "Call Stephen"),
    // Task(name: "Call Stephen"),
    // Task(name: "Call Stephen")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) =>
          //wraps the popup around the keyboard
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: AddTaskScreen(addTaskCallback: (newTaskTitle){
                  print(newTaskTitle);
                  setState(() {
                    tasks.add(
                      Task(name: newTaskTitle),
                    );
                  });
                },)
              )
            )
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    size: 30.0,
                    Icons.list
                  )
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("Todoey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text("${tasks.length} Tasks",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
              ),
              child: TaskList(tasks: tasks),
            ),
          )
        ],
      ),
    );
  }
}