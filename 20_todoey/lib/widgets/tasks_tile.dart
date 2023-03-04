import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title - 처음에 무엇이 올 것인가
      title: Text('This is a task. 1'),
      // trailing - 마지막에 무엇이 올 것인가
      trailing: Checkbox(
        value: false,
        onChanged: (value) {
          value = true;
        },
      ),
    );
  }
}
