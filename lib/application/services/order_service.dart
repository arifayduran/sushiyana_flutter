import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/domain/order_item.dart';

class OrderService {
  final String apiUrl = 'https://stream.sushiyanaspeisekarte.com/host_api.php';

  Future<bool> sendOrder({
    required String customerName,
    required List<OrderItem> items,
    required double totalPrice,
    String notes = '',
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'customer_name': customerName,
          'items': items.map((item) => item.toJson()).toList(),
          'total_price': totalPrice,
          'notes': notes,
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true; // Bestellung erfolgreich
      } else {
        // print('Fehler bei Bestellung: ${response.body}');
        return false;
      }
    } catch (e) {
      // print('Exception beim Bestellen: $e');
      return false;
    }
  }
}



 
       

        