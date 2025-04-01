import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/application/database_service.dart';
import 'dart:async';

import 'package:sushiyana_flutter/data/is_data_fetched.dart';

Future<void> fetchDataWithRetry(BuildContext context,
    {int retryCount = 3}) async {
  DatabaseService dbService = DatabaseService();
  Exception? lastError;
  bool success = false;

  // Starte die 1 Sekunde Wartezeit und den Ladevorgang gleichzeitig
  await Future.wait([
    Future.delayed(Duration(milliseconds: 1000)),
    (() async {
      for (int i = 0; i < retryCount; i++) {
        try {
          await dbService.fetchAndStoreItems();
          isDataFetched = true;
          success = true;
          break;
        } catch (e) {
          lastError = e is Exception ? e : Exception(e.toString());
          await Future.delayed(Duration(seconds: 2));
        }
      }
    })()
  ]);

  if (!success && context.mounted && lastError != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Fehler beim Laden der Daten: $lastError",
            style: TextStyle(color: Colors.white, fontSize: 12)),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  isDataFetched = success;
}
