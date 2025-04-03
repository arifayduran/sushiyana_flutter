import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:sushiyana_flutter/application/show_animations_variables.dart';
import 'package:sushiyana_flutter/presentation/text_methods/convert_to_rich_text.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/widgets/lottie_animation_duration.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';
import 'package:sushiyana_flutter/presentation/widgets/show_alert_dialog.dart';

class ItemDetailScreen extends StatefulWidget {
  final List<Item> items;
  final int initialIndex;

  const ItemDetailScreen({
    super.key,
    required this.items,
    required this.initialIndex,
  });

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  late PageController _pageController;

  final _secureStorage = const FlutterSecureStorage();

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: widget.initialIndex, viewportFraction: 0.7);

    _currentPage = widget.initialIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setAnimationStatus(false);

      if (showZoomAnimation) {
        Future.delayed(Duration(milliseconds: 2000), () {
          if (mounted) {
            setState(() {
              showZoomAnimation = false;
            });
          }
        });
      }
    });
  }

  Future<void> _setAnimationStatus(bool value) async {
    await _secureStorage.write(
        key: 'showZoomHandAnimation', value: value.toString());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double logicalWidth = MediaQuery.of(context).size.width;
    double logicalHeight = MediaQuery.of(context).size.height;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: logicalHeight * 0.4 / 5 * 2 - 50,
            left: 0,
            right: 0,
            child: Text(
              widget.items[_currentPage].artikelnummer,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                  fontFamily: "Julee",
                  fontWeight: FontWeight.w900,
                  fontSize: logicalWidth < 560 ? 14 : 18),
            ),
          ),
          Positioned(
            top: logicalHeight * 0.4 / 5 * 2 - 20,
            left: 0,
            right: 0,
            child: Text(
              widget.items[_currentPage].artikelname,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Julee",
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                  fontSize: logicalWidth < 560 ? 18 : 23),
            ),
          ),

          Positioned(
            bottom: logicalHeight * 0.4 / 5 * 2 - 50,
            left: 0,
            right: 0,
            child: Text(
              widget.items[_currentPage].preis.replaceAll(".", ","),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: "Julee",
                  fontWeight: FontWeight.w900,
                  fontSize: logicalWidth < 560 ? 18 : 23),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.hasClients) {
                    final page = _pageController.page ??
                        _pageController.initialPage.toDouble();
                    value = (1 - ((page - index).abs() * 0.3)).clamp(0.8, 1.0);
                  } else {
                    value = (1 - ((_currentPage - index).abs() * 0.3))
                        .clamp(0.8, 1.0);
                  }
                  return Transform.scale(
                    scale: value,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: logicalWidth * 0.9,
                          maxHeight: logicalHeight * 0.6,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Hero(
                              tag: _currentPage == index
                                  ? index
                                  : "ignored_$index",
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.white,
                                        width: 0.2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside),
                                    left: BorderSide(
                                        color: Colors.white,
                                        width: 0.2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside),
                                    right: BorderSide(
                                        color: Colors.white,
                                        width: 0.2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside),
                                    bottom: BorderSide(
                                        color: Colors.white, width: 2),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, right: 5, left: 5),
                                        child: PinchZoomImage(
                                          image: Center(
                                            child: Image.network(
                                              item.imagePath,
                                              fit: BoxFit.contain,
                                              width: logicalWidth,
                                              loadingBuilder: (context, child,
                                                      loadingProgress) =>
                                                  loadingProgress == null
                                                      ? child
                                                      : CircularProgressIndicator(
                                                          color: yanaColor,
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  (loadingProgress
                                                                          .expectedTotalBytes ??
                                                                      1)
                                                              : null,
                                                        ),
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/noimage_sushiyana.jpg',
                                                  fit: BoxFit.contain,
                                                  width: logicalWidth * 0.9,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (item.pikant ||
                                        item.vegetarisch ||
                                        item.vegan)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                logicalWidth < 560 ? 10 : 15),
                                        child: SizedBox(
                                          height: logicalWidth < 560 ? 27 : 35,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            spacing:
                                                logicalWidth < 560 ? 5 : 10,
                                            children: [
                                              if (item.pikant)
                                                Tooltip(
                                                  message: "Pikant",
                                                  child: SizedBox(
                                                    height: logicalWidth < 560
                                                        ? 27
                                                        : 35,
                                                    width: logicalWidth < 560
                                                        ? 27
                                                        : 35,
                                                    child: Image.asset(
                                                        "assets/icons/pikant.png"),
                                                  ),
                                                ),
                                              if (item.vegetarisch)
                                                Tooltip(
                                                  message: "Vegetarisch",
                                                  child: SizedBox(
                                                    height: logicalWidth < 560
                                                        ? 27
                                                        : 35,
                                                    width: logicalWidth < 560
                                                        ? 27
                                                        : 35,
                                                    child: Image.asset(
                                                        "assets/icons/vegetarisch.png"),
                                                  ),
                                                ),
                                              if (item.vegan)
                                                Tooltip(
                                                  message: "Vegan",
                                                  child: SizedBox(
                                                    height: logicalWidth < 560
                                                        ? 27
                                                        : 35,
                                                    width: logicalWidth < 560
                                                        ? 27
                                                        : 35,
                                                    child: Image.asset(
                                                        "assets/icons/vegan.png"),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (item.beschreibung.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4.0,
                                            right: 4.0,
                                            top: 10,
                                            bottom: 10.0),
                                        child: Center(
                                          child: convertToRichText(
                                              item.beschreibung,
                                              const Color.fromARGB(
                                                  255, 184, 184, 184),
                                              logicalHeight < 700 ||
                                                      logicalWidth < 500
                                                  ? 12
                                                  : 15,
                                              "Julee",
                                              FontWeight.w100,
                                              true),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              right: 0,
                              left: 0,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          // ModalBarrier(
          //   dismissible: true,
          //   color: Colors.black.withValues(alpha: 0.0),
          //   onDismiss: () => Navigator.pop(context),
          // ),
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          if (_currentPage > 0)
            Positioned(
              left: logicalWidth > 650
                  ? logicalWidth > 1100
                      ? logicalWidth / 2 - 70 - 500
                      : -8
                  : -18,
              bottom: MediaQuery.of(context).size.height / 2,
              child: GestureDetector(
                onTap: () {
                  if (_pageController.page! > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: RotatedBox(
                  quarterTurns: 1,
                  child: SizedBox(
                    width: 70,
                    child: LottieAnimationDuration(
                      duration: Duration(seconds: 3),
                      path: "assets/animations/scroll_down_white.json",
                    ),
                  ),
                ),
              ),
            ),
          if (_currentPage < widget.items.length - 1)
            Positioned(
              right: logicalWidth > 650
                  ? logicalWidth > 1100
                      ? logicalWidth / 2 - 70 - 500
                      : -8
                  : -18,
              bottom: MediaQuery.of(context).size.height / 2,
              child: GestureDetector(
                onTap: () {
                  if (_pageController.page! < widget.items.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: RotatedBox(
                  quarterTurns: 3,
                  child: SizedBox(
                    width: 70,
                    child: LottieAnimationDuration(
                      duration: Duration(seconds: 3),
                      path: "assets/animations/scroll_down_white.json",
                    ),
                  ),
                ),
              ),
            ),
          if (showZoomAnimation)
            Center(
              child: LottieAnimationDuration(
                duration: Duration(milliseconds: 1000),
                path: "assets/animations/zoom_hand.json",
              ),
            ),
          Positioned(
              top: 20,
              right: 20,
              child: MySmallCircleButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                size: logicalWidth < 560 ? 30 : 35,
                strokewidth: 0.5,
                child: Icon(
                  Icons.close,
                  size: logicalWidth < 560 ? 16 : 20,
                  color: Colors.white,
                ),
              )),

          if (widget.items[_currentPage].allergeneZusatz.isNotEmpty)
            Positioned(
              top: 20,
              left: 20,
              child: Tooltip(
                  message: "Allergene und Zusatzstoffe",
                  child: MySmallCircleButtonWidget(
                    onTap: () {
                      showAllergenDialog(context, widget.items[_currentPage]);
                    },
                    size: logicalWidth < 560 ? 30 : 35,
                    strokewidth: 0.5,
                    child: Text(
                      "i",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: logicalWidth < 560 ? 16 : 18,
                          fontFamily: "Julee"),
                    ),
                  )),
            ),
        ],
      ),
    );
  }
}
