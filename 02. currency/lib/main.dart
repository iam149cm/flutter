import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

class Player {
  String? name;
  Player({required this.name}); // name 을 받는 constructor
}

void main() {
  runApp(const App());
  var nico = Player(name: 'potato');
}

/** 🌟 Widget = 앱의 UI 를 만드는 레고 블럭. 플러터의 모든 것들은 위젯이다.
 * - 위젯을 만든다 = class 를 만든다.
 * - class 를 만들기 위해서는 flutter SDK 에 있는 3개의 core Widget 중 하나를 상속받아야 한다 (extend)
 * - 모든 위젯은 build 메소드를 구현해야 한다.
 * 
 * 🌟 build 메소드 ?
 * - flutter가 실행하는데 무엇을 리턴하던지 그것을 화면에 그려준다. Widget 의 UI 를 만든다.
 * 
 */ ///

// 👇 App widget = 우리 앱의 root
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 2개의 리턴 옵션 - material (구글 디자인) / cupertino (애플 디자인)
    // 👆 어떤 스타일로 보이고 싶은가? 둘중 하나 무조건 골라야 한다.
    // 모든 모바일앱은 scaffold (뼈대) 가 있어야 한다.
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            // 화면이 넘칠 경우 화면을 스크롤 가능하게 해준다

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Selina',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Total balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '\$ 5 194 482',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Button(
                        text: 'Transfer',
                        bgColor: Color(0xFFF1B33B),
                        textColor: Colors.black,
                      ),
                      Button(
                        text: 'Request',
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Wallets',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                        'view all',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CurrencyCard(
                    name: 'Euro',
                    code: 'EUR',
                    amount: '6 428',
                    icon: Icons.euro_rounded,
                    isInverted: false,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: const CurrencyCard(
                      name: 'Bitcoin',
                      code: 'BTC',
                      amount: '9 785',
                      icon: Icons.currency_bitcoin,
                      isInverted: true,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: const CurrencyCard(
                      name: 'Dollar',
                      code: 'USD',
                      amount: '428',
                      icon: Icons.attach_money_outlined,
                      isInverted: false,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
