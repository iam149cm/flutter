import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/screens/features/authentication/username_screen.dart';
import 'package:tiktok/screens/features/authentication/login_screen.dart';
import 'package:tiktok/screens/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

// UI 와 화면이동 로직을 분리하기 위해 메소드를 분리한다.
// private 선언을 위해 _를 붙여준다.
  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 🌟 SafeArea : 그 안에 있는 모든 것은 특정 공간에 있을 것이라고 보장하고 무언가에 가려지지 않는다.
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v80,
              const Text("Sign up for TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w700,
                  )),
              Gaps.v20,
              const Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailTap(context),
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: 'Use email & password',
                ),
              ),
              Gaps.v16,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: 'Continue with Apple',
              ),
              Gaps.v16,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.google),
                text: 'Continue with Google',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
