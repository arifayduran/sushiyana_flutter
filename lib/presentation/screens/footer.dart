import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/branch_selector.dart';
import 'package:sushiyana_flutter/presentation/screens/datenschutz_screen.dart';
import 'package:sushiyana_flutter/presentation/screens/impressum_screen.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.onResetHome});

  final VoidCallback onResetHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: barColor, // yanaColor
      height: 35,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BranchSelector(fontSize: 9, color: Colors.white),
              SizedBox(width: 9),
              const Text(
                "-",
                style: TextStyle(fontSize: 9, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil(
                    (route) => route.isFirst,
                  );
                  onResetHome();
                },
                child: const Text(
                  "Startseite",
                  style: TextStyle(fontSize: 9, color: Colors.white),
                ),
              ),
              const Text(
                "-",
                style: TextStyle(fontSize: 9, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute(
                        page: ImpressumScreen(
                      onResetHome: onResetHome,
                    )),
                  );
                },
                child: const Text(
                  "Impressum",
                  style: TextStyle(fontSize: 9, color: Colors.white),
                ),
              ),
              const Text(
                "-",
                style: TextStyle(fontSize: 9, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute(
                        page: DatenschutzScreen(
                      onResetHome: onResetHome,
                    )),
                  );
                },
                child: const Text(
                  "Datenschutz",
                  style: TextStyle(fontSize: 9, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
