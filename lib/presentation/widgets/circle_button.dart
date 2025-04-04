import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.onPressed,
    this.size = 30,
    this.highlightColor = const Color.fromARGB(130, 59, 69, 160),
    this.splashColor = const Color.fromARGB(130, 59, 69, 160),
    this.bgColor = const Color.fromARGB(120, 74, 71, 62),
    this.strokewidth = 0.3,
    required this.icon,
  });

  final double size;
  final VoidCallback? onPressed;
  final Icon icon;
  final Color highlightColor;
  final Color splashColor;
  final Color bgColor;
  final double strokewidth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: size,
      splashColor: splashColor,
      highlightColor: highlightColor,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: size,
        minHeight: size,
      ),
      color: bgColor,
    );
  }
}
