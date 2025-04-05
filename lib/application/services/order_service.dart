import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/constants/main_url.dart';
import 'package:sushiyana_flutter/domain/order_item.dart';

class OrderService {
  final String apiUrl = '$mainUrl/host_api.php';

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
}
