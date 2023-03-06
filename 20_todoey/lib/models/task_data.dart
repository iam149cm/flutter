import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  // 외부에서 이 list에 함부로 접근할 수 없게 private 로 설정.
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  // List 의 getter이자 a view of another List.
  // UnmodifiableListView - List를 가져 올 수는 있지만 수정 할 수는 없다
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  // 본 메소드를 통해서만 list 에 추가할 수 있다.
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners(); // 🌟🌟🌟🌟🌟
  }
}
