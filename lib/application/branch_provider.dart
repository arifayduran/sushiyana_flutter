import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BranchProvider extends ChangeNotifier {
  final _storage = FlutterSecureStorage();

  String get currentBranch => _currentBranch;
  Map<String, dynamic> get branchData => _branchData;
  Map<String, Map<String, String>> get branches => _branches;

  String _currentBranch = "neukoelln";
  final Map<String, String> _branchData = {};

  final Map<String, Map<String, String>> _branches = {
    "neukoelln": {
      "name": "Neukölln",
      "address": "Sushi Yana Neukölln\nFlughafenstraße 76\n12049 Berlin",
      "contact": "Geschäftsführer: Hussein Hamid\nSteuernummer: 16/329/04249",
      "email": "neukoelln@sushi-yana.de",
    },
    "charlottenburg": {
      "name": "Charlottenburg",
      "address":
          "Sushi Yana Charlottenburg\nLietzenburger Straße 29\n10789 Berlin",
      "contact":
          "Geschäftsführer: Giorgos Mavridis\nSteuernummer: 24/437/02213",
      "email": "charlottenburg@sushi-yana.de",
    },
    "ffo": {
      "name": "Frankfurt Oder",
      "address":
          "Sushi Yana Frankfurt Oder\nDresdener Platz 9\n15232 Frankfurt (Oder)-Güldendorf",
      "contact": "Geschäftsführer: Fadi Khachab\nSteuernummer: xx/xxx/xxx",
      "email": "sushi-yana-ff@outlook.de",
    },
    "friedrichshain": {
      "name": "Friedrichshain",
      "address": "Sushi Yana Friedrichshain\nKarl-Marx-Allee 140\n10243 Berlin",
      "contact": "Geschäftsführer: Troyan Monev\nSteuernummer: 14/447/07652",
      "email": "sushiyana.karlmarx@gmail.com",
    },
    "lichtenrade": {
      "name": "Lichtenrade",
      "address": "Sushi Yana Lichtenrade\nBahnhoffstraße 29\n12305 Berlin",
      "contact": "Geschäftsführer: Pablo Gonzales\nSteuernummer: beantragt",
      "email": "paylichtenrade@sushi-yana.de",
    },
    "mitte": {
      "name": "Mall of Berlin GmbH",
      "address":
          "Sushi Yana Mall of Berlin GmbH\nLeipziger Platz 12\n10117 Berlin",
      "contact":
          "Geschäftsführer: Hussein Hamid\nZuständiges Gericht: Amtsgericht Charlottenburg\nHandelsregister: HRB 235940 B\nSteuernummer: 1130/553/51695",
      "email": "buero@sushi-yana.de",
    },
    "moabit": {
      "name": "Moabit",
      "address": "Sushi Yana Moabit\nGotzkowskystraße 26\n10555 Berlin",
      "contact": "Geschäftsführer: Hani El-Jamal\nSteuernummer: 034/275/02211",
      "email": "moabit@sushi-yana.de",
    },
    "potsdam": {
      "name": "Potsdam",
      "address": "Sushi Yana Potsdam\nKastanienallee 17\n14471 Potsdam",
      "contact": "Geschäftsführer: Despoina Pappa\nSteuernummer: 046/255/11807",
      "email": "potsdam@sushi-yana.de",
    },
    "rudow": {
      "name": "Rudow GmbH & Co. KG",
      "address":
          "Sushi Yana Rudow GmbH & Co. KG\nHugo-Heimann-Straße 10\n12353 Berlin",
      "contact":
          "Geschäftsführer: Ibrahim El-Saadi\nZuständiges Gericht: Amtsgericht Charlottenburg\nHandelsregister: HRA 59089\nSteuernummer: 16/276/00326\nUst.: DE347204498",
      "email": "rudow@sushi-yana.de",
    },
    "spandau": {
      "name": "Spandau",
      "address": "Sushi Yana Spandau\nPichelsdorferstraße 120\n13595 Berlin",
      "contact": "Geschäftsführer: Ibrahim Hamade\nSteuernummer: 19/929/00826",
      "email": "spandau@sushi-yana.de",
    },
    "tegel": {
      "name": "Tegel",
      "address": "Sushi Yana Tegel\nMedebacher Weg 12\n13507 Berlin",
      "contact": "Geschäftsführer: Nagy Varga\nSteuernummer: xx/xxx/xxxxx",
      "email": "tegel@sushi-yana.de",
    },
    "weissensee": {
      "name": "Weißensee",
      "address": "Sushi Yana Weißensee\nLiebermannstraße 95\n13088 Berlin",
      "contact": "Geschäftsführer: Tolga Cildasi\nSteuernummer: xx/xxx/xxxxx",
      "email": "buero@sushi-yana.de",
    },
    "zehlendorf": {
      "name": "Zehlendorf",
      "address": "Sushi Yana Zehlendorf\nBerlinerstraße 67\n14169 Berlin",
      "contact": "Geschäftsführer: Julio Alvarez\nSteuernummer: xx/xxx/xxxxx",
      "email": "steglitz@sushi-yana.de",
    },
  };

  BranchProvider() {
    _initializeBranch();
  }

  Future<void> _initializeBranch() async {
    String? savedBranch = await _storage.read(key: 'currentBranch');
    if (savedBranch != null && _branches.containsKey(savedBranch)) {
      setBranch(savedBranch);
    } else {
      setBranch("neukoelln");
    }
  }

  void setBranch(String subdomain) {
    _currentBranch = subdomain;
    _branchData["name"] =
        (_branches[subdomain]?["name"] ?? _branches["neukoelln"]!["name"])!;
    _branchData["address"] = (_branches[subdomain]?["address"] ??
        _branches["neukoelln"]!["address"])!;
    _branchData["contact"] = (_branches[subdomain]?["contact"] ??
        _branches["neukoelln"]!["contact"])!;
    _branchData["email"] =
        (_branches[subdomain]?["email"] ?? _branches["neukoelln"]!["email"])!;

    _storage.write(key: 'currentBranch', value: subdomain);
    notifyListeners();
  }
}
