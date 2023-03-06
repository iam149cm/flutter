import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/tasks_tile.dart';

// Provider 를 사용하므로 StatefulWidget 일 필요가 없음
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Consumer 위젯이 taskData 의 change 를 listening 한다. state가 업데이트되면 rebuild함
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemCount: taskData.taskCount, // index 에러 방지를 위해 필요한 property
          itemBuilder: (context, index) {
            return TaskTile(
                // 기존에 사용했던 widget.task 를 Provider 로 변경하여 listen 하게 업데이트
                // Provider.of<TaskData>(context) 를 Consumer 의 taskData로 대체할 수 있게 업데이트
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkboxCallback: (bool? checkboxState) {
                  // setState(() {
                  //   widget.tasks[index].toggleDone();
                  // });
                });
          },
        );
      },
    );
  }
}
