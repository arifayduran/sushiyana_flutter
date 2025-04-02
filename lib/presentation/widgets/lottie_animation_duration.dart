import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationDuration extends StatefulWidget {
  const LottieAnimationDuration(
      {super.key, required this.duration, required this.path});

  final Duration duration;
  final String path;

  @override
  State<LottieAnimationDuration> createState() =>
      _LottieAnimationDurationState();
}

class _LottieAnimationDurationState extends State<LottieAnimationDuration>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      
      widget.path,
      controller: animationController,
    );
  }
}
