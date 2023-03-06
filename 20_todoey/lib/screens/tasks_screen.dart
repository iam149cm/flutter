import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

// Provider 를 사용하므로 Statelesswidget 으로 변경
class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade200,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan.shade200,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          // bottomSheet 를 보여준다. builder에는 widget 을 리턴하는 함수가 들어간다
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (context) => AddTaskScreen(
              addTaskCallback: (newTaskTitle) {
                // setState(() {
                //   tasks.add(Task(name: newTaskTitle));
                // });
                Navigator.pop(context); // Add 버튼을 누른 후 bottom sheet 를 없애준다
              },
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      color: Colors.cyan.shade200,
                      size: 30,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
