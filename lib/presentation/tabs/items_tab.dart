import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/convert_to_rich_text.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/item_assets.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/domain/item.dart';
import 'package:sushiyana_flutter/presentation/home_screen.dart';
import 'package:sushiyana_flutter/presentation/lottie_animation_duration.dart';

class ItemsTab extends StatefulWidget {
  final String heroTag;
  final VoidCallback onBack;
  const ItemsTab({
    super.key,
    required this.heroTag,
    required this.onBack,
  });

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  List<Item> _items = [];
  String _infoText = "";

  @override
  void initState() {
    super.initState();
    _getItems();
    _getInfoText();

    final branchProvider = Provider.of<BranchProvider>(context, listen: false);
    branchProvider.addListener(() {
      _getItems;
      _getInfoText();
    });
  }

  void _getItems() {
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
      return item.bestellbar && _isItemAvailableInCurrentBranch(item);
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
                Colors.black, 13, "Julee", FontWeight.normal),
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
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _items.length + (_infoText != "" ? 2 : 0),
                  itemBuilder: (BuildContext context, int index) {
                    if (_infoText != "" && index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20.0),
                        child: Text(
                          _infoText,
                          textAlign: TextAlign.center,
                          // softWrap: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Julee",
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100,
                              fontSize: 20),
                        ),
                      );
                    } else if (_infoText != "" && index == 1) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            height: 40,
                          ),
                          // SizedBox(
                          //   width: 600, child:
                          Image.asset(
                            itemAssets[_items[itemIndex].id.toString()] ??
                                "assets/images/noimage_sushiyana.jpg",
                            fit: BoxFit.contain,
                          ),
                          // ),
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
                            // spacing: 5,
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
                              : SizedBox(
                                  width: 500,
                                  child: Center(
                                    child: convertToRichText(
                                      _items[itemIndex].beschreibung,
                                      const Color.fromARGB(255, 184, 184, 184),
                                      14,
                                      "Julee",
                                      FontWeight.w100,
                                    ),
                                  ),
                                ),
                          _items[itemIndex].beschreibung.isEmpty
                              ? SizedBox(
                                  height: 20,
                                )
                              : SizedBox(
                                  height: 25,
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
                  }),
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
