import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/orders/orders_service.dart';
import 'package:sushiyana_flutter/orders/login_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

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

    _refreshTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _refreshOrders();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _playNotificationSound() {
    if (kIsWeb) {
      // Use the HTML AudioElement for web compatibility
      final audio =
          html.AudioElement('assets/sounds/sushi_yana_japanese_ping_long.mp3');
      audio.play();
    } else {
      _audioPlayer
          .play(AssetSource('assets/sounds/sushi_yana_japanese_ping_long.mp3'));
    }
  }

  Future<List<dynamic>> _fetchAndHighlightOrders() async {
    final orders = await _ordersService.fetchOrders();
    final newOrderIds = orders.map((order) => order['id']).toSet();

    if (_newOrderIds.isEmpty) {
      _newOrderIds = newOrderIds.cast<int>();
    } else {
      final newOrders = newOrderIds.difference(_newOrderIds);
      if (newOrders.isNotEmpty) {
        _playNotificationSound();
        setState(() {
          _newOrderIds = newOrderIds.cast<int>();
        });
      }
    }

    // Parse the 'items' field in each order to ensure it is a List
    for (var order in orders) {
      if (order['items'] is String) {
        order['items'] = json.decode(order['items']);
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

    return Scaffold(
      appBar: AppBar(
        title: Text(loginState.username == "admin"
            ? "🔑 Admin-Modus – Zentrale Übersicht"
            : "📍 Eingeloggt als: ${loginState.username}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshOrders,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: loginState.logout,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // } else
          if (snapshot.hasError) {
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
            return const Center(child: Text('Keine Bestellungen verfügbar.'));
          }

          final orders = snapshot.data!
            ..sort((a, b) => (a['id'] as int).compareTo(b['id'] as int));

          return IntrinsicWidth(
            child: DataTable(
              columnSpacing: 20.0,
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Filiale')),
                DataColumn(label: Text('Tisch')),
                DataColumn(label: Text('Artikel')),
                DataColumn(label: Text('Preis (€)')),
                DataColumn(label: Text('Notizen')),
                DataColumn(label: Text('Datum/Uhrzeit')),
                DataColumn(label: Text('Aktion')),
              ],
              rows: orders.map((order) {
                final itemsList = (order['items'] as List<dynamic>).map((item) {
                  final name = item['name'] ?? 'Unbekannt';
                  final quantity = item['quantity'] ?? 1;
                  final price =
                      (item['price'] as num?)?.toStringAsFixed(2) ?? '0.00';
                  final note = item['note'] != null
                      ? ' -- (Notiz: ${item['note']})'
                      : '';
                  return '$quantity x $name – $price €$note';
                }).join('\n');

                final isNewOrder = _newOrderIds.contains(order['id']);

                return DataRow(
                  color: isNewOrder
                      ? WidgetStateProperty.all(
                          Colors.yellow.withOpacity(0.3))
                      : null,
                  cells: [
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          _markOrderAsInteracted(order['id']);
                        },
                        child: Text(order['id'].toString()),
                      ),
                    ),
                    DataCell(Text(order['filiale'] ?? 'Unbekannt')),
                    DataCell(Text(order['customer_name'] ?? 'Unbekannt')),
                    DataCell(Text(itemsList, softWrap: true)),
                    DataCell(Text(order['total_price'] ?? '0.00')),
                    DataCell(Text(order['notes'] ?? '')),
                    DataCell(Text(order['created_at'] ?? 'Unbekannt')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteOrder(order['id']),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _deleteAllOrders,
        child: const Icon(Icons.delete_forever),
      ),
    );
  }
}
