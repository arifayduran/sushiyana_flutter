import 'package:flutter/material.dart';

class WarenKorbText extends StatelessWidget {
  const WarenKorbText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'W',
          style: TextStyle(
            fontSize: 26,
            decoration: TextDecoration.none,
            fontFamily: "Julee",
            fontWeight: FontWeight.w700,
            color: Colors.white.withAlpha(200),
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 3.0,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
        Text(
          'AREN',
          style: TextStyle(
            fontSize: 22,
            decoration: TextDecoration.none,
            fontFamily: "Julee",
            fontWeight: FontWeight.w700,
            color: Colors.white.withAlpha(200),
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 3.0,
                color: Colors.black.withValues(alpha: .6),
              ),
            ],
          ),
        ),
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.red.withValues(alpha: .8),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        Text(
          'K',
          style: TextStyle(
            fontSize: 26,
            decoration: TextDecoration.none,
            fontFamily: "Julee",
            fontWeight: FontWeight.w700,
            color: Colors.white.withAlpha(200),
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 3.0,
                color: Colors.black.withValues(alpha: .6),
              ),
            ],
          ),
        ),
        Text(
          'ORB',
          style: TextStyle(
            fontSize: 22,
            decoration: TextDecoration.none,
            fontFamily: "Julee",
            fontWeight: FontWeight.w700,
            color: Colors.white.withAlpha(200),
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 3.0,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
