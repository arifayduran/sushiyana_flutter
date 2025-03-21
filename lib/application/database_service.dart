import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException(this.message, this.statusCode);

  @override
  String toString() {
    return 'ApiException: $message (Status Code: $statusCode)';
  }
}

class DatabaseService {
  final String baseUrl = 'https://flutter.sushiyanaspeisekarte.com';

  Future<List<dynamic>> fetchData(String table) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api.php?table=$table'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ApiException('Fehler beim Laden der Daten: ${response.body}',
            response.statusCode);
      }
    } catch (e) {
      throw ApiException('Fehler beim Laden der Daten: $e', 500);
    }
  }

  Future<List<dynamic>> fetchExtras() async {
    return fetchData('extras');
  }
}
