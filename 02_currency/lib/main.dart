import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

/** π Widget = μ±μ UI λ₯Ό λ§λλ λ κ³  λΈλ­. νλ¬ν°μ λͺ¨λ  κ²λ€μ μμ ―μ΄λ€.
 * - μμ ―μ λ§λ λ€ = class λ₯Ό λ§λ λ€.
 * - class λ₯Ό λ§λ€κΈ° μν΄μλ flutter SDK μ μλ 3κ°μ core Widget μ€ νλλ₯Ό μμλ°μμΌ νλ€ (extend)
 * - λͺ¨λ  μμ ―μ build λ©μλλ₯Ό κ΅¬νν΄μΌ νλ€.
 * 
 * π build λ©μλ ?
 * - flutterκ° μ€ννλλ° λ¬΄μμ λ¦¬ν΄νλμ§ κ·Έκ²μ νλ©΄μ κ·Έλ €μ€λ€. Widget μ UI λ₯Ό λ§λ λ€.
 * 
 */ ///

// π App widget = μ°λ¦¬ μ±μ root
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 2κ°μ λ¦¬ν΄ μ΅μ - material (κ΅¬κΈ λμμΈ) / cupertino (μ ν λμμΈ)
    // π μ΄λ€ μ€νμΌλ‘ λ³΄μ΄κ³  μΆμκ°? λμ€ νλ λ¬΄μ‘°κ±΄ κ³¨λΌμΌ νλ€.
    // λͺ¨λ  λͺ¨λ°μΌμ±μ scaffold (λΌλ) κ° μμ΄μΌ νλ€.
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            // νλ©΄μ΄ λμΉ  κ²½μ° νλ©΄μ μ€ν¬λ‘€ κ°λ₯νκ² ν΄μ€λ€

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
                    order: 1,
                    name: 'Euro',
                    code: 'EUR',
                    amount: '6 428',
                    icon: Icons.euro_rounded,
                    isInverted: false,
                  ),
                  const CurrencyCard(
                    order: 2,
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 785',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                  ),
                  const CurrencyCard(
                    order: 3,
                    name: 'Dollar',
                    code: 'USD',
                    amount: '428',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
