import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/screens/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
          // 👉 모든 Scaffold, AppBar 의 배경화면을 ✨전역✨으로 변경할 수 있다.
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const SignUpScreen(),
    );
  }
}
