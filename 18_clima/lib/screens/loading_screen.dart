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
    // 호출 할 때도 async, await 필수
    Location location = Location();
    // await 가 있어야 null 이 안뜸!!!!!!!!! (이것 때문에 당신은 3시간 디버깅을 하였다)
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
