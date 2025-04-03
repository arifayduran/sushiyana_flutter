import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/parse_price_to_double.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/is_data_fetched_notifier.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/presentation/widgets/my_small_circle_button_widget.dart';
import 'package:sushiyana_flutter/presentation/screens/shopping_cart_screen.dart';

class FancyCartButton extends StatefulWidget {
  final Color buttonFillColor;
  final Color bgColor;
  final double alpha;
  final double size;
  final double height;
  final bool isDetailScreen;

  const FancyCartButton(
      {super.key,
      this.buttonFillColor = Colors.red,
      this.bgColor = barColor,
      this.alpha = 1,
      required this.size,
      required this.height,
      this.isDetailScreen = false});

  @override
  State<FancyCartButton> createState() => _FancyCartButtonState();
}

class _FancyCartButtonState extends State<FancyCartButton>
    with SingleTickerProviderStateMixin {
  late CartProvider _cartProvider;
  List<Map<String, dynamic>> _cartItems = [];
  double _cartTotal = 0.0;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOut),
    );

    _cartProvider = Provider.of<CartProvider>(context, listen: false);

    _cartItems = _cartProvider.getMatchedCartItemsWithQuantity();
    calculateCartTotal();

    isDataFetchedNotifier.addListener(() {
      if (mounted) {
        setState(() {
          _cartItems = _cartProvider.getMatchedCartItemsWithQuantity();
          calculateCartTotal();
          animateCartButton();
        });
      }
    });

    _cartProvider.addListener(() {
      if (mounted) {
        setState(() {
          _cartItems = _cartProvider.getMatchedCartItemsWithQuantity();
          calculateCartTotal();
          animateCartButton();
        });
      }
    });
  }

  void animateCartButton() {
    _scaleController.forward(from: 0.0).then((_) => _scaleController.reverse());
  }

  void calculateCartTotal() {
    double total = 0.0;

    for (var entry in _cartItems) {
      final item = entry['item'] as Item?;
      final quantity = entry['quantity'] ?? 1;

      final priceStr = item!.preis;
      final price = parsePriceToDouble(priceStr);

      total += price! * quantity;
    }
    setState(() {
      _cartTotal = total;
    });
  }

  void onTap(BuildContext context, CartProvider cartProvider) {
    if (isDataFetchedNotifier.value) {
      if (cartProvider.items.isEmpty) {
        Navigator.of(context).push(FadePageRoute(
            popOnTap: true,
            page: Stack(
              children: [
                AlertDialog(
                  backgroundColor: yanaColor.withValues(alpha: .8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  content: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                    child: const Text(
                      "Keine Artikel im Warenkorb",
                      style:
                          TextStyle(color: Colors.white, fontFamily: "Julee"),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("OK",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Julee")),
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
            page: ShoppingCartScreen(), popOnTap: false, sigmaX: 4, sigmaY: 4));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return SizedBox(
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () => onTap(context, cartProvider),
            child: SvgPicture.asset(
              "assets/images/cart_button_bg_3:4.svg",
              // ignore: deprecated_member_use
              color: widget.bgColor.withValues(alpha: widget.alpha),
            ),
          ),
          Positioned(
            bottom: widget.height - widget.size - 3, // (height - size) / 2,
            right: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: Material(
                color: widget.buttonFillColor,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => onTap(context, cartProvider),
                  splashColor: Colors.white24,
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    alignment: Alignment.center,
                    child: _cartTotal == 0.0
                        ? Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: widget.size / 1.75,
                          )
                        : Text(
                            "${_cartTotal.toStringAsFixed(2).replaceAll(".", ",")} €",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widget.isDetailScreen ? 17 : 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.5,
                              decoration: TextDecoration.none,
                              fontFamily: "Julee",
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          if (cartProvider.items.isNotEmpty)
            Positioned(
              right: 0,
              left: widget.size / 2 + 3,
              top: 0, // height - size + 3,
              height: widget.size / 3,
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
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          decoration: TextDecoration.none,
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
