import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /** - 앱을 켜자 마자 위치 정보를 받아오기 위해 initState 에 넣는다. initState only run once!
   *  - 로딩 화면에서 위치 정보와 날씨 정보를 API 통신을 통해 받으면서 spinner 를 띄운다.
   *  - 받은 데이터는 다음 화면으로 넘긴다
   */ ///

  String? weatherKey;

  @override
  void initState() {
    print('✨ init...................');
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // 우리는 이 weatherData 가 필요하기 때문에 await
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    print('✨ build...................');

    return Scaffold(
      body: Center(
          // ✨ spinner
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
