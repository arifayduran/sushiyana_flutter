import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/blur_gradient.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_gradient_button_widget.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/shopping_cart_tile.dart';

// if shopping card is empty, show a dialog and pop the bottom sheet
// responsable
// isvisible swipe und schliessen alle
// leeren
// if   'bestellbar': value.item.bestellbar,
// schliessen größer

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

  @override
  void initState() {
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);

    _cartItems = _cartProvider.getMatchedCartItemsWithQuantity();

    int initialIndex = (_cartItems.length / 2).floor();
    _scrollController = FixedExtentScrollController(initialItem: initialIndex);
  }

  void _noItems(BuildContext context) {
    Navigator.of(context).pop();
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
                  "Keine Artikel im Warenkorb.",
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
    return Container(
      width: logicalWidth,
      height: logicalHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -90,
            child: SizedBox(
              height: 1000,
              width: logicalWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Consumer<CartProvider>(
                  builder: (context, provider, child) {
                    if (provider.items.isEmpty || _cartItems.isEmpty) {
                      _noItems(context);
                      return const SizedBox();
                    } else {
                      return ListWheelScrollView.useDelegate(
                        controller: _scrollController,
                        squeeze: 0.92,
                        diameterRatio: 2,
                        itemExtent: 110,
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return ShoppingCartTile(
                              item: _cartItems[index]['item'],
                            );
                          },
                          childCount: _cartItems.length,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: BlurGradient(
              startColor: const Color.fromARGB(255, 202, 130, 165),
              height: 250,
              width: logicalWidth,
              blurTotal: 4,
            ),
          ),
          Positioned(
            bottom: 0,
            child: BlurGradient(
              startColor: const Color.fromARGB(255, 59, 69, 160),
              height: 250,
              width: logicalWidth,
              blurTotal: 4,
              reverse: true,
            ),
          ),
          Positioned(
            top: 70,
            right: 0,
            left: 0,
            child: SizedBox(
              width: logicalWidth,
              height: 30,
              child: Center(
                child: Text(
                  "Warenkorb",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 67,
              right: 25,
              child: MySmallCircleButtonWidget(
                onTap: () {
                  Navigator.of(context).pop();
                },
                size: 35,
                strokewidth: 0.3,
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
              )),
          // Positioned(
          //     top: 67,
          //     left: 25,
          //     child: MySmallCircleButtonWidget(
          //       onTap: () {
          //         chargeCreditAlert(context, chargeCreditNotifier);
          //       },
          //       size: 35,
          //       strokewidth: 0.3,
          //       child: const Icon(
          //         Icons.credit_card,
          //         size: 20,
          //         color: Colors.white,
          //       ),
          //     )),
          // Positioned(
          //   bottom: 115,
          //   left: 29,
          //   right: 29,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Credits:",
          //         style: Theme.of(context)
          //             .textTheme
          //             .labelLarge!
          //             .copyWith(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.white.withValues(alpha: 0.7),
          //             ),
          //       ),
          //       ValueListenableBuilder<double>(
          //         valueListenable: chargeCreditNotifier,
          //         builder: (context, credit, _) {
          //           return Text(
          //             "${String.fromCharCodes(Runes('\u20B3'))} ${credit.toStringAsFixed(2)}",
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .labelLarge!
          //                 .copyWith(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w600,
          //                   color:
          //                       Colors.white.withValues(alpha: 0.7),
          //                 ),
          //           );
          //         },
          //       )
          //     ],
          //   ),
          // ),
          Positioned(
            bottom: 50,
            left: 21,
            right: 21,
            child: MyGradientButtonWidget(
              width: 351,
              height: 50,
              borderStroke: 1.5,
              borderRadius: BorderRadius.circular(10),
              borderColor: Colors.grey.withValues(alpha: 0.4),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 202, 130, 165),
                  Color.fromARGB(255, 148, 88, 207),
                  Color.fromARGB(255, 59, 69, 160),
                ],
              ),
              shadowColor: Colors.black.withValues(alpha: 0.5),
              child: Shimmer.fromColors(
                  loop: 3,
                  period: const Duration(seconds: 2),
                  baseColor: const Color.fromARGB(255, 255, 255, 255),
                  highlightColor: const Color.fromARGB(255, 0, 0, 0),
                  child: Text.rich(
                    TextSpan(
                        text: "Pay with  ",
                        style: Theme.of(context).textTheme.titleLarge,
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Text(
                              String.fromCharCodes(Runes('\u20B3')),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 23),
                            ),
                          ),
                          TextSpan(
                            text:
                                // " ${ShoppingCardSum.totalSum(shoppingListNotifier).toStringAsFixed(2)}",
                                "",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ]),
                  )),
              onPressed: () {
                // if (credit >=
                //     ShoppingCardSum.totalSum(shoppingListNotifier)) {
                //   showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: const Text("Successfully Purchased"),
                //         titleTextStyle:
                //             Theme.of(context).textTheme.bodyLarge,
                //         actions: [
                //           TextButton(
                //               onPressed: () {
                //                 shoppingCard = {};
                //                 widget.itemCountNotifier.value = 0;
                //                 credit -= ShoppingCardSum.totalSum(
                //                     shoppingListNotifier);
                //                 Navigator.of(context).pop();
                //                 Navigator.of(context).pop();
                //               },
                //               child: const Text("OK"))
                //         ],
                //       );
                //     },
                //   );
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: BackdropFilter(
                //         filter: ImageFilter.blur(
                //             sigmaX: 2.0, sigmaY: 2.0),
                //         child: const Text(
                //           "Not enough credit",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       duration: const Duration(seconds: 3),
                //       action: SnackBarAction(
                //         label: 'Charge',
                //         textColor: Colors.white,
                //         onPressed: () {
                //           chargeCreditAlert(
                //               context, chargeCreditNotifier);
                //         },
                //       ),
                //       behavior: SnackBarBehavior.floating,
                //       backgroundColor:
                //           const Color.fromARGB(255, 59, 69, 160),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //     ),
                //   );
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
