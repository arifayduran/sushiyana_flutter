import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/constants/main_url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginState extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String? _errorMessage;
  bool _isLoggedIn = true;

  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String username, String password) async {
    final url = Uri.parse('$mainUrl/login.php');

    try {
      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode <= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);

        if (responseData['success'] == true) {
          _isLoggedIn = true;
          _errorMessage = null;

          // Save credentials securely
          await _storage.write(key: 'username', value: username);
          await _storage.write(key: 'password', value: password);
          await _storage.write(
              key: 'login_timestamp', value: DateTime.now().toIso8601String());
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

  Future<void> logout() async {
    final url = Uri.parse('$mainUrl/logout.php');

    try {
      final response = await http.post(url);

      if (response.statusCode <= 200 && response.statusCode < 300) {
        _isLoggedIn = false;
        _errorMessage = null;

        // Clear stored credentials
        await _storage.deleteAll();
      } else {
        _errorMessage = 'Serverfehler beim Logout: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Netzwerkfehler beim Logout: $e';
    }

    notifyListeners();
  }

  Future<void> checkStoredLogin() async {
    final username = await _storage.read(key: 'username');
    final password = await _storage.read(key: 'password');
    final loginTimestamp = await _storage.read(key: 'login_timestamp');

    if (username != null && password != null && loginTimestamp != null) {
      final loginTime = DateTime.parse(loginTimestamp);
      if (DateTime.now().difference(loginTime).inDays < 4) {
        await login(username, password);
      } else {
        await _storage.deleteAll();
      }
    }
  }

  Future<String?> whoami() async {
    final url = Uri.parse('$mainUrl/whoami.php');

    try {
      final response = await http.get(url);

      if (response.statusCode <= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return responseData['filiale'];
      } else {
        _errorMessage = 'Serverfehler bei whoami: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Netzwerkfehler bei whoami: $e';
    }

    notifyListeners();
    return null;
  }
}
