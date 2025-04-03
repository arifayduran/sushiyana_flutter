import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/navigator_key.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';

class NotesScreen extends StatelessWidget {
  final Item item;

  const NotesScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final TextEditingController notesController = TextEditingController(
      text: cartProvider.getNoteForItem(item.id),
    );

    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 330, maxHeight: 450),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: yanaColor.withValues(alpha: .9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notiz für Artikel "${item.artikelname}"...',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Julee",
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w900,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: notesController,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: .1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Notiz hier eingeben...',
                        hintStyle: const TextStyle(
                            color: Colors.white70,
                            fontFamily: "Julee",
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            cartProvider.setNoteForItem(item.id, "");
                            navigatorKey.currentState?.pop();
                          },
                          child: Text(
                            "Notiz löschen",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Julee",
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cartProvider.setNoteForItem(
                                item.id, notesController.text);
                            navigatorKey.currentState?.pop();
                          },
                          child: Text(
                            "Speichern",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Julee",
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    );
  }
}
