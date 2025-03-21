import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/constants/assets_paths.dart';
import 'package:sushiyana_flutter/constants/colors.dart';

class ItemsTab extends StatelessWidget {
  final String heroTag;
  final VoidCallback onBack;

  const ItemsTab({
    super.key,
    required this.heroTag,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: heroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(mainItems[heroTag]!),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 11,
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTile(
                        title: Text("Beispielartikel",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        trailing: Text("3,99 €",
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      );
                    }),
              ),
              const Divider(
                color: Colors.white,
                height: 40,
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: const Center(
              child: Text(
                "Nichts ausgewählt",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 40,
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
        ],
      ),
    );
  }
}
