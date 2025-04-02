import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/application/text_methods/convert_to_rich_text.dart';
import 'package:sushiyana_flutter/domain/item.dart';

void showAllergenDialog(BuildContext context, Item item) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: .0),
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        // ignore: deprecated_member_use
        child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: AlertDialog(
            backgroundColor: Colors.white.withValues(alpha: .7),
            title: const Text(
              "Allergene und Zusatzstoffe",
              style: TextStyle(fontFamily: "Julee"),
            ),
            content: convertToRichText(
             item.allergeneZusatz,
              Colors.black,
              13,
              "Julee",
              FontWeight.normal,
              false,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Schließen"),
              ),
            ],
          ),
        ),
      );
    },
  );
}
