import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
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
              onPressed: () {},
              child: Image.asset('images/dice1.png'),
            ),
          ),
          Expanded(
            // Expanded 가 2개니까 화면의 반만 차지한다
            flex: 1,
            child: TextButton(
              onPressed: () {},
              child: Image.asset('images/dice1.png'),
            ), // Image.asset = AssetImage 와 동일
          ),
        ],
      ),
    );
  }
}
