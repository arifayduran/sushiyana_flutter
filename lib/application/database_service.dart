import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseService {
  final String baseUrl = 'https://flutter.sushiyanaspeisekarte.com';

  Future<List<dynamic>> fetchData(String table) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api.php?table=$table'));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          // Ensure the response is in valid JSON format
          final data = json.decode(response.body);
          debugPrint(data.toString());

          // Check if data is a list or map
          if (data is List) {
            return data; // It's a List, return it directly
          } else if (data is Map) {
            // If it's a map (JSON object), you can extract the list if available
            return data.values
                .toList(); // Example: take all values of the object
          } else {
            throw 'Unerwartetes Datenformat: $data';
          }
        } catch (e) {
          throw 'Fehler beim Parsen der JSON-Daten: $e';
        }
      } else {
        throw 'Fehler beim Laden der Daten: ${response.body} ${response.statusCode}';
      }
    } catch (e) {
      // Handle any network or connection errors
      throw 'Fehler beim Laden der Daten: $e';
    }
  }

  Future<List<dynamic>> fetchExtras() async {
    return fetchData('extras');
  }
}
