import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationSushi extends StatefulWidget {
  const LottieAnimationSushi({super.key});

  @override
  State<LottieAnimationSushi> createState() => _LottieAnimationSushiState();
}

class _LottieAnimationSushiState extends State<LottieAnimationSushi>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
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
      "assets/animations/no_selection_sushi.json",
      controller: animationController,
    );
  }
}
