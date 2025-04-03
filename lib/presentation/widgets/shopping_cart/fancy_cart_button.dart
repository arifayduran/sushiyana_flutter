import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';
import 'package:sushiyana_flutter/presentation/screens/shopping_cart_screen.dart';

class FancyCartButton extends StatelessWidget {
  final Color buttonFillColor;
  final Color bgColor;
  final double alpha;
  final double size;
  final double height;

  const FancyCartButton(
      {super.key,
      this.buttonFillColor = Colors.red,
      this.bgColor = barColor,
      this.alpha = 1,
      required this.size,
      required this.height});

  // Removed the misplaced Provider.of<CartProvider> call

  void onTap(BuildContext context, CartProvider cartProvider) {
    if (cartProvider.items.isEmpty) {
      Navigator.of(context).push(FadePageRoute(
          popOnTap: true,
          page: Stack(
            children: [
              AlertDialog(
                backgroundColor: yanaColor.withValues(alpha: .8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                content: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: const Text(
                    "Keine Artikel im Warenkorb",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child:
                        const Text("OK", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: MySmallCircleButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    strokewidth: 0.5,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )),
            ],
          )));
    } else {
      Navigator.of(context).push(FadePageRoute(
          page: ShoppingCartScreen(), popOnTap: false, sigmaX: 3, sigmaY: 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () => onTap(context, cartProvider),
            child: SvgPicture.asset(
              "assets/images/cart_button_bg_3:4.svg",
              // ignore: deprecated_member_use
              color: bgColor.withValues(alpha: alpha),
            ),
          ),
          Positioned(
            bottom: height - size - 3, // (height - size) / 2,
            right: 0,
            left: 0,
            child: Material(
              color: buttonFillColor,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => onTap(context, cartProvider),
                splashColor: Colors.white24,
                child: Container(
                  width: size,
                  height: size,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: size / 1.75,
                  ),
                ),
              ),
            ),
          ),
          if (cartProvider.items.isNotEmpty)
            Positioned(
              right: 0,
              left: 32,
              top: height - size + 3,
              child: GestureDetector(
                onTap: () => onTap(context, cartProvider),
                child: Container(
                  padding: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    // gradient:
                    //     const LinearGradient(colors: [yanaColor, yanaColorDark]),
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      cartProvider.cartLength.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Julee"),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
