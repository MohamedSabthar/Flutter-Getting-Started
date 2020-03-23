import '../theme.dart';
import 'package:flutter/material.dart';

class CustomRoundedIconButton extends StatelessWidget {
  final Widget icon;
  final Function onTap;
  const CustomRoundedIconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      onPressed: onTap,
      fillColor: kRoundedButtonColor,
      elevation: 10,
      shape: CircleBorder(),
      child: icon,
    );
  }
}
