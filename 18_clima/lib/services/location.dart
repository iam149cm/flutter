import 'package:geolocator/geolocator.dart';

/** 유저의 위치 정보를 얻기 위한 설정
 * - app/src/main/AndroidManifest.xml
 * - ios/Runner/Info.plist
 * - 서비스 가능여부, 권한 체크, 권한 획득, 위치탐색 후 10초 내 반환값이 없으면 최근 위치 반환
 */

class Location {
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      print('getLocation if 문 안 getCurrentLocation 위..........');
      await getCurrentLocation(); // 🤍🤍🤍 await 로 호출하여야만 해 🤍🤍🤍
    } else {
      await Geolocator.requestPermission();
    }
  }

  Future<void> getCurrentLocation() async {
    Position position;

    try {
      print('getCurrentLocation try 안........');
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        timeLimit: Duration(seconds: 1),
      );
    } catch (e) {
      // ✨ 여기서 null 이 뜬다고 에러가 나면 시뮬레이터의 구글맵에서 현재 위치정보를 한 번 받아오고 어플 재시작
      position = (await Geolocator.getLastKnownPosition(
          forceAndroidLocationManager: true))!;
    }
    latitude = position.latitude;
    longitude = position.longitude;
  }
}

/** 🤍 async ? Asynchronous programming ? (<---> Synchronous programming)
 * - 이전 작업이 끝날 때 까지 기다리지 않아도 되기 때문에 더욱 효율적인 작업이 가능하다.
 * - 100명의 고객에게 여권번호를 받아야 한다고 가정 시, 한 명씩 전화하고 회신을 기다리기 vs 100명에게 한 번에 메일 돌리기 ?
 * - ex_async.dart 참조
 *
 *  🤍 Widget life cycle : initState - build - deactive
 *  - 어떤 일이 언제 일어날지 원하는 시점에 따라 코드의 위치가 달라진다
 *
 */
