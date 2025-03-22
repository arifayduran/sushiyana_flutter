import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/item_assets.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/presentation/lottie_animation_sushi.dart';

class ItemsTab extends StatelessWidget {
  final String heroTag;
  final VoidCallback onBack;

  const ItemsTab({
    super.key,
    required this.heroTag,
    required this.onBack,
  });

  //  Positioned(
  //         top: 10,
  //         left: 20,
  //         child: ElevatedButton(
  //             onPressed: onBack,
  //             style: ButtonStyle(
  //                 backgroundColor: WidgetStateProperty.all(yanaColor),
  //                 elevation: WidgetStateProperty.all(5),
  //                 foregroundColor: WidgetStateProperty.all(Colors.white),
  //                 shadowColor: WidgetStateProperty.all(yanaColor)),
  //             child: const Icon(Icons.arrow_back_ios_new)),
  //       ),

  @override
  Widget build(BuildContext context) {
    // Device Width
    double deviceWidth = MediaQuery.of(context).size.width;

    // Berechnung der Breite (maximal 500)
    double calculatedWidth = deviceWidth * 0.8;
    double finalWidth = calculatedWidth > 600 ? 600 : calculatedWidth;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Container(
          color: itemsTabBackground,
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
          alignment: Alignment.center,
          child: Column(
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       heroTag,
              //       style: TextStyle(
              //           color: Colors.white,
              //           letterSpacing: 2.5,
              //           fontFamily: "Julee",
              //           fontSize: 23),
              //     )),
              // SizedBox(
              //   height: 20,
              // ),
              // const Divider(
              //   color: Colors.white,
              //   thickness: 0.3,
              //   height: 0,
              // ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 11,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 600,
                            child: Image.asset(
                              itemAssets.values.toList()[index + 120],
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            child: Text(
                              "222",
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
                            width: finalWidth,
                            child: Text(
                              "Garnelen-Kokosmilch-Suppe (sauer-scharf)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Julee",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 5,
                            children: [
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child:
                                      Image.asset("assets/icons/pikant.png")),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                      "assets/icons/vegetarisch.png")),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/icons/vegan.png")),
                              IconButton(
                                  iconSize: 25,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.info,
                                    color: yanaColor,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: finalWidth,
                            child: Center(
                              child: Text(
                                "4 Stück Inside-Out California - Masago\n6 Stück Maki Sake Avocado\n6 Stück Yana Roll Lachs\n1 Stück Nigiri Sake\n1 Stück Nigiri White Butterfisch",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 184, 184, 184),
                                    fontFamily: "Julee",
                                    fontWeight: FontWeight.w100,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          SizedBox(
                            width: finalWidth,
                            child: Text(
                              "9,99 €",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontFamily: "Julee",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Divider(
                                color: Colors.white,
                                thickness: 0.3,
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
                    }),
              ),
            ],
          ),
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
    return Container(
      color: itemsTabBackground,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    LottieAnimationSushi(),
                    Text(
                      "Keine Kategorie ausgewählt.",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Julee",
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 60,
              thickness: 0.2,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: onBack,
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(yanaColor),
                      elevation: WidgetStateProperty.all(5),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shadowColor: WidgetStateProperty.all(yanaColor)),
                  child: const Icon(Icons.arrow_back_ios_new)),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
