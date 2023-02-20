import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Dicee!'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1; // 변수 생성은 단 한번만
  int rightDice = 1;

  void getRandom() {
    setState(() {
      leftDice = Random().nextInt(6) + 1; // 1~6 사이의 랜덤 넘버 생성
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            // Expanded : 가로/세로 중 작은 사이즈로 최대한 맞춤
            // flex: 2, // flex에 지정한 수치만큼 차지한다
            child: TextButton(
              // FlatButton 의 대체 => TextButton
              onPressed:  getRandom,
              child: Image.asset('images/dice$leftDice.png'),
            ),
          ),
          Expanded(
            // Expanded 가 2개니까 화면의 반만 차지한다
            flex: 1,
            child: TextButton(
              onPressed:  getRandom,
              child: Image.asset('images/dice$rightDice.png'),
            ), // Image.asset = AssetImage 와 동일
          ),
        ],
      ),
    );
  }
}
