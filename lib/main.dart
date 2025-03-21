import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/database_service.dart';
// import 'package:sushiyana_flutter/presentation/d__splash_screen.dart';
import 'package:sushiyana_flutter/presentation/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String subdomain = getSubdomain(BranchProvider());

  await dotenv.load(fileName: "assets/.env");

  DatabaseService dbService = DatabaseService();
  await dbService.fetchData("extras");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BranchProvider()..setBranch(subdomain)),
      ],
      child: const MyApp(),
    ),
  );
}

String getSubdomain(dynamic branchProvider) {
  String host = Uri.base.host;
  List<String> parts = host.split(".");

  String subdomain = (parts.length > 2) ? parts[0].toLowerCase() : "neukoelln";

  if (branchProvider.branches.containsKey(subdomain)) {
    return subdomain;
  } else {
    return "neukoelln";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sushi Yana - Digitale Speisekarte',
      // theme: ThemeData(
      //   primarySwatch: yanaColor,
      // ),
      home: const HomeScreen(),
      //  home: FadePageRoute(page: const HomeScreen()),
    );
  }
}
