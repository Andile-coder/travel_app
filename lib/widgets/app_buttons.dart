import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class AppButton extends StatelessWidget {
  final color;
  final backgroundColor;
  final Widget child;
  double size;
  final Color borderColor;
  AppButton(
      {Key? key,
      required this.backgroundColor,
      required this.borderColor,
      required this.color,
      required this.child,
      required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(child: child),
    );
  }
}
