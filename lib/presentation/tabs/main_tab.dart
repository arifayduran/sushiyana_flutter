import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/constants/assets_paths.dart';
import 'package:sushiyana_flutter/constants/colors.dart';

class MainTab extends StatelessWidget {
  final Function(String) onItemTapped;

  const MainTab({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          itemCount: mainItems.length,
          itemBuilder: (BuildContext context, int index) {
            String title = mainItems.keys.elementAt(index);
            String imagePath = mainItems.values.elementAt(index);
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
                        onTap: () => onItemTapped(title),
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
                          fontSize: 14,
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
