import 'package:flutter/material.dart';

class ScrollStateProvider with ChangeNotifier {
  bool _isTopScrollButtonEnabled = false;
  bool _isBotScrollButtonEnabled = true;

  bool get isTopScrollButtonEnabled => _isTopScrollButtonEnabled;
  bool get isBotScrollButtonEnabled => _isBotScrollButtonEnabled;

  void setTopScrollButtonEnabled(bool value) {
    _isTopScrollButtonEnabled = value;
    notifyListeners();
  }

  void setBotScrollButtonEnabled(bool value) {
    _isBotScrollButtonEnabled = value;
    notifyListeners();
  }
}
