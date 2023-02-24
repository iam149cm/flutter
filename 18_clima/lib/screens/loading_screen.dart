import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;

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
    // 🤍 await 가 있어야 null 이 안뜸!!!!!!!!! (이것 때문에 당신은 3시간 디버깅을 하였다)
    await location.getLocation();

    print('✨ loading_screen...................');
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=44aa6ccca698c1bfd7fdc89e9ecb4e2f");

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      var weatherDesciption = decodedData['weather'][0]['description'];

      var temperature = decodedData['main']['temp'];
      var condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(weatherDesciption);

      await DotEnv.load(fileName: "key.env");
      print(DotEnv.env['SUPER_SECRET_API_KEY']);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('✨ build...................');
    getData();
    return Scaffold();
  }
}
