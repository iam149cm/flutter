import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  // main.dart 에서 named route 를 지정 시 String 으로 사용하면 오타를 잡아내지 못하므로
  // 해당 클래스마다 id를 전역변수로 지정 해 주고 가져다 쓰는 것이 오타 예방에 효과적이다
  // id는 static 속성 으로 지정해서 class 의 생성, 초기화 (+build..) 없이도 가져다 쓸 수 있게 함!

  // static - 해당 클래스에 전반적으로 적용되는 변동 없는 정적 값. 변수와 메서드 둘 다 적용할 수 있다.
  // 메서드에 적용 하는 경우 : 특정 클래스의 생성 없이 해당 메서드만 사용하기 원할 경우. ex: static void
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

/** ✨ mixin - class 에게 새로운 능력을 부여하는 것!
 * - 부모의 상속 여부와 상관 없이 다양한 클래스들의 코드를 재사용 할 수 있다.
 * - with 키워드를 사용하여 2개 이상 재사용 가능. 이로 인한 유지보수 용이성 향상
 * - 상속의 경우 해당 class 의 메서드를 전체 override 하지만 mixin 은 필요한 부분만 골라 쓰는 것이 가능.
 */ ///

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // 선언 하고 나중에 초기화 할 객체는 late 를 붙이기
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      // Q. vsync - who's going to provide this animation controller?
      // class 에 with 로 Ticker를 붙여 사용하기 때문에 this
      vsync: this,
      // 최대값을 100으로 설정하고 value 를 찍어서 loading 수치를 표현할 수 있다. ( 1 -> 100% )
      // upperBound: 100,
    );

    // animation 은 layer 와도 같다.
    // animation 의 parent = animation Controller. what will we apply this curve to?
    // ✨ curve 를 사용 할 때는 upperBound 가 최대 1이다. decelerate는 증가폭이 1에 가까울수록 줄어드는 형태.
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    // ✨ 스무스한 애니메이션 (ex 색깔 변경) 을 위해 사용하는 ColorTween
    // tween 은 시작값, 종료값을 받아 시작--종료의 애니메이션을 제공한다
    animation = ColorTween(begin: Colors.cyan.shade100, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {}); // 필수!
    });
  }

  @override
  void dispose() {
    // 반복적인 animation controller 를 사용 할 경우 앱(화면)이 꺼져도 controller 는 계속 구동하면서 리소스를 먹는다
    // 그렇기 때문에 dispose 단계 에서 앱(화면)이 꺼질 때 animation controller 도 종료시켜야 한다.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  // 애니메이션 적용을 위한 Hero widget
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 250),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              color: Colors.lightBlueAccent,
              onPressed: () {
                // named route이므로 pushNamed!
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
