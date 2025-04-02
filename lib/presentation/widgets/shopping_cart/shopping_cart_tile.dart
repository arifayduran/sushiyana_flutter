import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ShoppingCartTile extends StatelessWidget {
  const ShoppingCartTile({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withValues(alpha: 0.4),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(175, 59, 69, 160),
                    Color.fromARGB(175, 148, 88, 207),
                    Color.fromARGB(175, 202, 130, 165)
                  ])),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    "assets/graphics/noimage.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 228,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Jijij",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                height: 0,
                                letterSpacing: -0.8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          // "  ${String.fromCharCodes(Runes('\u20B3'))} ${_itemPriceTotal.toStringAsFixed(2)}",
                          "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              height: 0,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 228,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            // widget.item.subtitle,
                            "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5),
                                height: 0,
                                letterSpacing: -0.8,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          // "     ${String.fromCharCodes(Runes('\u20B3'))} ${_currentPrice.toStringAsFixed(2)}",
                          "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              height: 0,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 228,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ToggleSwitch(
                          activeBgColor: const [
                            Color.fromARGB(130, 59, 69, 160)
                          ],
                          inactiveBgColor:
                              const Color.fromARGB(140, 85, 85, 85),
                          activeFgColor: Colors.white,
                          inactiveFgColor: Colors.white.withValues(alpha: 0.6),
                          // initialLabelIndex: widget.shoppingListNotifier
                          //     .value[widget.item]!.selectedSizeIndex,
                          fontSize: 11.3,
                          dividerMargin: 7.5,
                          radiusStyle: true,
                          minHeight: 25,
                          customWidths: const [40, 40, 40],
                          totalSwitches: 3,
                          labels: const ['S', 'M', 'L'],
                          onToggle: (index) {
                            // _saveToggle(index!);
                          },
                        ),
                        SizedBox(
                          width: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MySmallCircleButtonWidget(
                                onTap: () {
                                  // _decrementAmountUntilDelete();
                                },
                                size: 26,
                                strokewidth: 0.1,
                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              ),
                              Text(
                                // "${shoppingCard[widget.item]!.amount}",
                                "",
                                style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontSize: 18,
                                    fontFamily: "Inter",
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400),
                              ),
                              MySmallCircleButtonWidget(
                                onTap: () {
                                  // _incrementAmount();
                                },
                                size: 26,
                                strokewidth: 0.1,
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
