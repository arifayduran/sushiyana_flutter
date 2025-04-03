import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/screens/notes_screen.dart';
import 'package:sushiyana_flutter/presentation/text_methods/convert_to_rich_text_description.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';

class ShoppingCartTile extends StatelessWidget {
  const ShoppingCartTile({
    super.key,
    required this.item,
    required this.incrementMethod,
    required this.decrementMethod,
  });

  final Item item;
  final VoidCallback incrementMethod;
  final VoidCallback decrementMethod;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    double logicalWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 100, maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 100,
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
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: Colors.grey.withValues(alpha: 0.4),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Opacity(
                  opacity: 0.7,
                  child: Image.network(
                    item.imagePath,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/noimage_sushiyana.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : Center(
                                child: CircularProgressIndicator(
                                  color: yanaColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                width: logicalWidth < 550
                    ? logicalWidth - 50 - 1.5 - 80 - 12 - 26
                    : 550.5 - 50 - 1.5 - 80 - 12 - 26,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.artikelname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                height: 0,
                                fontSize: 13,
                                fontFamily: "Julee",
                                decoration: TextDecoration.none,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              cartProvider
                                  .getTotalPriceForItem(item.id, item.preis)
                                  .toStringAsFixed(2)
                                  .replaceAll(".", ","),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  height: 0,
                                  fontSize: 13,
                                  fontFamily: "Julee",
                                  letterSpacing: 0.5,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: convertToRichTextDescription(
                              item.beschreibung,
                              Colors.white.withValues(alpha: 0.5),
                              11,
                              "Julee",
                              FontWeight.w300,
                              false,
                              1,
                              TextOverflow.ellipsis,
                              0,
                              0),
                        ),
                        SizedBox(
                          width: 45,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              item.preis.replaceAll(".", ","),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  height: 0,
                                  fontSize: 11,
                                  decoration: TextDecoration.none,
                                  fontFamily: "Julee",
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              FadePageRoute(
                                popOnTap: true,
                                page: NotesScreen(item: item),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              alignment: Alignment.center,
                              child: Text(
                                cartProvider.getNoteForItem(item.id).isNotEmpty
                                    ? cartProvider.getNoteForItem(item.id)
                                    : "Notizen...",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: cartProvider
                                            .getNoteForItem(item.id)
                                            .isNotEmpty
                                        ? Colors.white
                                        : Colors.white.withValues(alpha: 0.5),
                                    height: 0,
                                    fontSize: 10,
                                    fontFamily: "Julee",
                                    decoration: TextDecoration.none,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MySmallCircleButtonWidget(
                                onTap: () {
                                  cartProvider.removeSingleItem(item.id);
                                  decrementMethod();
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
                                cartProvider
                                    .getAmountForItem(item.id)
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontSize: 18,
                                    fontFamily: "Julee",
                                    decoration: TextDecoration.none,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400),
                              ),
                              MySmallCircleButtonWidget(
                                onTap: () {
                                  cartProvider.addItem(item.id);
                                  incrementMethod();
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
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
