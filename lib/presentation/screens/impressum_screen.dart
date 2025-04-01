import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/fade_page_route.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/branch_selector.dart';
import 'package:sushiyana_flutter/presentation/screens/datenschutz_screen.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({super.key, required this.onResetHome});

  final VoidCallback onResetHome;

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);

    void sendEmail(String email) {
      final String subject = "Anfrage";

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          'subject': subject,
        },
      );

      html.window.open(emailUri.toString(), '_blank');
    }

    return Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            height: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/images/logo2.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          toolbarHeight: 180,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        bottomNavigationBar: Container(
          color: yanaColor,
          height: 50,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const BranchSelector(fontSize: 9, color: Colors.white),
                  SizedBox(width: 9),
                  const Text(
                    "-",
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // onResetHome();
                      Navigator.of(context).popUntil(
                        (route) => route.isFirst,
                      );
                    },
                    child: const Text(
                      "Zurück zur Speisekarte",
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
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // onResetHome();
                      Navigator.of(context).popUntil(
                        (route) => route.isFirst,
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      // onResetHome();
                      Navigator.of(context).popUntil(
                        (route) => route.isFirst,
                      );
                    },
                    child: Text(
                      "Schliessen",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Julee",
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 600, minHeight: 400),
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Impressum Sushi Yana ${branchProvider.branchData["name"]}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Verantwortlich für die Startseite und die weiteren Informationsseiten (ohne Onlineshops) dieser Webseite ist:",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 20),
                    Text(branchProvider.branchData["address"]),
                    InkWell(
                      onTap: () =>
                          sendEmail(branchProvider.branchData["email"]),
                      child: Text(
                        branchProvider.branchData["email"],
                        style: TextStyle(
                            color: Colors.blue,
                            height: 1,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(branchProvider.branchData["contact"]),
                    SizedBox(height: 20),
                    Text(
                      "Jede Sushi Yana Filiale wird von einem selbstständig tätigen Gewerbetreibenden als Franchisenehmer bewirtschaftet. Dieser organisiert Produktion und Auslieferung seiner Produkte für seinen Betrieb in eigener Verantwortung. Wenn du Fragen oder Anliegen zu deiner Lieferung hast, wende dich bitte an den Verantwortlichen des jeweiligen Betriebes, den du in vorstehender Liste finden kannst.",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Unsere Franchisezentrale erreichen Sie über die Mailadresse:",
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () => sendEmail("buero@sushi-yana.de"),
                      child: Text(
                        "buero@sushi-yana.de",
                        style: TextStyle(
                            color: Colors.blue,
                            height: 1,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        "Bitte nutzen Sie diese ausschließlich für allgemeine Anfragen."),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
