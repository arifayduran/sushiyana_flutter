import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';

class CartQuantityButton extends StatefulWidget {
  final String id;

  const CartQuantityButton({
    super.key,
    required this.id,
  });

  @override
  State<CartQuantityButton> createState() => _CartQuantityButtonState();
}

class _CartQuantityButtonState extends State<CartQuantityButton>
    with SingleTickerProviderStateMixin {
  bool showMenu = false;
  late CartProvider _cartProvider;
  Timer? _hideMenuTimer;

  @override
  void initState() {
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  void timerToggleHide() {
    _hideMenuTimer?.cancel();
    if (showMenu) {
      _hideMenuTimer = Timer(const Duration(milliseconds: 3500), () {
        if (mounted) {
          setState(() {
            showMenu = false;
          });
        }
      });
    }
  }

  void toggleMenu() {
    setState(() {
      showMenu = !showMenu;
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
      setState(() {
        showMenu = false;
      });
    }
    timerToggleHide();
  }

  @override
  void dispose() {
    _hideMenuTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    final amount = cartProvider.getAmountForItem(widget.id);
    double logicalWidth = MediaQuery.of(context).size.width;
    double circleButtonSize = logicalWidth > 500 ? 40 : 30;
    double circleIconSize = logicalWidth > 500 ? 30 : 20;

    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: logicalWidth > 500 ? 10 : 5,
        children: [
          if (showMenu)
            AnimatedOpacity(
              opacity: showMenu ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: MySmallCircleButtonWidget(
                onTap: decrement,
                size: circleButtonSize * 0.8,
                strokewidth: 0.5,
                bgColor: barColor,
                child: Icon(
                  Icons.remove,
                  size: circleIconSize * 0.8,
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
                  ? Flexible(
                      child: Text(
                        amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Julee",
                            decoration: TextDecoration.none),
                      ),
                    )
                  : Icon(
                      Icons.add,
                      size: circleIconSize,
                      color: Colors.white,
                    ),
            ),
          ),
          if (showMenu)
            AnimatedOpacity(
              opacity: showMenu ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: MySmallCircleButtonWidget(
                onTap: increment,
                size: circleButtonSize * 0.8,
                strokewidth: 0.5,
                bgColor: barColor,
                child: Icon(
                  Icons.add,
                  size: circleIconSize * 0.8,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
