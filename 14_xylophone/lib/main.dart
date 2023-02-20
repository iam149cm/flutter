import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int num) {
    final player = AudioPlayer();

    player.play(AssetSource('note$num.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red)),
                  onPressed: () {
                    playSound(1);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.orange)),
                  onPressed: () {
                    playSound(2);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.yellow)),
                  onPressed: () {
                    playSound(3);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green)),
                  onPressed: () {
                    playSound(4);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue)),
                  onPressed: () {
                    playSound(5);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue.shade900)),
                  onPressed: () {
                    playSound(6);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.purple)),
                  onPressed: () {
                    playSound(7);
                  },
                  child: Text(''),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
