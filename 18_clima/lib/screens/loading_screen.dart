import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // 앱을 켜자 마자 위치 정보를 받아오기 위해 initState 에 넣는다. initState only run once!

  double? latitude;
  double? longitude;
  String? weatherKey;

  @override
  void initState() {
    print('✨ init...................');
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // 호출 할 때도 async, await 필수
    Location location = Location();
    // 🤍 await 가 있어야 null 이 안뜸!!!!!!!!! (이것 때문에 당신은 3시간 디버깅을 하였다)
    await location.getLocation();

    print('✨ loading_screen...................');
    latitude = location.latitude;
    longitude = location.longitude;
    await DotEnv.load(fileName: "key.env");
    weatherKey = DotEnv.env['WEATHER_KEY'].toString();

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$weatherKey");

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    print('✨ build...................');

    return Scaffold();
  }
}
