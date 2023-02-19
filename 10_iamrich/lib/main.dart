import 'package:flutter/material.dart';

void main() {
  // The main function is the starting point for all flutter app.
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // https://api.flutter.dev/flutter/material/AppBar-class.html
          // https://m3.material.io/styles/color/overview
          title: const Text('I Am Rich'),
          centerTitle: true,
          backgroundColor: const Color(0XFF1f1a2e),
          elevation: 0,
        ),
        backgroundColor: const Color(0XFF1f1a2e),
        body: const Center(
          child: Image(
            // image asset 을 추가하려면 pubspec.yaml 에서 assets: 부분을 주석해제한다
            // NetworkImage( 'https://cdn.pixabay.com/photo/2018/02/27/13/31/diamond-3185447__480.jpg')

            // App icon 파일 생성하기 - https://www.appicon.co/
            // App icon 경로 - android : project-path\android\app\src\main\res
            // App icon 경로 - ios : project-path\ios\Runner\Assets.xcassets\AppIcon.appiconset
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
