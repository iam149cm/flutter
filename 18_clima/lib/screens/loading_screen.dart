import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
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
    // 호출 할 때도 async, await 필수
    Location location = Location();
    // 🤍 await 가 있어야 null 이 안뜸!!!!!!!!! (이것 때문에 당신은 3시간 디버깅을 하였다)
    await location.getLocation();

    print('✨ loading_screen...................');

    await DotEnv.load(fileName: "key.env");
    weatherKey = DotEnv.env['WEATHER_KEY'].toString();

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$weatherKey&units=metric");

    var weatherData = await networkHelper.getData();
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
