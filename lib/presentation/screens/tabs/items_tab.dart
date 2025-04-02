import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/branch_provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/application/show_animations_variables.dart';
import 'package:sushiyana_flutter/presentation/text_methods/calculate_line_count_for_description.dart';
import 'package:sushiyana_flutter/presentation/text_methods/convert_to_rich_text_description_max_lines.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/screens/home_screen.dart';
import 'package:sushiyana_flutter/presentation/widgets/lottie_animation_duration.dart';
import 'package:sushiyana_flutter/presentation/screens/item_detail_screen.dart';
import 'package:sushiyana_flutter/presentation/widgets/show_alert_dialog.dart';

// Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               highlightColor: yanaColor.withValues(alpha: .5),
//                               splashColor: yanaColor,
//                               onTap: () {},
//                               child:
//                             ),),

class ItemsTab extends StatefulWidget {
  final String heroTag;
  // final VoidCallback onBack;
  final ScrollController outerController;
  // final ScrollController innerController;
  const ItemsTab({
    super.key,
    required this.heroTag,
    // required this.onBack,
    required this.outerController,
    // required this.innerController,
  });

  static bool lockItemsTabFiltersPadding = true;

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  List<Item> _items = [];
  String _infoText = "";

  final List<String> _filters = [
    "Alle",
    "Vegetarisch",
    "Vegan",
    "Pikant",
    "Nicht Pikant"
  ];
  Set<String> _selectedFilters = {"Alle"};

  bool _showFilters = true;

  final _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    ItemsTab.lockItemsTabFiltersPadding = true;

    if (widget.heroTag == "Warme Getränke" || widget.heroTag == "Getränke") {
      _showFilters = false;
    } else {
      _showFilters = true;
    }

    _getFilteredItems();
    _getInfoText();

