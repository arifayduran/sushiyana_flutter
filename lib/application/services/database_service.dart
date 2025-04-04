import 'package:http/http.dart' as http;
import 'package:sushiyana_flutter/constants/main_url.dart';
import 'dart:convert';

import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/domain/item.dart';

class DatabaseService {
  final String baseUrl = mainUrl;

  Future<Map<String, List<dynamic>>> fetchAllData() async {
    final response = await http.get(Uri.parse('$baseUrl/api.php?all=true'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        // Ensure the response is in valid JSON format
        final data = json.decode(response.body);

        if (data is Map<String, dynamic>) {
          // Convert the map values to lists
          return data
              .map((key, value) => MapEntry(key, List<dynamic>.from(value)));
        } else {
          throw 'Unerwartetes Datenformat: $data';
        }
      } catch (e) {
        throw 'Fehler beim Parsen der JSON-Daten: $e';
      }
    } else {
      throw '${response.body} ${response.statusCode}';
    }
  }

  Future<void> fetchAndStoreItems() async {
    Map<String, List<dynamic>> allData = await fetchAllData();

    for (var category in localDatabase.values) {
      if (category.containsKey('origin')) {
        String origin = category['origin'];
        if (allData.containsKey(origin)) {
          category['items'] =
              allData[origin]!.map((json) => Item.fromJson(json)).toList();
        }
      }

      if (category.containsKey('categories')) {
        for (var subcategory in category['categories'].values) {
          if (subcategory.containsKey('origin')) {
            String origin = subcategory['origin'];
            if (allData.containsKey(origin)) {
              subcategory['items'] =
                  allData[origin]!.map((json) => Item.fromJson(json)).toList();
            }
          }
        }
      }
    }
  }

  Future<List<dynamic>> fetchData(String table) async {
    final response = await http.get(Uri.parse('$baseUrl/api.php?table=$table'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        // Ensure the response is in valid JSON format
        final data = json.decode(response.body);
        // debugPrint(data.toString());

        // Check if data is a list or map
        if (data is List) {
          return data; // It's a List, return it directly
        } else if (data is Map) {
          // If it's a map (JSON object), you can extract the list if available
          return data.values.toList(); // Example: take all values of the object
        } else {
          throw 'Unerwartetes Datenformat: $data';
        }
      } catch (e) {
        throw 'Fehler beim Parsen der JSON-Daten: $e';
      }
    } else {
      throw '${response.body} ${response.statusCode}';
    }
  }

  Future<void> fetchAndStoreItemsOnebyone() async {
    Future<void> fetchItemsForCategory(Map<String, dynamic> category) async {
      if (category.containsKey('origin')) {
        String origin = category['origin'];
        List fetchedData = await fetchData(origin);
        category['items'] =
            fetchedData.map((json) => Item.fromJson(json)).toList();
      }
    }

    for (var category in localDatabase.values) {
      await fetchItemsForCategory(category);
      if (category.containsKey('categories')) {
        for (var subcategory in category['categories'].values) {
          await fetchItemsForCategory(subcategory);
        }
      }
    }
  }
}
