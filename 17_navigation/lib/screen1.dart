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
              context, // π€ context = current widget of overall widget tree
              MaterialPageRoute(builder: (context) {
                return Screen2(); // π€ μ΄λν  κ²½λ‘λ₯Ό λ£κΈ°.
                // νμ΄μ§ μ΄λ μ ios / and μ λͺ¨μμ΄ λ€λ₯΄λ€. flutter inspector μμ μ ν ν  μ μλ€.
              }),
            );
          },
        ),
      ),
    );
  }
}
