import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';

class MainTab extends StatefulWidget {
  final Function(String) onItemTapped;
  static int mainTabMode = 0;

  const MainTab({super.key, required this.onItemTapped});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);

    if (MainTab.mainTabMode == 1) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 20),
                  itemCount: localDatabase["Sushis"]["categories"].length + 1,
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
                              bottom: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                    color: Colors.black,
                                    child: Center(
                                        child: const Icon(
                                      Icons.reply,
                                      color: Colors.white,
                                      size: 50,
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
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: yanaColor,
                                ),
                                child: Text(
                                  "Zurück",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Julee",
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
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
                            localDatabase["Sushis"]["categories"].length) {
                      return const SizedBox();
                    }

                    String title = localDatabase["Sushis"]["categories"]
                        .keys
                        .elementAt(adjustedIndex);
                    String imagePath = localDatabase["Sushis"]["categories"]
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
                            bottom: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Hero(
                                tag: title,
                                child: Image.asset(
                                  imagePath,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
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
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: yanaColor,
                              ),
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else if (MainTab.mainTabMode == 2) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 20),
                  itemCount:
                      localDatabase["Warme Küche"]["categories"].length + 1,
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
                              bottom: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                    color: Colors.black,
                                    child: Center(
                                        child: const Icon(
                                      Icons.reply,
                                      color: Colors.white,
                                      size: 50,
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
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: yanaColor,
                                ),
                                child: Text(
                                  "Zurück",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Julee",
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
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
                            localDatabase["Warme Küche"]["categories"].length) {
                      return const SizedBox();
                    }

                    String title = localDatabase["Warme Küche"]["categories"]
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
                            bottom: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Hero(
                                tag: title,
                                child: Image.asset(
                                  imagePath,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
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
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: yanaColor,
                              ),
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
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
                      bottom: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Hero(
                          tag: title,
                          child: Image.asset(
                            imagePath,
                            alignment: Alignment.center,
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
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: yanaColor,
                        ),
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
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
