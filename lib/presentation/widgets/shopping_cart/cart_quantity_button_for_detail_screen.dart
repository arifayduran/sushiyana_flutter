import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/my_small_circle_button_widget.dart';

class CartQuantityButtonDetailScreen extends StatefulWidget {
  final String id;

  const CartQuantityButtonDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<CartQuantityButtonDetailScreen> createState() => _CartQuantityButtonState();
}

class _CartQuantityButtonState extends State<CartQuantityButtonDetailScreen>
    with SingleTickerProviderStateMixin {
  bool showMenu = false;
  late CartProvider _cartProvider;
  Timer? _hideMenuTimer;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimationDecrement;
  late Animation<Offset> _offsetAnimationIncrement;

  @override
  void initState() {
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimationDecrement = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _offsetAnimationIncrement = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  void timerToggleHide() {
    _hideMenuTimer?.cancel();
    if (showMenu) {
      _hideMenuTimer = Timer(const Duration(milliseconds: 3500), () {
        if (mounted) {
          _animationController.reverse().then((_) {
            if (mounted) {
              setState(() {
                showMenu = false;
              });
            }
          });
        }
      });
    }
  }

  void toggleMenu() {
    setState(() {
      if (!showMenu) {
        showMenu = true;
        _animationController.forward();
      } else {
        _animationController.reverse().then((_) {
          if (mounted) {
            setState(() {
              showMenu = false;
            });
          }
        });
      }
    });
    timerToggleHide();
  }

  void increment() {
    _cartProvider.addItem(widget.id);
    timerToggleHide();
  }

  void decrement() {
    _cartProvider.removeSingleItem(widget.id);
    if (_cartProvider.getAmountForItem(widget.id) == 0) {
      _animationController.reverse().then((_) {
        if (mounted) {
          setState(() {
            showMenu = false;
          });
        }
      });
    }
    timerToggleHide();
  }

  @override
  void dispose() {
    _hideMenuTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    final amount = cartProvider.getAmountForItem(widget.id);
    double logicalWidth = MediaQuery.of(context).size.width;
    double circleButtonSize = logicalWidth > 500 ? 43 : 30;
    double circleIconSize = logicalWidth > 500 ? 30 : 20;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: logicalWidth > 500 ? 7 : 3,
      children: [
        if (showMenu)
          SlideTransition(
            position: _offsetAnimationDecrement,
            child: MySmallCircleButtonWidget(
              onTap: decrement,
              size: circleButtonSize * 0.7,
              strokewidth: 0.5,
              bgColor: barColor,
              child: Icon(
                Icons.remove,
                size: circleIconSize * 0.7,
                color: Colors.white,
              ),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: logicalWidth > 500 ? 7 : 3,
          children: [
            if (showMenu)
              SlideTransition(
                position: _offsetAnimationIncrement,
                child: MySmallCircleButtonWidget(
                  onTap: increment,
                  size: circleButtonSize * 0.7,
                  strokewidth: 0.5,
                  bgColor: barColor,
                  child: Icon(
                    Icons.add,
                    size: circleIconSize * 0.7,
                    color: Colors.white,
                  ),
                ),
              ),
            Center(
              child: MySmallCircleButtonWidget(
                onTap: () {
                  if (amount == 0) {
                    increment();
                  }
                  toggleMenu();
                },
                size: circleButtonSize,
                strokewidth: 0.5,
                bgColor: amount > 0 ? mattRed : yanaColor,
                splashColor: amount > 0
                    ? const Color.fromARGB(255, 117, 23, 16)
                    : yanaColorDark,
                child: amount > 0
                    ? Text(
                        amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Julee",
                            decoration: TextDecoration.none),
                      )
                    : Icon(
                        Icons.add,
                        size: circleIconSize,
                        color: Colors.white,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
