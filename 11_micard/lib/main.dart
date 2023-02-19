import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
              // SafeArea : 컨테이너의 내용물이 베젤이나 시간 등에 가려지지 않게 해준다
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  /** 🌟 Course Resources : https://github.com/londonappbrewery/Flutter-Course-Resources
                   *  🌟 Flutter Layout Cheat Sheet : https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e
                   *
                   * - mainAxisSize : 컬럼의 위아래 사이즈
                   * - verticalDirection : 컬럼의 위아래 위치 (맨밑에 붙일지.. 등)
                   * - mainAxisAlignment : 기본적인 main Axis 는 좌측 상단. 기본 좌표 위치를 설정한다.
                   * ㄴ mainAxisAlignment.spaceEvenly / spaceBetween : Container 의 children을 정렬
                   * - crossAxisAlignment : 왼쪽 정렬, 오른쪽정렬 ... or 기기의 가로 사이즈로 맞추어 늘리기
                   *
                   */

                  children: [
                    Container(
                      // child 가 없는 컨테이너의 크기=최대, child가 있는 컨테이너의 크기=child의 크기
                      height: 100.0,
                      width: 100.0,
                      color: Colors.white,
                      child: const Text('Container 1'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Text('Container 2'),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Text('Container 3'),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 10.0,
                    //   child: Text('Container 3'),
                    // )
                  ],
                ),
              ),
            )));
  }
}
