import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Function onTap;
  final Color color;
  final Widget child;
  const CustomContainer({this.margin, this.onTap, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
