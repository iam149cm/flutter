import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatefulWidget : 위젯에 데이터를 담고 실시간으로 변경된 UI를 보고싶을 때 사용한다
// 👉 둘로 나뉜다 - widget itself / state of widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0; // 이 값을 변경하고 싶으므로 final 이 아니다

  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  List<int> numbers = [];

  void onClicked() {
    setState(() {
      // 👉state 에게 새로운 이터가 있다고 알려주는 함수. build 메소드가 재실행된다는 의미이다.
      counter = counter + 1;
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing to see'),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                  iconSize: 40,
                  onPressed: onClicked,
                  icon: const Icon(
                    Icons.add_box_rounded,
                  )),
              for (var n in numbers) Text('$n'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // 👉 부모요소에 의존하는 데이터를 초기화 하는 경우 사용한다.
    // build 메소드보다 ✨먼저 호출되어야 하며 오직 단 한번만 호출된다.
    // ✨ widget life cycle : init -> build -> dispose

    super.initState();
    print('👉 init state!');
  }

  @override
  void dispose() {
    // 👉 위젯이 스크린에서 제거될 떄 호출되는 메소드. 위젯트리에서도 제거된다.

    super.dispose();
    print('👉 dispose!');
  }

  @override
  Widget build(BuildContext context) {
    //👉 context - Text 이전에 있는 모든 상위 요소들에 대한 정보. 즉, 위젯트리에 대한 정보가 들어있다.
    // 위젯 트리에서 위젯의 위치를 제공하고 이를 통해 상위 요소 데이터에 접근할 수 있다.
    print('👉 build!');
    return Text('My Large Title',
        style: TextStyle(
          fontSize: 30,
          color: Theme.of(context) // 👉 context 를 사용해서 부모의 요소를 가져온다
              .textTheme
              .titleLarge! // 👉 ! 를 추가하면 값이 확실히 있다는 뜻
              .color,
        ));
  }
}
