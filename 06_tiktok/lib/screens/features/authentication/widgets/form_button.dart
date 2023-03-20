import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        // AnimatedContainer : decoration 이 바뀌었을 때 애니메이션 효과를 준다.
        duration: const Duration(milliseconds: 5),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: disabled
                ? Colors.grey.shade300
                : Theme.of(context).primaryColor),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 5),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
