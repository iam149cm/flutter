import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

// key를 사용하는 메서드가 2개로 늘어났기 때문에 전역변수로 리펙토링 함
Future<String> getWeatherKey = WeatherModel().getKey();
String _weatherKey = '';
const _openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

// 초기화 시 뿐만 아니라 위치정보를 새로 받아올 때도 날씨데이터를 받아오고 싶기 때문에 리펙토링 함
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    _weatherKey = await getWeatherKey;
    var url = '$_openWeatherMapURL?q=$cityName&appid=$_weatherKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // weatherData (json) 의 타입이 dynamic 이고 await 로 받아와야 하므로 자료형은 Future<dynamic> 이 된다
  Future<dynamic> getLocationWeather() async {
    // 호출 할 때도 async, await 필수
    Location location = Location();
    // 🤍 await 가 있어야 null 이 안뜸!!!!!!!!! (이것 때문에 당신은 3시간 디버깅을 하였다)
    await location.getLocation();

    print('✨ loading_screen...................');
    _weatherKey = await getWeatherKey;

    NetworkHelper networkHelper = NetworkHelper(
        "$_openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$_weatherKey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<String> getKey() async {
    await DotEnv.load(fileName: "key.env");
    _weatherKey = await DotEnv.env['WEATHER_KEY'].toString();
    return _weatherKey;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
