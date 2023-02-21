import 'package:flutter/material.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.label, required this.icon});

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      icon,
      SizedBox(
        height: 15,
      ),
      Text(label, style: kLabelTextStyle),
    ]);
  }
}
