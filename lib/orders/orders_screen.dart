import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/orders/orders_service.dart';
import 'package:sushiyana_flutter/orders/login_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final OrdersService _ordersService = OrdersService();
  late Future<List<dynamic>> _ordersFuture;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Set<int> _newOrderIds = {};
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _ordersFuture = _fetchAndHighlightOrders();

    _refreshTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _refreshOrders();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<List<dynamic>> _fetchAndHighlightOrders() async {
    final orders = await _ordersService.fetchOrders();
    final newOrderIds = orders.map((order) => order['id']).toSet();

    if (_newOrderIds.isEmpty) {
      _newOrderIds = newOrderIds.cast<int>();
    } else {
      final newOrders = newOrderIds.difference(_newOrderIds);
      if (newOrders.isNotEmpty) {
        _audioPlayer.play(
            AssetSource('assets/sounds/sushi_yana_japanese_ping_long.mp3'));
        setState(() {
          _newOrderIds = newOrderIds.cast<int>();
        });
      }
    }

    return orders;
  }

  void _refreshOrders() {
    setState(() {
      _ordersFuture = _fetchAndHighlightOrders();
    });
  }

  void _deleteOrder(int orderId) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bestellung löschen'),
        content: const Text('Möchten Sie diese Bestellung wirklich löschen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _ordersService.deleteOrder(orderId);
      _refreshOrders();
    }
  }

  void _deleteAllOrders() async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alle Bestellungen löschen'),
        content: const Text('Möchten Sie wirklich alle Bestellungen löschen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _ordersService.deleteAllOrders();
      _refreshOrders();
    }
  }

  void _markOrderAsInteracted(int orderId) {
    setState(() {
      _newOrderIds.remove(orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return SizedBox.expand(
      child: Column(
        children: [
          Text(loginState.username == "admin"
              ? "🔑 Admin-Modus – Zentrale Übersicht"
              : "📍 Eingeloggt als: ${loginState.username}"),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshOrders,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: loginState.logout,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _ordersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Fehler beim Laden der Bestellungen:'),
                        Text(snapshot.error.toString(),
                            style: const TextStyle(color: Colors.red)),
                        ElevatedButton(
                          onPressed: _refreshOrders,
                          child: const Text('Erneut versuchen'),
                        ),
                      ],
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('Keine Bestellungen verfügbar.'));
                }

                final orders = snapshot.data!;

                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final isNew = _newOrderIds.contains(order['id']);

                    return GestureDetector(
                      onTap: () => _markOrderAsInteracted(order['id']),
                      child: Container(
                        color: isNew ? Colors.green.withValues(alpha: .3) : null,
                        child: ListTile(
                          title: Text('Bestellung #${order['id']}'),
                          subtitle: Text('Filiale: ${order['filiale']}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteOrder(order['id']),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: _deleteAllOrders,
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
