import 'dart:ui';

import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: animation.value * 15,
                    sigmaY: animation.value * 15,
                  ),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0),
                  ),
                ),
                FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ],
            );
          },
        );
}
