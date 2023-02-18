import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
// 🌟 Controller : 코드, 메서드 등으로 TextField 와 같은 위젯을 컨트롤 할 수 있게 해 준다.
// 순서 : statefulwidget - 컨트롤러 생성 - 위젯에 컨트롤러 지정 해 주고 - initState에서 변화를 감지
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    super.initState();

    // 🌟 컨트롤러에 listner를 추가한다
    _usernameController.addListener(() {
      // print(_usernameController.text); // 👉 Text field 에 무언가를 입력하면 콘솔에 찍힌다
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
          // 👉 텍스트 인풋하는 부분의 설정
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              enabledBorder: UnderlineInputBorder(
                // enabledBorder-화면에 막 진입했을 때
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                // focusedBorder-커서가 올라갔을 때
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
              // AnimatedContainer : decoration 이 바뀌었을 때 애니메이션 효과를 준다.
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