    final branchProvider = Provider.of<BranchProvider>(context, listen: false);
    branchProvider.addListener(() {
      _getFilteredItems();
      _getInfoText();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setAnimationStatus(false);

      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          setState(() {
            ItemsTab.lockItemsTabFiltersPadding = true;
          });
        }
      });

      if (showTapHandAnimation) {
        Future.delayed(Duration(milliseconds: 2000), () {
          if (mounted) {
            setState(() {
              showTapHandAnimation = false;
            });
          }
        });
      }
    });
  }

  Future<void> _setAnimationStatus(bool value) async {
    await _secureStorage.write(
        key: 'showTapHandAnimation', value: value.toString());
  }

  void _getFilteredItems() {
    List<Item> items;

    if (localDatabase["Sushis"]["categories"].containsKey(widget.heroTag)) {
      items = List<Item>.from(
          localDatabase["Sushis"]["categories"][widget.heroTag]["items"]);
    } else if (localDatabase["Warme Küche"]["categories"]
        .containsKey(widget.heroTag)) {
      items = List<Item>.from(
          localDatabase["Warme Küche"]["categories"][widget.heroTag]["items"]);
    } else {
      items = List<Item>.from(localDatabase[widget.heroTag]["items"]);
    }

    final filteredItems = items.where((item) {
      if (!item.bestellbar || !_isItemAvailableInCurrentBranch(item)) {
        return false;
      }

      if (_selectedFilters.contains("Alle")) {
        return true;
      }

      bool matchesVegetarian =
          _selectedFilters.contains("Vegetarisch") ? item.vegetarisch : true;
      bool matchesVegan =
          _selectedFilters.contains("Vegan") ? item.vegan : true;
      bool matchesSpicy =
          _selectedFilters.contains("Pikant") ? item.pikant : true;
      bool matchesNonSpicy =
          _selectedFilters.contains("Nicht Pikant") ? !item.pikant : true;

      return matchesVegetarian &&
          matchesVegan &&
          matchesSpicy &&
          matchesNonSpicy;
    }).toList();

    setState(() {
      _items = filteredItems;
    });
  }

  bool _isItemAvailableInCurrentBranch(
    Item item,
  ) {
    final branchProvider = Provider.of<BranchProvider>(context, listen: false);
    switch (branchProvider.currentBranch) {
      case 'charlottenburg':
        return item.charlottenburg;
      case 'friedrichshain':
        return item.friedrichshain;
      case 'lichtenrade':
        return item.lichtenrade;
      case 'mitte':
        return item.mitte;
      case 'moabit':
        return item.moabit;
      case 'neukoelln':
        return item.neukoelln;
      case 'potsdam':
        return item.potsdam;
      case 'rudow':
        return item.rudow;
      case 'spandau':
        return item.spandau;
      case 'tegel':
        return item.tegel;
      case 'weissensee':
        return item.weissensee;
      case 'zehlendorf':
        return item.zehlendorf;
      case 'ffo':
        return item.ffo;
      default:
        return false;
    }
  }

  void _getInfoText() {
    if (localDatabase["Sushis"]["categories"].containsKey(widget.heroTag)) {
      setState(() {
        _infoText =
            localDatabase["Sushis"]["categories"][widget.heroTag]["infoText"];
      });
    } else if (localDatabase["Warme Küche"]["categories"]
        .containsKey(widget.heroTag)) {
      setState(() {
        _infoText = localDatabase["Warme Küche"]["categories"][widget.heroTag]
            ["infoText"];
      });
    } else {
      setState(() {
        _infoText = localDatabase[widget.heroTag]["infoText"];
      });
    }
    HomeScreen.botPadding = _infoText.isNotEmpty ? 75.5 : 35;
    HomeScreen.topPadding = _showFilters ? 140 : 80;
  }

  @override
  Widget build(BuildContext context) {
    double logicalWidth = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
        color: tabBackground,
        // padding: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: logicalWidth < 1000 ? 600 : 882.5,
                ),
                child: GridView.builder(
                  padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: _infoText.isNotEmpty ? 115 : 75,
                      top: _showFilters ? 80 : 30),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: logicalWidth < 1000 ? 2 : 3,
                    // crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    childAspectRatio: .70,
                  ),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    double descriptionFontSize = logicalWidth < 560
                        ? logicalWidth < 490
                            ? logicalWidth < 450
                                ? logicalWidth < 420
                                    ? logicalWidth < 370
                                        ? 7
                                        : 9
                                    : 11
                                : 11.5
                            : 14
                        : 15;
                    double descriptionMaxWidth = ((logicalWidth - 65) / 2) - 8;
                    int descriptionLineCount = calculateLineCountForDescription(
                      text: _items[index].beschreibung,
                      fontSize: descriptionFontSize,
                      fontFamily: "Julee",
                      fontWeight: FontWeight.w100,
                      textAlign: TextAlign.center,
                      maxWidth: descriptionMaxWidth,
                    );
                    return Hero(
                      tag: index,
                      transitionOnUserGestures: true,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              border: Border(
                                top: BorderSide(
                                    color: Colors.white,
                                    width: 0.1,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                left: BorderSide(
                                    color: Colors.white,
                                    width: 0.1,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                right: BorderSide(
                                    color: Colors.white,
                                    width: 0.1,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                            ),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.of(context).push(
                                  FadePageRoute(
                                    page: ItemDetailScreen(
                                      items: _items,
                                      initialIndex: index,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Center(
                                        child:
                                            _items[index].imagePath.isNotEmpty
                                                ? Image.network(
                                                    _items[index].imagePath,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                        'assets/images/noimage_sushiyana.jpg',
                                                        fit: BoxFit.fitWidth,
                                                      );
                                                    },
                                                    fit: BoxFit.fitWidth,
                                                    loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) =>
                                                        loadingProgress == null
                                                            ? child
                                                            : Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color:
                                                                      yanaColor,
                                                                  value: loadingProgress
                                                                              .expectedTotalBytes !=
                                                                          null
                                                                      ? loadingProgress
                                                                              .cumulativeBytesLoaded /
                                                                          (loadingProgress.expectedTotalBytes ??
                                                                              1)
                                                                      : null,
                                                                ),
                                                              ),
                                                  )
                                                : Image.asset(
                                                    "assets/images/noimage_sushiyana.jpg",
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4.0, right: 4.0, bottom: 15.0),
                                      child: Column(
                                        mainAxisAlignment: _items[index]
                                                    .beschreibung
                                                    .isEmpty ||
                                                descriptionLineCount <= 3
                                            ? MainAxisAlignment.spaceEvenly
                                            : MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _items[index].artikelnummer,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Julee",
                                                fontWeight: FontWeight.w900,
                                                fontSize: logicalWidth < 560
                                                    ? logicalWidth < 390
                                                        ? 7
                                                        : 9
                                                    : 11),
                                          ),
                                          Text(
                                            _items[index].artikelname,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Julee",
                                                fontWeight: FontWeight.w700,
                                                fontSize: logicalWidth < 560
                                                    ? logicalWidth < 390
                                                        ? 9
                                                        : 11
                                                    : 13),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: SizedBox(
                                              height: logicalWidth < 560
                                                  ? logicalWidth < 390
                                                      ? 17
                                                      : 20
                                                  : 25,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                spacing:
                                                    logicalWidth < 450 ? 2 : 4,
                                                children: [
                                                  if (_items[index].pikant)
                                                    Tooltip(
                                                      message: "Pikant",
                                                      child: SizedBox(
                                                        height: logicalWidth <
                                                                560
                                                            ? logicalWidth < 390
                                                                ? 12
                                                                : 15
                                                            : 20,
                                                        width: logicalWidth <
                                                                560
                                                            ? logicalWidth < 390
                                                                ? 12
                                                                : 15
                                                            : 20,
                                                        child: Image.asset(
                                                            "assets/icons/pikant.png"),
                                                      ),
                                                    ),
                                                  if (_items[index].vegetarisch)
                                                    Tooltip(
                                                      message: "Vegetarisch",
                                                      child: SizedBox(
                                                        height: logicalWidth <
                                                                560
                                                            ? logicalWidth < 390
                                                                ? 12
                                                                : 15
                                                            : 20,
                                                        width: logicalWidth <
                                                                560
                                                            ? logicalWidth < 390
                                                                ? 12
                                                                : 15
                                                            : 20,
                                                        child: Image.asset(
                                                            "assets/icons/vegetarisch.png"),
                                                      ),
                                                    ),
                                                  if (_items[index].vegan)
                                                    Tooltip(
                                                      message: "Vegan",
                                                      child: SizedBox(
                                                        height: logicalWidth <
                                                                560
                                                            ? logicalWidth < 390
                                                                ? 12
                                                                : 15
                                                            : 20,
                                                        width: logicalWidth <
                                                                560
                                                            ? logicalWidth < 390
                                                                ? 12
                                                                : 15
                                                            : 20,
                                                        child: Image.asset(
                                                            "assets/icons/vegan.png"),
                                                      ),
                                                    ),
                                                  if (_items[index]
                                                      .allergeneZusatz
                                                      .isNotEmpty)
                                                    Tooltip(
                                                      message:
                                                          "Allergene und Zusatzstoffe",
                                                      child: GestureDetector(
                                                          behavior:
                                                              HitTestBehavior
                                                                  .translucent,
                                                          onTap: () {
                                                            showAllergenDialog(
                                                                context,
                                                                _items[index]);
                                                          },
                                                          child: Icon(
                                                            size: logicalWidth <
                                                                    560
                                                                ? logicalWidth <
                                                                        390
                                                                    ? 17
                                                                    : 20
                                                                : 25,
                                                            Icons.info,
                                                            color: yanaColor,
                                                          )),
                                                    )
                                                ],
                                              ),
                                            ),
                                          ),
                                          _items[index].beschreibung.isNotEmpty
                                              ? descriptionLineCount <= 3
                                                  ? Center(
                                                      child:
                                                          convertToRichTextDescriptionMaxLines(
                                                        _items[index]
                                                            .beschreibung,
                                                        const Color.fromARGB(
                                                            255, 184, 184, 184),
                                                        descriptionFontSize,
                                                        "Julee",
                                                        FontWeight.w100,
                                                        true,
                                                        logicalWidth < 420
                                                            ? 3
                                                            : 4,
                                                        descriptionMaxWidth,
                                                      ),
                                                    )
                                                  : Expanded(
                                                      child: _items[index]
                                                              .beschreibung
                                                              .isEmpty
                                                          ? SizedBox()
                                                          : Center(
                                                              child:
                                                                  convertToRichTextDescriptionMaxLines(
                                                                _items[index]
                                                                    .beschreibung,
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    184,
                                                                    184,
                                                                    184),
                                                                descriptionFontSize,
                                                                "Julee",
                                                                FontWeight.w100,
                                                                true,
                                                                logicalWidth <
                                                                        420
                                                                    ? 3
                                                                    : 4,
                                                                descriptionMaxWidth,
                                                              ),
                                                            ),
                                                    )
                                              : SizedBox(),
                                          Text(
                                            _items[index]
                                                .preis
                                                .replaceAll(".", ","),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 2,
                                              fontFamily: "Julee",
                                              fontWeight: FontWeight.w700,
                                              fontSize: logicalWidth < 560
                                                  ? logicalWidth < 490
                                                      ? logicalWidth < 450
                                                          ? logicalWidth < 410
                                                              ? 11
                                                              : 13
                                                          : 14
                                                      : 16
                                                  : 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (showTapHandAnimation && index == 0)
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 6,
                                      sigmaY: 6,
                                    ),
                                    child: Container(
                                      color: Colors.black.withValues(alpha: 0),
                                      child: LottieAnimationDuration(
                                        duration: Duration(milliseconds: 1000),
                                        path: "assets/animations/tap_hand.json",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  cartProvider.addItem(_items[index].id);
                                },
                                icon: Icon(Icons.add)),
                          ),
                          Positioned(
                            bottom: -6,
                            right: 0,
                            left: 0,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            if (_infoText.isNotEmpty)
              Positioned(
                bottom: 35,
                right: 0,
                left: 0,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: barColor.withValues(alpha: 0.5),
                      height: 40,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            _infoText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Julee",
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (_infoText.isNotEmpty)
              Positioned(
                bottom: 75,
                right: 0,
                left: 0,
                child: Divider(
                  color: Colors.white,
                  thickness: 0.5,
                  height: 0.5,
                ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   alignment: Alignment.center,
                //   children: [
                //     Divider(
                //       color: Colors.white,
                //       thickness: 0.5,
                //       height: 0.5,
                //     ),
                //     Positioned(
                //       top: -6,
                //       child: CircleAvatar(
                //         radius: 6,
                //         backgroundColor: Colors.red,
                //       ),
                //     ),
                //   ],
                // ),
              ),
            if (_showFilters)
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: AnimatedContainer(
                          color: barColor.withValues(alpha: 0.5),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: 52.5 +
                              (widget.outerController.offset < 202
                                  ? 0
                                  : ItemsTab.lockItemsTabFiltersPadding
                                      ? 0
                                      : 75),
                          child: Column(
                            children: [
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  height: widget.outerController.offset < 202
                                      ? 0
                                      : ItemsTab.lockItemsTabFiltersPadding
                                          ? 0
                                          : 75),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 32,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: logicalWidth < 600 ? 25.0 : 0),
                                  child: SingleChildScrollView(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      spacing: 8.0,
                                      children: _filters.map((filter) {
                                        return FilterChip(
                                            backgroundColor: barColor,
                                            selectedColor: yanaColorFilters,
                                            checkmarkColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 0.0),
                                            ),
                                            label: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (filter == "Vegetarisch")
                                                  Image.asset(
                                                      "assets/icons/vegetarisch.png",
                                                      height: 20,
                                                      width: 20),
                                                if (filter == "Vegan")
                                                  Image.asset(
                                                      "assets/icons/vegan.png",
                                                      height: 20,
                                                      width: 20),
                                                if (filter == "Pikant")
                                                  Image.asset(
                                                      "assets/icons/pikant.png",
                                                      height: 20,
                                                      width: 20),
                                                if (filter == "Nicht Pikant")
                                                  Image.asset(
                                                      "assets/icons/nicht_pikant.png",
                                                      height: 20,
                                                      width: 20),
                                                SizedBox(width: 5),
                                                Text(filter,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Julee",
                                                        fontSize: 14)),
                                              ],
                                            ),
                                            selected: _selectedFilters
                                                .contains(filter),
                                            onSelected: (bool selected) {
                                              setState(() {
                                                if (filter == "Alle") {
                                                  _selectedFilters = {"Alle"};
                                                } else {
                                                  _selectedFilters
                                                      .remove("Alle");

                                                  if (selected) {
                                                    if (filter == "Pikant") {
                                                      _selectedFilters.remove(
                                                          "Nicht Pikant");
                                                    } else if (filter ==
                                                        "Nicht Pikant") {
                                                      _selectedFilters
                                                          .remove("Pikant");
                                                    }

                                                    if (filter ==
                                                        "Vegetarisch") {
                                                      _selectedFilters
                                                          .remove("Vegan");
                                                    } else if (filter ==
                                                        "Vegan") {
                                                      _selectedFilters.remove(
                                                          "Vegetarisch");
                                                    }

                                                    _selectedFilters
                                                        .add(filter);
                                                  } else {
                                                    _selectedFilters
                                                        .remove(filter);
                                                    if (_selectedFilters
                                                        .isEmpty) {
                                                      _selectedFilters = {
                                                        "Alle"
                                                      };
                                                    }
                                                  }
                                                }

                                                _getFilteredItems();
                                              });
                                            });
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          color: Colors.white,
                          thickness: 0.5,
                          height: 0.5,
                        ),
                        Positioned(
                          top: -6,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ));
  }
}

class EmptyTab extends StatelessWidget {
  const EmptyTab({
    super.key,
    required this.onBack,
  });
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    double logicalWidth = MediaQuery.of(context).size.width;
    HomeScreen.previousIndex = 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0 + 40),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LottieAnimationDuration(
                  duration: Duration(seconds: 3),
                  path: "assets/animations/no_selection_sushi.json"),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: logicalWidth < 1000 ? 600 : 882.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          color: Colors.white,
                          thickness: 0.5,
                          height: 12,
                          endIndent: 25,
                          indent: 25,
                        ),
                        Positioned(
                          top: 0,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Keine Kategorie ausgewählt.",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Julee",
                          fontSize: 18,
                          height: 0),
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // ElevatedButton(
                    //   onPressed: onBack,
                    //   style: ButtonStyle(
                    //       backgroundColor: WidgetStateProperty.all(yanaColor),
                    //       elevation: WidgetStateProperty.all(5),
                    //       foregroundColor: WidgetStateProperty.all(Colors.white),
                    //       shadowColor: WidgetStateProperty.all(yanaColor)),
                    //   child: const Icon(Icons.arrow_back_ios_new),
                    // ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
