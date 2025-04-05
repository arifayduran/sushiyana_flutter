import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/navigator_key.dart';
import 'package:sushiyana_flutter/application/providers/branch_provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/application/providers/scroll_state_provider.dart';
import 'package:sushiyana_flutter/application/show_animations_variables.dart';
import 'package:sushiyana_flutter/config/scroll_configuration_behavior.dart';
import 'package:sushiyana_flutter/orders/login_state.dart';
// import 'package:sushiyana_flutter/presentation/d__splash_screen.dart';
import 'package:sushiyana_flutter/presentation/screens/home_screen.dart';
import 'package:sushiyana_flutter/orders/orders_home.dart';

void main() async {
  bool isOrders = isOrdersVersion();
  if (isOrders) {
    runApp(ChangeNotifierProvider(
      create: (context) => LoginState(),
      child: MaterialApp(
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Julee",
        ),
        title: 'Sushi Yana - Digitale Speisekarte',
        // theme: ThemeData(
        //   primarySwatch: yanaColor,
        // ),
        home: ScrollConfiguration(
            behavior: ScrollConfigurationBehavior(), child: OrdersHome()),
      ),
    ));
    return;
  }

  WidgetsFlutterBinding.ensureInitialized();

  final branchProvider = BranchProvider();

  String subdomain = _getSubdomain(branchProvider);
  await branchProvider.setBranch(subdomain);

  final cartProvider = CartProvider();
  cartProvider.setBranch(branchProvider.currentBranch);
  await cartProvider.loadCartFromStorage();
  await cartProvider.loadNotesFromStorage();

  final secureStorage = const FlutterSecureStorage();

  String showZoomAnimationString =
      (await secureStorage.read(key: 'showZoomHandAnimation')) ?? '';

  String showTapHandAnimationString =
      (await secureStorage.read(key: 'showTapHandAnimation')) ?? '';

  if (showTapHandAnimationString == "false") {
    showZoomAnimation = false;
  } else {
    showZoomAnimation = true;
  }

  if (showZoomAnimationString == "false") {
    showTapHandAnimation = false;
  } else {
    showTapHandAnimation = true;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => branchProvider),
        ChangeNotifierProvider(create: (context) => ScrollStateProvider()),
        ChangeNotifierProvider(create: (context) => cartProvider),
      ],
      child: const MyApp(),
    ),
  );
}

bool isOrdersVersion() {
  String host = Uri.base.host;
  List<String> parts = host.split(".");
  String subdomain = (parts.length > 2) ? parts[0].toLowerCase() : "";
  if (subdomain == "bestellungen") {
    return true;
  } else {
    return false;
  }
}

String _getSubdomain(dynamic branchProvider) {
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
      color: Colors.black,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: "Julee",
      // ),
      title: 'Sushi Yana - Digitale Speisekarte',
      // theme: ThemeData(
      //   primarySwatch: yanaColor,
      // ),
      home: ScrollConfiguration(
          behavior: ScrollConfigurationBehavior(), child: const HomeScreen()),
      //  home: FadePageRoute(page: const HomeScreen()),
    );
  }
}
