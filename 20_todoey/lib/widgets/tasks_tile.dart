import 'package:flutter/material.dart';

/* 🤍 단순히 하나의 Stateful Widget 에서 setState 로 local state는 바꿀 수 있다.
그러나 상위 위젯 트리의 다른 요소 (text 등) 에 영향을 주려면 global state를 바꿔야 한다.
👉 상위 위젯 트리 노드를 StatefulWidget으로 설정하고, state를 변경할 변수를 넣은 후 하위 StatelessWidet 에서 변경

🤍 StatefulWidget - 상황에 따라 폈다 접었다 할 수 있는 변신 테이블. final 로 변수 선언 불가 (state 가 바뀌어야 하니까)
🤍 StatelessWidget - 그냥 테이블
*/ ///

class TaskTile extends StatelessWidget {
// 🤍 0. task를 분리함으로써 stateful -> stateless widget 으로 변경하였음
// 🤍 1. state 로 부터 statefulWidget 을 create
// 🤍 2. 실제 state object. 값이 바뀌는 변수가 들어있다.
  final bool isChecked; // 👈 실제 state를 변경할 변수는 statefulWidget 안에 들어있다
  final String taskTitle;
  final Function(bool?) checkboxCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
  });

  // 🤍 3. 변수의 state가 바뀌면 build 메소드에서 UI 를 업데이트 해 준다.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title - 처음에 무엇이 올 것인가
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      // trailing - 마지막에 무엇이 올 것인가
      trailing: Checkbox(
        shape: CircleBorder(),
        value: isChecked,
        activeColor: Colors.teal.shade200,
        onChanged: checkboxCallback, // checkbox 가 변경될 때 callback 이 trigger 된다
      ),
    );
  }
}

// 🤍 4. final 이므로 여기서 요소의 state를 변경할 수는 없다.
// 🤍 5. 그러나 업데이트가 필요하면 생성자를 통해 새롭게 초기화하고 이전의 것은 버린다
// 🤍 6. Lifted up to the parent widget (TaskCheckbox --> TaskTile) 즉, 위젯트리의 부모 노드로 값을 올린다.
