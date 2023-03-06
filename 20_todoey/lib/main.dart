import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 🤍 ChangeNotifierProvider 위치에 주의. 특정 데이터를 root로 올리고 싶으면 main 에 있어야 함
    return ChangeNotifierProvider(
      // builder: (context, child) => TaskData(),
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
