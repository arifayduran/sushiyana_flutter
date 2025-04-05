import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/constants/main_url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OrdersService {
  final _storage = const FlutterSecureStorage();

  Future<String?> _getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<List<dynamic>> fetchOrders() async {
    final url = Uri.parse('$mainUrl/host_api.php');
    final token = await _getToken();

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load orders: ${response.body}');
    }
  }

  Future<void> deleteOrder(int orderId) async {
    final url = Uri.parse('$mainUrl/host_api.php');
    final token = await _getToken();

    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: json.encode({'id': orderId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete order: ${response.body}');
    }
  }

  Future<void> deleteAllOrders() async {
    final url = Uri.parse('$mainUrl/host_api.php');
    final token = await _getToken();

    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: json.encode({'delete_all': true}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete all orders: ${response.body}');
    }
  }
}
