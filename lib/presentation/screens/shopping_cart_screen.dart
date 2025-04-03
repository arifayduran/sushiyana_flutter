import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sushiyana_flutter/application/navigator_key.dart';
import 'package:sushiyana_flutter/application/parse_price_to_double.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/application/services/order_service.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/domain/order_item.dart';
import 'package:sushiyana_flutter/presentation/screens/table_and_notes_screen.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/blur_gradient.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_gradient_button_widget.dart';
import 'package:sushiyana_flutter/presentation/widgets/my_small_circle_button_widget.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/shopping_cart_tile.dart';
import 'package:sushiyana_flutter/presentation/widgets/waren_korb_text.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({
    super.key,
  });

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  late FixedExtentScrollController _scrollController;
  late CartProvider _cartProvider;
  List<Map<String, dynamic>> _cartItems = [];
  double _cartTotal = 0.0;

  @override
  void initState() {
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);

    _cartItems = _cartProvider.getMatchedCartItemsWithQuantity();

    calculateCartTotal();

    _cartProvider.addListener(() {
      if (mounted) {
        setState(() {
          _cartItems = _cartProvider.getMatchedCartItemsWithQuantity();
          calculateCartTotal();
        });
      }
    });

    int initialIndex = (_cartItems.length.isEven)
        ? (_cartItems.length / 2).floor() - 1
        : (_cartItems.length / 2).floor();
    _scrollController = FixedExtentScrollController(initialItem: initialIndex);

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _scrollController.animateToItem(0,
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut);
      }
    });
  }

  void incrementMethod(String id) {
    setState(() {
      _cartItems
          .firstWhere((element) => element['item'].id == id)['quantity']++;
    });
    calculateCartTotal();
  }

  void decrementMethod(String id) {
    setState(() {
      _cartItems
          .firstWhere((element) => element['item'].id == id)['quantity']--;
      if (_cartItems
              .firstWhere((element) => element['item'].id == id)['quantity'] <=
          0) {
        _cartItems.removeWhere((element) => element['item'].id == id);
      }
      calculateCartTotal();
    });
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

  Future<bool> _askDeleteItem(BuildContext context, bool all) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: yanaColor.withValues(alpha: .8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Text(
                  "${all ? "Möchten Sie alle " : ""}Artikel aus dem Warenkorb entfernen?",
                  style: TextStyle(color: Colors.white, fontFamily: "Julee"),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Nein",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Ja",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void _noItems(BuildContext context) {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.of(context).pop();
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
                    "Keine Artikel im Warenkorb.",
                    style: TextStyle(color: Colors.white, fontFamily: "Julee"),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      navigatorKey.currentState?.pop();
                    },
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
    });
  }

  void _customAlertDialog(BuildContext context, String message) {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
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
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white, fontFamily: "Julee"),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      navigatorKey.currentState?.pop();
                    },
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
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double logicalHeight = MediaQuery.of(context).size.height;
    double logicalWidth = MediaQuery.of(context).size.width;

    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return Container(
      width: logicalWidth,
      height: logicalHeight,
      color: Colors.black.withValues(alpha: 0.2),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Consumer<CartProvider>(
                builder: (context, provider, child) {
                  if (provider.items.isEmpty || _cartItems.isEmpty) {
                    _noItems(context);
                    return const SizedBox();
                  } else {
                    return ListWheelScrollView.useDelegate(
                      controller: _scrollController,
                      squeeze: 0.92,
                      diameterRatio: 3,
                      itemExtent: 110,
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: _cartItems.length,
                        builder: (context, index) {
                          final item = _cartItems[index]['item'];
                          return Dismissible(
                            confirmDismiss: (direction) =>
                                _askDeleteItem(context, false),
                            key: Key(item.id),
                            onDismissed: (direction) {
                              setState(() {
                                _cartItems.removeAt(index);
                                _cartProvider.removeItemQuantity(item.id);
                                calculateCartTotal();
                              });
                            },
                            child: ShoppingCartTile(
                              item: _cartItems[index]['item'],
                              incrementMethod: () => incrementMethod(item.id),
                              decrementMethod: () => decrementMethod(item.id),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: BlurGradient(
              startColor: yanaColor.withValues(alpha: 0.8),
              height: logicalHeight * 0.20,
              width: logicalWidth,
              blurTotal: 4,
            ),
          ),
          Positioned(
            bottom: 0,
            child: BlurGradient(
              startColor: shoppingSecondary,
              height: logicalHeight * 0.20,
              width: logicalWidth,
              blurTotal: 4,
              reverse: true,
            ),
          ),
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: Center(
              child: WarenKorbText(),
            ),
          ),
          Positioned(
              top: 25,
              right: logicalWidth < 550 ? 25 : (logicalWidth - 550) / 2 + 25,
              child: MySmallCircleButtonWidget(
                onTap: () {
                  Navigator.of(context).pop();
                },
                size: 37,
                strokewidth: 0.5,
                child: Icon(
                  Icons.close,
                  size: 22,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              )),
          Positioned(
              top: 25,
              left: logicalWidth < 550 ? 25 : (logicalWidth - 550) / 2 + 25,
              child: MySmallCircleButtonWidget(
                onTap: () {
                  _askDeleteItem(context, true).then((value) {
                    if (value == true) {
                      setState(() {
                        _cartProvider.clearCart();
                        _cartItems.clear();
                        calculateCartTotal();
                      });
                    }
                  });
                },
                size: 37,
                strokewidth: 0.5,
                child: Icon(
                  Icons.delete,
                  size: 22,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              )),
          Positioned(
            bottom: 115,
            left: 21,
            right: 21,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Summe:",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Julee",
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      Text(
                        "${_cartTotal.toStringAsFixed(2).replaceAll(".", ",")} €",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Julee",
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 21,
            right: 21,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: MyGradientButtonWidget(
                  width: 500,
                  height: 50,
                  borderStroke: 1.5,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: Colors.grey.withValues(alpha: 0.4),
                  gradient: const LinearGradient(
                    colors: [
                      yanaColor,
                      Color.fromARGB(255, 148, 88, 207),
                      shoppingSecondary,
                    ],
                  ),
                  shadowColor: Colors.black.withValues(alpha: 0.5),
                  child: Shimmer.fromColors(
                    loop: 3,
                    period: const Duration(seconds: 2),
                    baseColor: const Color.fromARGB(255, 255, 255, 255),
                    highlightColor: const Color.fromARGB(255, 0, 0, 0),
                    child: Text(
                      "Zum Tisch bestellen",
                      style: TextStyle(
                          fontSize: 18,
                          // fontFamily: "Julee",
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      FadePageRoute(
                        popOnTap: true,
                        page: TableAndNotesScreen(),
                      ),
                    );

                    if (result != null) {
                      final tableNumber = result['tableNumber'];
                      final notes = result['notes'];

                      final orderService = OrderService();

                      bool success = await orderService.sendOrder(
                        customerName: tableNumber,
                        items: _cartItems
                            .map((entry) => OrderItem(
                                  name: entry['item'].artikelname,
                                  quantity: entry['quantity'],
                                  price:
                                      parsePriceToDouble(entry['item'].preis)!,
                                ))
                            .toList(),
                        totalPrice: _cartTotal,
                        notes: notes ?? '',
                      );

                      if (success && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Bestellung erfolgreich gesendet!')),
                        );
                        cartProvider.clearCart();
                        _cartItems.clear();
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Fehler bei der Bestellung.')),
                          );
                        }
                      }
                    }

                    // _customAlertDialog(context,
                    //     "Zurzeit arbeiten wie an dieser Funktion. Bitte bestellen Sie bei unseren Mitarbeitern.");
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Zurück zum Menü",
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: "Julee",
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                    color: Colors.white.withValues(alpha: 0.6),
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
