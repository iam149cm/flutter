import 'package:flutter/material.dart';
import 'package:navigation/screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red)),
          child: Text('Go Forwards To Screen 2'),
          onPressed: () {
            Navigator.push(
              context, // 🤍 context = current widget of overall widget tree
              MaterialPageRoute(builder: (context) {
                return Screen2(); // 🤍 이동할 경로를 넣기.
                // 페이지 이동 시 ios / and 의 모션이 다르다. flutter inspector 에서 전환 할 수 있다.
              }),
            );
          },
        ),
      ),
    );
  }
}
