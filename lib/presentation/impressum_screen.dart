import 'package:flutter/material.dart';

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 150,
          child: Image.asset(
            "assets/images/logo2.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        toolbarHeight: 180,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 500,
              width: 350,
              child: const SingleChildScrollView(
                child: Text(
                    "ImpressumScreen\n\nVerantwortlich für die Startseite und die weiteren Informationsseiten (ohne Onlineshops) dieser Webseite ist:\n\nSushi Yana GmbH\nFlughafenstraße 76\n12049 Berlin\nbuero@sushi-yana.de\n\nGeschäftsführer: Wesam El-Saadi\nZuständiges Gericht: Amtsgericht Charlottenburg\nHandelsregister: HRB 233774 B\nSteuernummer: 29/553/32890\nUst.: DE347204498\n\nJede Sushi Yana Filiale wird von einem selbstständig tätigen Gewerbetreibenden als Franchisenehmer bewirtschaftet. Dieser organisiert Produktion und Auslieferung seiner Produkte für seinen Betrieb in eigener Verantwortung. Wenn du Fragen oder Anliegen zu deiner Lieferung hast, wende dich bitte an den Verantwortlichen des jeweiligen Betriebes, den du in vorstehender Liste finden kannst.\n\nUnsere Franchisezentrale erreichen Sie über die Mailadresse buero@sushi-yana.de. Bitte nutzen Sie diese ausschließlich für allgemeine Anfragen."),
              ),
            )
          ],
        ),
      ),
    );
  }
}
