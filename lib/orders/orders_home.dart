import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/orders/login_state.dart';
import 'package:sushiyana_flutter/orders/login_screen.dart';
import 'package:sushiyana_flutter/orders/orders_screen.dart';
import 'package:sushiyana_flutter/presentation/widgets/animated_text_widget.dart';

class OrdersHome extends StatefulWidget {
  const OrdersHome({super.key});

  @override
  State<OrdersHome> createState() => _OrdersHomeState();
}

class _OrdersHomeState extends State<OrdersHome> {
  late LoginState _loginState;

  @override
  void initState() {
    _loginState = Provider.of<LoginState>(context, listen: false);
    _loginState.checkStoredLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return Scaffold(
        backgroundColor: tabBackground,
        appBar: AppBar(
          backgroundColor: tabBackground,
          toolbarHeight: 150,
          title: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/app_logo1024.png',
                  height: 150,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedTextWidget(
                  text:
                      'Sushi Yana - Bestellungen Übersicht}',
                  initColor: Colors.white,
                  hoverColor: Colors.white,
                  minSize: 30,
                  midSize: 25,
                  maxSize: 20,
                  fontFamily: "Julee",
                  enableFirstAnimation: true,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        bottomSheet: context.read<LoginState>().errorMessage != null
            ? Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10),
                child: Text(
                  context.read<LoginState>().errorMessage!,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            : null,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: loginState.isLoggedIn
              ? const OrdersScreen()
              : const LoginScreen(),
        ));
  }
}
