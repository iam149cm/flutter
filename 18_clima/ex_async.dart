void main() {
  performTasks();
}

void performTasks() async {
  // 받아오는 데 3초가 경과하는 task2의 리턴값을 task3에서 사용하려면? -> await

  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

/** 🤍 Future 자료형은 번호표와 같다.
 * - 카페에서 커피를 주문하고 번호표를 받는다. 다른 걸 하며 기다리는 동안 커피가 만들어진다.
 * - 커피가 다 만들어지고 나면 번호표를 주고 커피를 받는다. 그렇다고 번호표가 커피는 아니다.
 * - 자바스크립트의 promise 와 동일하다.
 */

// 받아오는데 시간이 걸리니까 Future 자료형으로 지정하고 async 설정.
Future<String> task2() async {
  // time consuming job - do it in background!
  Duration threeSeconds = Duration(seconds: 3);
  String result = '';
  // sleep(threeSeconds); // 3초 경과 (sleep 은 순차적).
  // async 로 하려면 Future 를 사용해야 한다.
  await Future.delayed(threeSeconds, () {
    // what should happen after 3 seconds up?
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';

  print('Task 3 complete with $task2Data');
}
