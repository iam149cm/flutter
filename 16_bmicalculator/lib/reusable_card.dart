import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    required this.colour,
    required this.cardChild,
  });

  final Color colour;
  final Widget cardChild;

  // final = Immutability = Unchangable. StatelessWidget is immutable.

  // 🤍 final VS const
  // final : can be set only once.  'DateTime.now()' can be the final variable.
  // const : compile-time constant. 'DateTime.now()' can not be the const variable.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
