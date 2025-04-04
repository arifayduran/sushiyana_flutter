import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/domain/order_item.dart';

class OrderService {
  final String apiUrl = 'https://stream.sushiyanaspeisekarte.com/host_api.php';

  Future<Map> sendOrder({
    required String branchName,
    required String customerName,
    required List<OrderItem> items,
    required double totalPrice,
    String? notes,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'filiale': branchName,
          'customer_name': customerName,
          'items': items.map((item) => item.toJson()).toList(),
          'total_price': totalPrice,
          if (notes != null) 'notes': notes,
        }),
      );

      final responseJson = jsonDecode(response.body);

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          responseJson["success"]) {
        return {
          "success": true,
          "id": responseJson["id"].toString(),
          "response": responseJson
        };
      } else {
        return {"success": true, "id": null, "response": responseJson};
      }
    } catch (e) {
      return {"success": false, "id": null, "response": e.toString()};
    }
  }

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      );

      if (response.statusCode == 401) {
        throw Exception('Nicht eingeloggt');
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseJson = jsonDecode(response.body);

        if (responseJson is List &&
            responseJson.isNotEmpty &&
            responseJson[0] is Map<String, dynamic>) {
          return List<Map<String, dynamic>>.from(responseJson);
        } else {
          throw Exception("Invalid response format");
        }
      } else {
        throw Exception(
            'Fehler beim Abrufen der Bestellungen: ${response.body}');
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteOrder(int id) async {
    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        body: jsonEncode({'id': id}),
      );

      if (response.statusCode == 401) {
        throw Exception('Nicht eingeloggt');
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return true; // Bestellung erfolgreich gelöscht
      } else {
        throw Exception('Fehler beim Löschen der Bestellung: ${response.body}');
      }
    } catch (e) {
      return false;
    }
  }
}
