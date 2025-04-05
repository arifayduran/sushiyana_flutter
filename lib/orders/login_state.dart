import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/constants/main_url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginState extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String? _errorMessage;
  bool _isLoggedIn = false;
  String? _username;
  String? _token; 

  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;
  String? get username => _username;
  String? get token => _token;

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

        if (responseData['success'] == true && responseData['token'] != null) {
          _isLoggedIn = true;
          _errorMessage = null;
          _username = username;
          _token = responseData['token'];

          // Save token and username securely
          await _storage.write(key: 'username', value: username);
          await _storage.write(key: 'token', value: _token);
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
    _isLoggedIn = false;
    _username = null;
    _token = null;

    // Clear stored credentials
    await _storage.delete(key: 'username');
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'login_timestamp');

    notifyListeners();
  }

  Future<void> checkStoredLogin() async {
    final username = await _storage.read(key: 'username');
    final token = await _storage.read(key: 'token');
    final loginTimestamp = await _storage.read(key: 'login_timestamp');

    if (username != null && token != null && loginTimestamp != null) {
      final loginTime = DateTime.parse(loginTimestamp);
      if (DateTime.now().difference(loginTime).inDays < 4) {
        _isLoggedIn = true;
        _username = username;
        _token = token;
      } else {
        await logout();
      }
    }

    notifyListeners();
  }
}
