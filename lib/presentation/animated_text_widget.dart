import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({
    super.key,
    required this.text,
    required this.initColor,
    required this.hoverColor,
    required this.minSize,
    required this.midSize,
    required this.maxSize,
    required this.fontWeight,
    this.textStyle,
    this.fontFamily,
    this.enableFirstAnimation = false,
  });

  final String text;
  final Color initColor;
  final Color hoverColor;
  final double minSize;
  final double midSize;
  final double maxSize;
  final FontWeight fontWeight;
  final TextStyle? textStyle;
  final String? fontFamily;
  final bool enableFirstAnimation;

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  int _visibleCharacters = 0;
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    if (widget.enableFirstAnimation) {
      _runInitialAnimation();
    } else {
      _visibleCharacters = widget.text.length;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text) {
      _animationTimer?.cancel();
      _visibleCharacters = 0;
      _runInitialAnimation();
    }
  }

  void _runInitialAnimation() {
    _animationTimer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_visibleCharacters >= widget.text.length) {
        timer.cancel();
        return;
      }
      setState(() {
        _visibleCharacters++;
      });
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.text.split('');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(data.length, (index) {
        return TweenAnimationBuilder(
          tween: Tween<double>(
            begin: widget.minSize,
            end: index < _visibleCharacters ? widget.maxSize : widget.minSize,
          ),
          duration: const Duration(milliseconds: 300),
          builder: (context, size, child) {
            return Text(
              data[index],
              style: TextStyle(
                color: index < _visibleCharacters
                    ? widget.hoverColor
                    : widget.initColor,
                fontWeight: widget.fontWeight,
                fontSize: size,
                fontFamily: widget.fontFamily,
              ).merge(widget.textStyle),
            );
          },
        );
      }),
    );
  }
}
