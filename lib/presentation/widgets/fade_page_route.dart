import 'dart:ui';

import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool popOnTap;
  final double sigmaX;  
  final double sigmaY;

  FadePageRoute({required this.page, this.popOnTap = false, this.sigmaX = 15.0, this.sigmaY = 15.0})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (popOnTap) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: animation.value * sigmaX,
                      sigmaY: animation.value * sigmaX,
                    ),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0),
                    ),
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
