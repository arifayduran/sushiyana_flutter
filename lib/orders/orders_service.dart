import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/constants/main_url.dart';

class OrdersService {
  Future<List<dynamic>> fetchOrders() async {
    final url = Uri.parse('$mainUrl/host_api.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<void> deleteOrder(int orderId) async {
    final url = Uri.parse('$mainUrl/host_api.php');
    final response = await http.delete(url, body: {'id': orderId.toString()});

    if (response.statusCode != 200) {
      throw Exception('Failed to delete order');
    }
  }

  Future<void> deleteAllOrders() async {
    final url = Uri.parse('$mainUrl/host_api.php');
    final response = await http.delete(url, body: {'delete_all': 'true'});

    if (response.statusCode != 200) {
      throw Exception('Failed to delete all orders');
    }
  }
}
