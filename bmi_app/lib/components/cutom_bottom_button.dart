import 'package:flutter/material.dart';

import '../theme.dart';

class CustomBottomButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  const CustomBottomButton({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        child: child,
        color: kPrimaryAccentColor,
      ),
    );
  }
}
