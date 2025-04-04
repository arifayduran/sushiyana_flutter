import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginState extends ChangeNotifier {
  String? _errorMessage;
  bool _isLoggedIn = false;

  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String username, String password) async {
    final url = Uri.parse('https://flutter.sushiyanaspeisekarte.com/login.php');

    try {
      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['success'] == true) {
          _isLoggedIn = true;
          _errorMessage = null;
        } else {
          _isLoggedIn = false;
          _errorMessage = responseData['error'] ?? 'Unbekannter Fehler';
        }
      } else {
        _errorMessage = 'Serverfehler: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Netzwerkfehler: $e';
    }

    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _errorMessage = null;
    notifyListeners();
  }
}
