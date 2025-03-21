import 'package:flutter/material.dart';

class BranchProvider extends ChangeNotifier {
  String get currentBranch => _currentBranch;
  Map<String, dynamic> get branchData => _branchData;
  Map<String, String> get branches => _branches;

  String _currentBranch = "neukoelln";
  final Map<String, String> _branchData = {};

  final Map<String, String> _branches = {
    "neukoelln": "Neukölln",
    "charlottenburg": "Charlottenburg",
    "ffo": "Frankfurt (Oder)",
    "friedrichshain": "Friedrichshain",
    "lichtenrade": "Lichtenrade",
    "mitte": "Mitte",
    "moabit": "Moabit",
    "potsdam": "Potsdam",
    "rudow": "Rudow",
    "spandau": "Spandau",
    "tegel": "Tegel",
    "weissensee": "Weißensee",
    "zehlendorf": "Zehlendorf",
  };

  void setBranch(String subdomain) {
    _currentBranch = subdomain;
    _branchData["name"] = _branches[subdomain] ?? _branches["neukoelln"]!;
    notifyListeners();
  }
}
