import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/application/fade_page_route.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/branch_selector.dart';
import 'package:sushiyana_flutter/presentation/datenschutz_screen.dart';
import 'package:sushiyana_flutter/presentation/impressum_screen.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.onResetHome});

  final VoidCallback onResetHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yanaColor,
      height: 50,
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
                onPressed: onResetHome,
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
                    FadePageRoute(page: const ImpressumScreen()),
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
                    FadePageRoute(page: const DatenschutzScreen()),
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
