import 'package:flutter/material.dart';

class AnimatedTabSwitcher extends StatefulWidget {
  final int mainTabMode;
  final Widget child;

  const AnimatedTabSwitcher({
    super.key,
    required this.mainTabMode,
    required this.child,
  });

  @override
  State<AnimatedTabSwitcher> createState() => _AnimatedTabSwitcherState();
}

class _AnimatedTabSwitcherState extends State<AnimatedTabSwitcher> {
  int? _previousTabMode;
  Widget? _previousChild;
  double _opacityNew = 1.0;
  double _opacityOld = 0.0;

  @override
  void didUpdateWidget(covariant AnimatedTabSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.mainTabMode != _previousTabMode) {
      setState(() {
        _previousChild = oldWidget.child;
        _opacityOld = 1.0; // Altes Widget beginnt sichtbar
        _opacityNew = 0.0; // Neues Widget beginnt unsichtbar
      });

      // Starte die Überblendung
      Future.delayed(const Duration(milliseconds: 0), () {
        if (mounted) {
          setState(() {
            _opacityOld = 0.0; // Altes Widget ausblenden
            _opacityNew = 1.0; // Neues Widget einblenden
          });
        }
      });

      // Entferne das alte Widget nach der Animation
      Future.delayed(const Duration(milliseconds: 250), () {
        if (mounted) {
          setState(() {
            _previousChild = null;
            _previousTabMode = widget.mainTabMode;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Altes Widget (wird langsam ausgeblendet)
        if (_previousChild != null)
          AnimatedOpacity(
            opacity: _opacityOld,
            duration: const Duration(milliseconds: 500),
            child: _previousChild,
          ),

        // if (_previousChild != null)
        //   Expanded(
        //       child: Container(
        //     color: tabBackground,
        //   )),

        // Neues Widget (wird langsam eingeblendet)
        AnimatedOpacity(
          opacity: _opacityNew,
          duration: const Duration(milliseconds: 500),
          child: widget.child,
        ),
      ],
    );
  }
}
