import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:sushiyana_flutter/application/show_zoom_animation.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/lottie_animation_duration.dart';

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

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.initialIndex);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setAnimationStatus(false);

      Future.delayed(Duration(milliseconds: 2000), () {
        setState(() {
          showZoomAnimation = false;
        });
      });
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

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                    }
                    return Hero(
                      tag: index,
                      child: Transform.scale(
                        scale: value,
                        child: Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: logicalWidth < 1000 ? 600 : 882.5,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PinchZoomImage(
                                  image: Center(
                                    child: Image.network(
                                      item.imagePath,
                                      fit: BoxFit.fitWidth,
                                      width: logicalWidth,
                                      loadingBuilder:
                                          (context, child, loadingProgress) =>
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
                                          fit: BoxFit.fitWidth,
                                          width: logicalWidth,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.artikelname,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Julee",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.beschreibung,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: "Julee",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned.fill(
              child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
          )),
          Positioned(
            left: logicalWidth > 650
                ? logicalWidth > 1100
                    ? logicalWidth / 2 - 70 - 500
                    : -8
                : -18,
            bottom: 100,
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
          Positioned(
            right: logicalWidth > 650
                ? logicalWidth > 1100
                    ? logicalWidth / 2 - 70 - 500
                    : -8
                : -18,
            bottom: 100,
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
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta != null &&
                    details.primaryDelta! > 20) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
