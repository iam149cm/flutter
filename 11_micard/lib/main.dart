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
            backgroundColor: Colors.teal[400],
            body: SafeArea(
              // SafeArea : 컨테이너의 내용물이 베젤이나 시간 등에 가려지지 않게 해준다
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 10,
                ),
                child: Center(
                  child: Column(
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
                      // Ctrl + Q : Quick Doc
                      CircleAvatar(
                        radius: 150,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          'images/nyki2.png',
                        ),
                      ),
                      Text(
                        'Nayoung Kim',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FLUTTER DEVELOPER 🚀',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[100],
                          letterSpacing: 2.5,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Divider(
                          color: Colors.white.withOpacity(0.8),
                          thickness: 2,
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Padding(
                          // padding 으로 감쌀 때에는 그 자식이 wrapped around 되는 것을 기억 - 그래서 card를 감싸면 안됨
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_android_rounded,
                                size: 30,
                                color: Colors.teal[800],
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '+82-00-0000-0000',
                                style: TextStyle(
                                  color: Colors.teal[900],
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: ListTile(
                          // 🌟 ListTile 을 사용하면 container 에 일일히 넣는 것 보다 훨씬 편하다!
                          leading: Icon(
                            Icons.email_outlined,
                            size: 30,
                            color: Colors.teal[800],
                          ),
                          title: Text(
                            'iam149cm@email.com',
                            style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
