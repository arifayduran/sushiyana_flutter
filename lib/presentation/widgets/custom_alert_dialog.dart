 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/application/navigator_key.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/presentation/widgets/my_small_circle_button_widget.dart';

void customAlertDialog(BuildContext context, String message) {
      if (!context.mounted) return;
    if (!context.mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
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