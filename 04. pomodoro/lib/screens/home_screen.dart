import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
              // 👉 Flexible : 하나의 박스가 얼마나 공간을 차지할 지 비율을 정할 수 있다. multiple screen 만드는 것이 가능!
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '25:00',
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.play_circle_outline),
                  onPressed: () {},
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    // 양옆으로 확장시켜준다
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodoros',
                            style: TextStyle(
                              fontSize: 58,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                            ),
                          ),
                          const Text('0'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
