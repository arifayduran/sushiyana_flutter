import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/get_image_url_cdn.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/presentation/animated_tab_switcher.dart';
import 'package:sushiyana_flutter/presentation/screens/home_screen.dart';

class MainTab extends StatefulWidget {
  final VoidCallback scrollToTopOnBack;
  final Function(String) onItemTapped;
  static int mainTabMode = 0;


  const MainTab({
    super.key,
    required this.onItemTapped,
    required this.scrollToTopOnBack,

  });

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);



    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: AnimatedTabSwitcher(
          mainTabMode: MainTab.mainTabMode,
          child: Builder(
            builder: (context) {
              if (MainTab.mainTabMode == 1) {
                HomeScreen.previousIndex = 0;
                // ignore: deprecated_member_use
                return AnimatedOpacity(
                  opacity: MainTab.mainTabMode == 1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Sushis",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Julee",
                              color: Colors.white,
                              letterSpacing: 2)),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:  2,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 10, bottom: 19),
                          itemCount:
                              localDatabase["Sushis"]["categories"].length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                clipBehavior: Clip.antiAlias,
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: yanaColor,
                                    width: 2,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(28),
                                          topRight: Radius.circular(28),
                                        ),
                                        child: Container(
                                            color: Colors.black,
                                            child: Center(
                                                child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20.0),
                                                    child: Icon(
                                                      Icons.reply,
                                                      color: yanaColor,
                                                      size: 80,
                                                    )))),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          highlightColor:
                                              yanaColor.withValues(alpha: .5),
                                          splashColor: yanaColor,
                                          onTap: () {
                                            widget.scrollToTopOnBack();
                                            setState(() {
                                              MainTab.mainTabMode = 0;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 20,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: yanaColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Zur Übersicht",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Julee",
                                              fontSize: 13,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            int adjustedIndex = index - 1;
                            if (adjustedIndex < 0 ||
                                adjustedIndex >=
                                    localDatabase["Sushis"]["categories"]
                                        .length) {
                              return const SizedBox();
                            }

                            String title = localDatabase["Sushis"]["categories"]
                                .keys
                                .elementAt(adjustedIndex);
                            String imagePath = localDatabase["Sushis"]
                                    ["categories"]
                                .values
                                .elementAt(adjustedIndex)["imagePath"];

                            return Container(
                              margin: const EdgeInsets.all(10),
                              clipBehavior: Clip.hardEdge,
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: yanaColor,
                                  width: 2,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(28),
                                        topRight: Radius.circular(28),
                                      ),
                                      child: Container(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    bottom: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(28),
                                        topRight: Radius.circular(28),
                                      ),
                                      child: Hero(
                                        tag: title,
                                        child: Image.network(
                                          getImageUrlCdn(imagePath),
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                'assets/images/noimage_sushiyana.jpg');
                                          },
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor:
                                            yanaColor.withValues(alpha: .5),
                                        splashColor: yanaColor,
                                        onTap: () => widget.onItemTapped(title),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: yanaColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Julee",
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (MainTab.mainTabMode == 2) {
                HomeScreen.previousIndex = 0;
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Warme Küche",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Julee",
                            color: Colors.white,
                            letterSpacing: 2)),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 10, bottom: 19),
                        itemCount:
                            localDatabase["Warme Küche"]["categories"].length +
                                1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              clipBehavior: Clip.hardEdge,
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: yanaColor,
                                  width: 2,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(28),
                                        topRight: Radius.circular(28),
                                      ),
                                      child: Container(
                                          color: Colors.black,
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: const Icon(
                                              Icons.reply,
                                              color: yanaColor,
                                              size: 80,
                                            ),
                                          ))),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor:
                                            yanaColor.withValues(alpha: .5),
                                        splashColor: yanaColor,
                                        onTap: () {
                                          widget.scrollToTopOnBack();
                                          setState(() {
                                            MainTab.mainTabMode = 0;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: yanaColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Zur Übersicht",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Julee",
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          int adjustedIndex = index - 1;
                          if (adjustedIndex < 0 ||
                              adjustedIndex >=
                                  localDatabase["Warme Küche"]["categories"]
                                      .length) {
                            return const SizedBox();
                          }

                          String title = localDatabase["Warme Küche"]
                                  ["categories"]
                              .keys
                              .elementAt(adjustedIndex);
                          String imagePath = localDatabase["Warme Küche"]
                                  ["categories"]
                              .values
                              .elementAt(adjustedIndex)["imagePath"];

                          return Container(
                            margin: const EdgeInsets.all(10),
                            clipBehavior: Clip.hardEdge,
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: yanaColor,
                                width: 2,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(28),
                                      topRight: Radius.circular(28),
                                    ),
                                    child: Container(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  bottom: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(28),
                                      topRight: Radius.circular(28),
                                    ),
                                    child: Hero(
                                      tag: title,
                                      child: Image.network(
                                        getImageUrlCdn(imagePath),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/images/noimage_sushiyana.jpg');
                                        },
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover,
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
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      highlightColor:
                                          yanaColor.withValues(alpha: .5),
                                      splashColor: yanaColor,
                                      onTap: () => widget.onItemTapped(title),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: yanaColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Julee",
                                          fontSize: 13,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(25),
                  itemCount: branchProvider.currentBranch == "neukoelln" ||
                          branchProvider.currentBranch == "lichtenrade"
                      ? localDatabase.length
                      : localDatabase.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    String title = localDatabase.keys.elementAt(index);
                    String imagePath =
                        localDatabase.values.elementAt(index)["imagePath"];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      clipBehavior: Clip.hardEdge,
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: yanaColor,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28),
                              ),
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            bottom: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28),
                              ),
                              child: Hero(
                                tag: title,
                                child: Image.network(
                                  getImageUrlCdn(imagePath),
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        'assets/images/noimage_sushiyana.jpg');
                                  },
                                  alignment: Alignment.center,
                                  loadingBuilder: (context, child,
                                          loadingProgress) =>
                                      loadingProgress == null
                                          ? child
                                          : Center(
                                              child: CircularProgressIndicator(
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
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                highlightColor: yanaColor.withValues(alpha: .5),
                                splashColor: yanaColor,
                                onTap: () => widget.onItemTapped(title),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 20,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: yanaColor,
                              ),
                              child: Center(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Julee",
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
