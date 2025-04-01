import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/convert_to_rich_text.dart';
import 'package:sushiyana_flutter/application/convert_to_rich_text_description_max_lines.dart';
import 'package:sushiyana_flutter/application/get_image_url_cdn.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/screens/home_screen.dart';
import 'package:sushiyana_flutter/presentation/lottie_animation_duration.dart';

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
      Future.delayed(const Duration(milliseconds: 1000), () {
        ItemsTab.lockItemsTabFiltersPadding = false;
      });
    });
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

  void _showAllergenDialog(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: AlertDialog(
            title: Text(
              "Allergene und Zusatzstoffe",
              style: TextStyle(fontFamily: "Julee"),
            ),
            content: convertToRichText(_items[index].allergeneZusatz,
                Colors.black, 13, "Julee", FontWeight.normal, false),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Schließen"),
              ),
            ],
          ),
        );
      },
    );
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
    HomeScreen.botPadding = _infoText.isNotEmpty ? 40 : 0;
    HomeScreen.topPadding = _showFilters ? 140 : 80;
  }

  @override
  Widget build(BuildContext context) {
    double logicalWidth = MediaQuery.of(context).size.width;
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
                      bottom: _infoText.isNotEmpty ? 80 : 40,
                      top: _showFilters ? 90 : 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: logicalWidth < 1000 ? 2 : 3,
                    // crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    childAspectRatio: .70,
                  ),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
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
                              bottom: BorderSide(color: Colors.white, width: 1),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Center(
                                    child: _items[index].imagePath.isNotEmpty
                                        ? Image.network(
                                            getImageUrlCdn(
                                                _items[index].imagePath),
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/noimage_sushiyana.jpg',
                                                fit: BoxFit.fitWidth,
                                              );
                                            },
                                            fit: BoxFit.fitWidth,
                                            loadingBuilder: (context, child,
                                                    loadingProgress) =>
                                                loadingProgress == null
                                                    ? child
                                                    : Center(
                                                        child:
                                                            CircularProgressIndicator(
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
                                    mainAxisAlignment:
                                        _items[index].beschreibung.isEmpty
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
                                            children: [
                                              _items[index].pikant
                                                  ? Tooltip(
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
                                                    )
                                                  : SizedBox(),
                                              SizedBox(
                                                width: _items[index].vegetarisch
                                                    ? logicalWidth < 560
                                                        ? 3
                                                        : 5
                                                    : 0,
                                              ),
                                              _items[index].vegetarisch
                                                  ? Tooltip(
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
                                                    )
                                                  : SizedBox(),
                                              SizedBox(
                                                width: _items[index].vegan
                                                    ? logicalWidth < 560
                                                        ? 3
                                                        : 5
                                                    : 0,
                                              ),
                                              _items[index].vegan
                                                  ? Tooltip(
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
                                                    )
                                                  : SizedBox(),
                                              _items[index]
                                                      .allergeneZusatz
                                                      .isNotEmpty
                                                  ? Tooltip(
                                                      message:
                                                          "Allergene und Zusatzstoffe",
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          iconSize:
                                                              logicalWidth < 560
                                                                  ? logicalWidth <
                                                                          390
                                                                      ? 17
                                                                      : 20
                                                                  : 25,
                                                          onPressed: () {
                                                            _showAllergenDialog(
                                                                context, index);
                                                          },
                                                          icon: Icon(
                                                            Icons.info,
                                                            color: yanaColor,
                                                          )),
                                                    )
                                                  : SizedBox(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      _items[index].beschreibung.isNotEmpty
                                          ? Expanded(
                                              child: _items[index]
                                                      .beschreibung
                                                      .isEmpty
                                                  ? SizedBox()
                                                  : Center(
                                                      child:
                                                          convertToRichTextDescriptionMaxLines(
                                                        _items[index]
                                                            .beschreibung,
                                                        const Color.fromARGB(
                                                            255, 184, 184, 184),
                                                        logicalWidth < 560
                                                            ? logicalWidth < 490
                                                                ? logicalWidth <
                                                                        450
                                                                    ? logicalWidth <
                                                                            420
                                                                        ? 9
                                                                        : 11
                                                                    : 11.5
                                                                : 14
                                                            : 15,
                                                        "Julee",
                                                        FontWeight.w100,
                                                        true,
                                                        logicalWidth < 420
                                                            ? 3
                                                            : 4,
                                                        ((logicalWidth - 65) /
                                                                2) -
                                                            8,
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
                    );
                  }),
            )),
            if (_infoText.isNotEmpty)
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: SizedBox(
                      // color: yanaColor.withValues(alpha: 0.3),
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
                bottom: 40,
                right: 0,
                left: 0,
                child: Stack(
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
                          // color: yanaColor.withValues(alpha: 0.3),
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
    HomeScreen.previousIndex = 0;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: LottieAnimationDuration(
                duration: Duration(seconds: 3),
                path: "assets/animations/no_selection_sushi.json"),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Keine Kategorie ausgewählt.",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Julee",
                      fontSize: 18,
                      height: 0),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                ElevatedButton(
                  onPressed: onBack,
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(yanaColor),
                      elevation: WidgetStateProperty.all(5),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shadowColor: WidgetStateProperty.all(yanaColor)),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
              ],
            ),
          )
        ]);
  }
}
