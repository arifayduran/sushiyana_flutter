import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/orders/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return SizedBox.expand(
        child: Center(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: .5),
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Filial-Login',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            focusNode: _focusNode,
            controller: _usernameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => FocusScope.of(context).nextFocus(),
            decoration: const InputDecoration(
              hintText: 'Benutzername',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            focusNode: _passwordFocusNode,
            onEditingComplete: () => loginState.login(
                _usernameController.text, _passwordController.text),
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) => loginState.login(
                _usernameController.text, _passwordController.text),
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Passwort',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            width: 80,
            child: ElevatedButton(
              onPressed: () => loginState.login(
                  _usernameController.text, _passwordController.text),
              style: ElevatedButton.styleFrom(
                backgroundColor: yanaColor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
          if (loginState.errorMessage != null) ...[
            const SizedBox(height: 10),
            Text(
              loginState.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    )));
  }
}
