import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/screens/features/authentication/password_screen.dart';
import 'package:tiktok/screens/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
// 🌟 Controller : 코드, 메서드 등으로 TextField 와 같은 위젯을 컨트롤 할 수 있게 해 준다.
// 순서 : statefulwidget - 컨트롤러 생성 - 위젯에 컨트롤러 지정 해 주고 - initState에서 변화를 감지
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  @override
  void initState() {
    super.initState();

    // 🌟 컨트롤러에 listner를 추가한다
    _emailController.addListener(() {
      // print(_usernameController.text); // 👉 Text field 에 무언가를 입력하면 콘솔에 찍힌다
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose(); // 다른 것들을 모두 정리 후 마지막에 호출
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    // perform some validation
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email Not Valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    // 키보드 바깥쪽을 탭할 시 키보드를 없앤다 (unfocus 상태로 만듦)
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v40,
            const Text(
              'What is your Email?',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w600,
              ),
            ),

            Gaps.v16,
            // 👉 텍스트 인풋하는 부분의 설정
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress, // 이메일 형식의 키보드 사용
              autocorrect: false, // 키보드의 자동완성을 끈다
              onEditingComplete: _onSubmit, // 키보드의 done 을 눌렀을 때 실행
              decoration: InputDecoration(
                hintText: "Email",
                errorText: _isEmailValid(),
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
            GestureDetector(
              child: FormButton(
                  disabled: _email.isEmpty || _isEmailValid() != null),
              onTap: _onSubmit,
            ),
          ]),
        ),
      ),
    );
  }
}
