import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/** 🤍 async ? Asynchronous programming ? (<---> Synchronous programming)
 * - 이전 작업이 끝날 때 까지 기다리지 않아도 되기 때문에 더욱 효율적인 작업이 가능하다.
 * - 100명의 고객에게 여권번호를 받아야 한다고 가정 시, 한 명씩 전화하고 회신을 기다리기 vs 100명에게 한 번에 메일 돌리기 ?
 * - scratch.dart 참조
 *
 *  🤍 Widget life cycle : initState - build - deactive
 *  - 어떤 일이 언제 일어날지 원하는 시점에 따라 코드의 위치가 달라진다
 *
 */

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // 'async' is for time consuming task
  void getLocation() async {
    /** 유저의 위치 정보를 얻기 위한 설정
     * - app/src/main/AndroidManifest.xml
     * - ios/Runner/Info.plist
     * - 서비스 가능여부, 권한 체크, 권한 획득, 위치탐색 후 10초 내 반환값이 없으면 최근 위치 반환
     */

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      printLocation();
    } else {
      await Geolocator.requestPermission();
    }
  }

  printLocation() async {
    // Future<Position> 라고 선언하면 번호표가 print 된다 (Position 으로 선언하면 커피)
    Position? position = null;

    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        timeLimit: Duration(seconds: 5), // 5초가 지나도 받아오지 못하면 마지막 장소를 받아온다
      );
    } catch (e) {
      position = await Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: true,
      );
    }

    print(position);
  }

  // 앱을 켜자 마자 위치 정보를 받아오기 위해 initState 에 넣는다. initState only run once!
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
