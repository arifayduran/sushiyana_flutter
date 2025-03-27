import 'package:sushiyana_flutter/domain/item.dart';

Map<String, dynamic> localDatabase = {
  "Suppen": {
    "origin": "suppen",
    "imagePath": 'assets/images/startseite/suppen.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Vorspeisen": {
    "origin": "fingerfood",
    "imagePath": 'assets/images/startseite/vorspeisen.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Gyozas": {
    "origin": "gyoza",
    "imagePath": 'assets/images/startseite/gyozas.png',
    "infoText": "",
    "items": <Item>[],
  },
  "Salate": {
    "origin": "salate",
    "imagePath": 'assets/images/startseite/salate.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Sommerrollen": {
    "origin": "sommerrollen",
    "imagePath": 'assets/images/startseite/sommerrollen.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Sushis": {
    "imagePath": 'assets/images/startseite/sushis.jpg',
    "infoText": "",
    "categories": {
      "Menüs": {
        "origin": "menues",
        "imagePath": 'assets/images/maincategory_sushis/Ebi_Menu.jpg',
        "infoText": "",
        "items": <Item>[],
      },
      "Sashimis": {
        "origin": "sashimi",
        "imagePath": 'assets/images/maincategory_sushis/Sashimi_Sake.jpg',
        "infoText": "",
        "items": <Item>[],
      },
      "Makis": {
        "origin": "makis",
        "imagePath": 'assets/images/maincategory_sushis/maki.jpg',
        "infoText": "je 6 Stück",
        "items": <Item>[],
      },
      "Inside Out Rolls": {
        "origin": "insideoutrolls",
        "imagePath": 'assets/images/maincategory_sushis/ioroll.jpg',
        "infoText": "je 8 Stück",
        "items": <Item>[],
      },
      "Mini Yana Rolls": {
        "origin": "miniyanarolls",
        "imagePath": 'assets/images/maincategory_sushis/miniyanaroll.jpg',
        "infoText": "je 6 Stück",
        "items": <Item>[],
      },
      "Yana Rolls": {
        "origin": "yanarolls",
        "imagePath": 'assets/images/maincategory_sushis/yanaroll.jpg',
        "infoText": "je 6 Stück",
        "items": <Item>[],
      },
      "Nigiris": {
        "origin": "nigiris",
        "imagePath": 'assets/images/maincategory_sushis/Nigiris_Head.jpg',
        "infoText": "1 Stück",
        "items": <Item>[],
      },
      "Special Rolls": {
        "origin": "specialRolls",
        "imagePath": 'assets/images/maincategory_sushis/special.jpg',
        "infoText": "je 8 Stück",
        "items": <Item>[],
      },
      "Temakis": {
        "origin": "temaki",
        "imagePath": 'assets/images/maincategory_sushis/temaki.jpg',
        "infoText": "1 Stück",
        "items": <Item>[],
      },
      // "Vegetarisch / Vegan": {
      //   "imagePath": 'assets/images/maincategory_sushis/--vegetarisch.jpg',
      //   "items": <Item>[],
      // },
    },
  },
  "Warme Küche": {
    "imagePath": 'assets/images/startseite/warme_kueche.jpg',
    "categories": {
      "Gebratene Nudeln": {
        "origin": "nudeln",
        "imagePath":
            'assets/images/maincategory_warmekueche/gebratene_nudeln.jpg',
        "infoText": "Alle Gerichte werden mit Ei, Karotten, Sojasprossen, Frühlingszwiebeln und Röstzwiebeln zubereitet.",
        "items": <Item>[],
      },
      "Gebratener Reis": {
        "origin": "reis",
        "imagePath":
            'assets/images/maincategory_warmekueche/gebratener_reis.jpg',
        "infoText": "Alle Gerichte werden mit Ei, frischem Gemüse, Sojabohnen und Röstzwiebeln zubereitet.",
        "items": <Item>[],
      },
      "Gebratenes Gemüse": {
        "origin": "gemuese",
        "imagePath":
            'assets/images/maincategory_warmekueche/gebratenes_gemuese.jpg',
        "infoText": "Alle Gerichte werden mit Zitronengras, Paprika, Peperoni, Zwiebeln und sehr scharfer Kurkuma-Sauce zubereitet und mit Jasmin Reis serviert.",
        "items": <Item>[],
      },
      "Yellow Curry": {
        "origin": "yellowcurry",
        "imagePath": 'assets/images/maincategory_warmekueche/yellow_curry.jpg',
        "infoText": "Alle Gerichte werden mit Kokosmilch-Sahne und frischem Gemüse zubereitet und mit Jasmin-Reis serviert.\n\nYellow Curry mit:",
        "items": <Item>[],
      },
      "Mango Chutney": {
        "origin": "mangochutney",
        "imagePath": 'assets/images/maincategory_warmekueche/mango_chutney.jpg',
        "infoText": " Alle Gerichte werden mit Kokosmilch-Sahne und frischem Gemüse zubereitet und mit Jasmin-Reis serviert.\n\nMango Chutney mit:",
        "items": <Item>[],
      },
      "Erdnussgericht": {
        "origin": "erdnussgericht",
        "imagePath":
            'assets/images/maincategory_warmekueche/erdnussgericht.jpg',
        "infoText": "Alle Gerichte werden mit Kokosmilch-Sahne und frischem Gemüse zubereitet und mit Jasmin-Reis serviert.\n\nErdnussgericht mit:",
        "items": <Item>[],
      },
      "Chop Suey": {
        "origin": "chopsuey",
        "imagePath": 'assets/images/maincategory_warmekueche/chop_suey.jpg',
        "infoText": "Alle Gerichte werden mit frischem Gemüse und Sojasprossen zubereitet und mit Jasmin-Reis serviert.\n\nChop Suey mit:",
        "items": <Item>[],
      },
      "Red Curry": {
        "origin": "redcurry",
        "imagePath": 'assets/images/maincategory_warmekueche/red_curry.jpg',
        "infoText": "Alle Gerichte werden mit mit Kokosmilch, Sahne, frischem Gemüse und Thai-Basilikum zubereitet und mit Jasmin-Reis serviert.\n\nRed Curry mit:",
        "items": <Item>[],
      },
      "Süß-Sauer Sauce": {
        "origin": "suesssauersauce",
        "imagePath":
            'assets/images/maincategory_warmekueche/suess_sauer_sauce.jpg',
        "infoText": "Alle Gerichte werden mit Ananas, Tomaten, Paprika und Karotten zubereitet und mit Jasmin-Reis serviert.\n\nSüß-Sauer Sauce mit:",
        "items": <Item>[],
      },
      "Extras": {
        "origin": "extrasWarm",
        "imagePath": 'assets/images/maincategory_warmekueche/Extras.jpg',
        "infoText": "",
        "items": <Item>[],
      },
    },
  },
  "Bowls": {
    "origin": "bowls",
    "imagePath": 'assets/images/startseite/bowls.jpg',
    "infoText": "Alle Bowls werden mit Sushi Reis, Eisbergsalat, Rucola, Paprika, Gurken, Möhrenstreifen, Sesam, Erdnüssen und veganer Unagisauce zubereitet.",
    "items": <Item>[],
  },
  "Desserts": {
    "origin": "desserts",
    "imagePath": 'assets/images/startseite/desserts.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Extras": {
    "origin": "extras",
    "imagePath": 'assets/images/startseite/extras.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Getränke": {
    "origin": "getraenke",
    "imagePath": 'assets/images/startseite/getraenke.jpg',
    "infoText": "",
    "items": <Item>[],
  },
  "Warme Getränke": {
    "origin": "warmgetraenke",
    "imagePath": 'assets/images/startseite/warme_getraenke.jpg',
    "infoText": "",
    "items": <Item>[],
  },
};

List<String> dbOriginCategories = [
  "bowls",
  "chopsuey",
  "desserts",
  "erdnussgericht",
  "extras",
  "extrasWarm",
  "fingerfood",
  "gemuese",
  "getraenke",
  "gyoza",
  "insideoutrolls",
  "makis",
  "mangochutney",
  "menues",
  "miniyanarolls",
  "nigiris",
  "nudeln",
  "redcurry",
  "reis",
  "salate",
  "sashimi",
  "sommerrollen",
  "specialRolls",
  "suesssauersauce",
  "suppen",
  "temaki",
  "warmgetraenke",
  "yanarolls",
  "yellowcurry"
];
