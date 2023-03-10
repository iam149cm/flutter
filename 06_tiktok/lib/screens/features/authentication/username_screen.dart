import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
// ๐ Controller : ์ฝ๋, ๋ฉ์๋ ๋ฑ์ผ๋ก TextField ์ ๊ฐ์ ์์ ฏ์ ์ปจํธ๋กค ํ  ์ ์๊ฒ ํด ์ค๋ค.
// ์์ : statefulwidget - ์ปจํธ๋กค๋ฌ ์์ฑ - ์์ ฏ์ ์ปจํธ๋กค๋ฌ ์ง์  ํด ์ฃผ๊ณ  - initState์์ ๋ณํ๋ฅผ ๊ฐ์ง
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    super.initState();

    // ๐ ์ปจํธ๋กค๋ฌ์ listner๋ฅผ ์ถ๊ฐํ๋ค
    _usernameController.addListener(() {
      // print(_usernameController.text); // ๐ Text field ์ ๋ฌด์ธ๊ฐ๋ฅผ ์๋ ฅํ๋ฉด ์ฝ์์ ์ฐํ๋ค
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gaps.v40,
          const Text(
            'Create username',
            style: TextStyle(
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.v10,
          const Text(
            'You can always change this later.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v16,
          // ๐ ํ์คํธ ์ธํํ๋ ๋ถ๋ถ์ ์ค์ 
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              enabledBorder: UnderlineInputBorder(
                // enabledBorder-ํ๋ฉด์ ๋ง ์ง์ํ์ ๋
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                // focusedBorder-์ปค์๊ฐ ์ฌ๋ผ๊ฐ์ ๋
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            cursorColor: Theme.of(context).primaryColor,
          ),
          Gaps.v16,
          FractionallySizedBox(
            widthFactor: 1,
            child: AnimatedContainer(
              // AnimatedContainer : decoration ์ด ๋ฐ๋์์ ๋ ์ ๋๋ฉ์ด์ ํจ๊ณผ๋ฅผ ์ค๋ค.
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size16,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size5),
                  color: _username.isEmpty
                      ? Colors.grey.shade300
                      : Theme.of(context).primaryColor),
              child: const Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
