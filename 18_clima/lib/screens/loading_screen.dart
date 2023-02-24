import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // 앱을 켜자 마자 위치 정보를 받아오기 위해 initState 에 넣는다. initState only run once!
  @override
  void initState() {
    print('✨ init...................');
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    print('✨ loading_screen...................');
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    print('✨ build...................');
    return Scaffold();
  }
}
