import 'package:sushiyana_flutter/domain/item.dart';

Map<String, dynamic> localDatabase = {
  "Suppen": {
    "origin": "suppen",
    "imagePath": 'assets/images/startseite/suppen.jpg',
    "items": <Item>[],
  },
  "Vorspeisen": {
    "origin": "fingerfood",
    "imagePath": 'assets/images/startseite/vorspeisen.jpg',
    "items": <Item>[],
  },
  "Gyozas": {
    "origin": "gyoza",
    "imagePath": 'assets/images/startseite/gyozas.png',
    "items": <Item>[],
  },
  "Salate": {
    "origin": "salate",
    "imagePath": 'assets/images/startseite/salate.jpg',
    "items": <Item>[],
  },
  "Sommerrollen": {
    "origin": "sommerrollen",
    "imagePath": 'assets/images/startseite/sommerrollen.jpg',
    "items": <Item>[],
  },
  "Sushis": {
    "imagePath": 'assets/images/startseite/sushis.jpg',
    "categories": {
      "Menüs": {
        "origin": "menues",
        "imagePath": 'assets/images/sushis/Ebi_Menu.jpg',
        "items": <Item>[],
      },
      "Sashimis": {
        "origin": "sashimi",
        "imagePath": 'assets/images/sushis/Sashimi_Sake.jpg',
        "items": <Item>[],
      },
      "Makis": {
        "origin": "makis",
        "imagePath": 'assets/images/sushis/maki.jpg',
        "items": <Item>[],
      },
      "Inside Out Rolls": {
        "origin": "insideoutrolls",
        "imagePath": 'assets/images/sushis/ioroll.jpg',
        "items": <Item>[],
      },
      "Mini Yana Rolls": {
        "origin": "miniyanarolls",
        "imagePath": 'assets/images/sushis/miniyanaroll.jpg',
        "items": <Item>[],
      },
      "Yana Rolls": {
        "origin": "yanarolls",
        "imagePath": 'assets/images/sushis/yanaroll.jpg',
        "items": <Item>[],
      },
      "Nigiris": {
        "origin": "nigiris",
        "imagePath": 'assets/images/sushis/Nigiris_Head.jpg',
        "items": <Item>[],
      },
      "Special Rolls": {
        "origin": "specialRolls",
        "imagePath": 'assets/images/sushis/special.jpg',
        "items": <Item>[],
      },
      "Temakis": {
        "origin": "temaki",
        "imagePath": 'assets/images/sushis/temaki.jpg',
        "items": <Item>[],
      },
      // "Vegetarisch / Vegan": {
      //   "imagePath": 'assets/images/sushis/--vegetarisch.jpg',
      //   "items": <Item>[],
      // },
    },
  },
  "Warme Küche": {
    "imagePath": 'assets/images/startseite/warme_kueche.jpg',
    "categories": {
      "Gebratene Nudeln": {
        "origin": "nudeln",
        "imagePath": 'assets/images/warmeKueche/gebratene_nudeln.jpg',
        "items": <Item>[],
      },
      "Gebratener Reis": {
        "origin": "reis",
        "imagePath": 'assets/images/warmeKueche/gebratener_reis.jpg',
        "items": <Item>[],
      },
      "Gebratenes Gemüse": {
        "origin": "gemuese",
        "imagePath": 'assets/images/warmeKueche/gebratenes_gemuese.jpg',
        "items": <Item>[],
      },
      "Yellow Curry": {
        "origin": "yellowcurry",
        "imagePath": 'assets/images/warmeKueche/yellow_curry.jpg',
        "items": <Item>[],
      },
      "Mango Chutney": {
        "origin": "mangochutney",
        "imagePath": 'assets/images/warmeKueche/mango_chutney.jpg',
        "items": <Item>[],
      },
      "Erdnussgericht": {
        "origin": "erdnussgericht",
        "imagePath": 'assets/images/warmeKueche/erdnussgericht.jpg',
        "items": <Item>[],
      },
      "Chop Suey": {
        "origin": "chopsuey",
        "imagePath": 'assets/images/warmeKueche/chop_suey.jpg',
        "items": <Item>[],
      },
      "Red Curry": {
        "origin": "redcurry",
        "imagePath": 'assets/images/warmeKueche/red_curry.jpg',
        "items": <Item>[],
      },
      "Süß-Sauer Sauce": {
        "origin": "suesssauersauce",
        "imagePath": 'assets/images/warmeKueche/suess_sauer_sauce.jpg',
        "items": <Item>[],
      },
      "Extras": {
        "origin": "extrasWarm",
        "imagePath": 'assets/images/warmeKueche/Extras.jpg',
        "items": <Item>[],
      },
    },
  },
  "Bowls": {
    "origin": "bowls",
    "imagePath": 'assets/images/startseite/bowls.jpg',
    "items": <Item>[],
  },
  "Desserts": {
    "origin": "desserts",
    "imagePath": 'assets/images/startseite/desserts.jpg',
    "items": <Item>[],
  },
  "Extras": {
    "origin": "extras",
    "imagePath": 'assets/images/startseite/extras.jpg',
    "items": <Item>[],
  },
  "Getränke": {
    "origin": "getraenke",
    "imagePath": 'assets/images/startseite/getraenke.jpg',
    "items": <Item>[],
  },
  "Warme Getränke": {
    "origin": "warmgetraenke",
    "imagePath": 'assets/images/startseite/warme_getraenke.jpg',
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
