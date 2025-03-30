import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/convert_to_rich_text.dart';
import 'package:sushiyana_flutter/application/get_image_url_cdn.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/home_screen.dart';
import 'package:sushiyana_flutter/presentation/lottie_animation_duration.dart';

class ItemsTab extends StatefulWidget {
  final String heroTag;
  final VoidCallback onBack;
  final ScrollController outerController;
  // final ScrollController innerController;
  const ItemsTab({
    super.key,
    required this.heroTag,
    required this.onBack,
    required this.outerController,
    // required this.innerController,
  });

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
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        widget.onBack();
        return false;
      },
      child: Container(
        color: tabBackground,
        padding: const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Column(
              children: [
                if (_showFilters)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: widget.outerController.offset < 202 ? 0 : 70,
                  ),
                if (_showFilters)
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
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
                                    Image.asset("assets/icons/vegetarisch.png",
                                        height: 20, width: 20),
                                  if (filter == "Vegan")
                                    Image.asset("assets/icons/vegan.png",
                                        height: 20, width: 20),
                                  if (filter == "Pikant")
                                    Image.asset("assets/icons/pikant.png",
                                        height: 20, width: 20),
                                  if (filter == "Nicht Pikant")
                                    Image.asset("assets/icons/nicht_pikant.png",
                                        height: 20, width: 20),
                                  SizedBox(width: 5),
                                  Text(filter,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Julee",
                                          fontSize: 14)),
                                ],
                              ),
                              selected: _selectedFilters.contains(filter),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (filter == "Alle") {
                                    _selectedFilters = {"Alle"};
                                  } else {
                                    _selectedFilters.remove("Alle");

                                    if (selected) {
                                      if (filter == "Pikant") {
                                        _selectedFilters.remove("Nicht Pikant");
                                      } else if (filter == "Nicht Pikant") {
                                        _selectedFilters.remove("Pikant");
                                      }

                                      if (filter == "Vegetarisch") {
                                        _selectedFilters.remove("Vegan");
                                      } else if (filter == "Vegan") {
                                        _selectedFilters.remove("Vegetarisch");
                                      }

                                      _selectedFilters.add(filter);
                                    } else {
                                      _selectedFilters.remove(filter);
                                      if (_selectedFilters.isEmpty) {
                                        _selectedFilters = {"Alle"};
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
                SizedBox(height: 15),
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
            if (!_showFilters) const SizedBox(height: 30),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.builder(
                    itemCount: _items.length + (_infoText != "" ? 2 : 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (_infoText != "" && index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 30.0),
                          child: Text(
                            _infoText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Julee",
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                              fontSize: 15,
                            ),
                          ),
                        );
                      } else if (_infoText != "" && index == 1) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Divider(
                                color: Colors.white,
                                thickness: 0.5,
                                height: 12,
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
                        );
                      } else {
                        final itemIndex = index - (_infoText != "" ? 2 : 0);
                        return Column(
                          children: [
                            SizedBox(
                              height: index == 0 && _showFilters ? 30 : 0,
                            ),
                            _items[itemIndex].imagePath.isNotEmpty
                                ? Image.network(
                                    getImageUrlCdn(_items[itemIndex].imagePath),
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/noimage_sushiyana.jpg');
                                    },
                                    fit: BoxFit.contain,
                                    loadingBuilder:
                                        (context, child, loadingProgress) =>
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
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child: Text(
                                _items[itemIndex].artikelnummer,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Julee",
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 500,
                              child: Text(
                                _items[itemIndex].artikelname,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Julee",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                            ),
                            _items[itemIndex].allergeneZusatz.isNotEmpty
                                ? SizedBox(
                                    height: 10,
                                  )
                                : SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _items[itemIndex].pikant
                                    ? Tooltip(
                                        message: "Pikant",
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/icons/pikant.png"),
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  width: _items[itemIndex].vegetarisch ? 5 : 0,
                                ),
                                _items[itemIndex].vegetarisch
                                    ? Tooltip(
                                        message: "Vegetarisch",
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/icons/vegetarisch.png"),
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  width: _items[itemIndex].vegan ? 5 : 0,
                                ),
                                _items[itemIndex].vegan
                                    ? Tooltip(
                                        message: "Vegan",
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/icons/vegan.png"),
                                        ),
                                      )
                                    : SizedBox(),
                                _items[itemIndex].allergeneZusatz.isNotEmpty
                                    ? Tooltip(
                                        message: "Allergene und Zusatzstoffe",
                                        child: IconButton(
                                            padding: EdgeInsets.zero,
                                            iconSize: 25,
                                            onPressed: () {
                                              _showAllergenDialog(
                                                  context, itemIndex);
                                            },
                                            icon: Icon(
                                              Icons.info,
                                              color: yanaColor,
                                            )),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _items[itemIndex].beschreibung.isEmpty
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: convertToRichText(
                                        _items[itemIndex].beschreibung,
                                        const Color.fromARGB(
                                            255, 184, 184, 184),
                                        14,
                                        "Julee",
                                        FontWeight.w100,
                                        true),
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _items[itemIndex].preis.replaceAll(".", ","),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontFamily: "Julee",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Divider(
                                  color: Colors.white,
                                  thickness: 0.5,
                                  height: 12,
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
                            SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
