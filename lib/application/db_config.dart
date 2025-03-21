import 'package:flutter_dotenv/flutter_dotenv.dart';

class DBConfig {
  static String get host => dotenv.env['DB_HOST'] ?? 'localhost';
  static int get port => int.tryParse(dotenv.env['DB_PORT'] ?? '3306') ?? 3306;
  static String get user => dotenv.env['DB_USER'] ?? 'root';
  static String get password => dotenv.env['DB_PASSWORD'] ?? '';
  static String get dbName => dotenv.env['DB_NAME'] ?? 'test_db';
}
