import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  const BottomButton(
      {super.key, required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(
          top: 10,
        ),
        padding:
            EdgeInsets.only(bottom: 20), // iphone 의 경우 홈버튼 때문에 살짝 위로 올려주어야 한다
        width: double.infinity, // 가로의 full-width
        height: kBottomContainerHeight,
      ),
    );
  }
}
