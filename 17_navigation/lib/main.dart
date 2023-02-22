import 'package:flutter/material.dart';
import 'package:navigation/screen0.dart';
import 'package:navigation/screen1.dart';
import 'package:navigation/screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Screen0(),
      // initialRoute - 초기 route 설정. home 프로퍼티와 동시에 설정할 수 없다
      initialRoute: '/',
      // routes - multiple Route 설정
      routes: {
        '/': (context) => Screen0(),
        '/first': (context) => Screen1(),
        '/second': (context) => Screen2(),
      },
    );
  }
}
