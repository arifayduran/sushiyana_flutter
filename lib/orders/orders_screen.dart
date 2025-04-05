import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/services/order_service.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/domain/order_item.dart';
import 'package:sushiyana_flutter/orders/orders_service.dart';
import 'package:sushiyana_flutter/orders/login_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Set<int> _newOrderIds = {};
  bool _firstLoad = true;
  final Set<int> _soundPlayedOrderIds = {};
  Timer? _refreshTimer;
  late final OrderService orderService;

  @override
  void initState() {
    super.initState();
    orderService = OrderService();
    _ordersFuture =
        _initializeSeenOrders().then((_) => _fetchAndHighlightOrders());

    _refreshTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _refreshOrders();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeSeenOrders() async {
    final seenOrders = await _secureStorage.read(key: 'seenOrders');
    if (seenOrders != null) {
      _newOrderIds =
          (json.decode(seenOrders) as List<dynamic>).cast<int>().toSet();
    }
  }

  Future<void> _updateSeenOrders() async {
    await _secureStorage.write(
        key: 'seenOrders', value: json.encode(_newOrderIds.toList()));
  }

  void _playNotificationSound() {
    if (kIsWeb) {
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
    final fetchedOrderIds = orders.map((order) => order['id'] as int).toSet();

    if (_firstLoad) {
      _soundPlayedOrderIds.addAll(fetchedOrderIds);
      _firstLoad = false;
    } else {
      final newSoundOrders = fetchedOrderIds.difference(_soundPlayedOrderIds);
      if (newSoundOrders.isNotEmpty) {
        _playNotificationSound();
        _soundPlayedOrderIds.addAll(newSoundOrders);
      }
    }
    final storedSeenOrderIds = await _secureStorage.read(key: 'seenOrders');
    final seenOrderIds = storedSeenOrderIds != null
        ? (json.decode(storedSeenOrderIds) as List<dynamic>).cast<int>().toSet()
        : _newOrderIds;
    setState(() {
      _newOrderIds = seenOrderIds;
    });

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

  void _markOrderAsSeen(int orderId) async {
    setState(() {
      _newOrderIds.add(orderId);
    });
    await _updateSeenOrders();
  }

  void _markOrderAsUnseen(int orderId) async {
    setState(() {
      _newOrderIds.remove(orderId);
    });
    await _updateSeenOrders();
  }

  void debugOrder() async {
    await orderService.sendOrder(
      branchName: "neukoelln",
      customerName: "Testkunde",
      items: [
        OrderItem(
          name: "Sushi",
          price: 5.99,
          note: "Extra Soja",
          quantity: 1,
        ),
      ],
      totalPrice: 5.99,
      notes: "notes",
    );
  }

  void _logout() {
    final loginState = Provider.of<LoginState>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Abmelden'),
        content: const Text('Möchten Sie sich wirklich abmelden?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              loginState.logout();
            },
            child: const Text('Abmelden'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 220, 220, 220),
        title: Text(
          loginState.username == "admin"
              ? "🔑   Admin-Modus – Zentrale Übersicht"
              : "📍   Eingeloggt als: ${loginState.username}",
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _logout,
              tooltip: "Abmelden",
              color: yanaColor,
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: FutureBuilder<List<dynamic>>(
                  future: _ordersFuture,
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return const Center(child: CircularProgressIndicator());
                    // } else
                    if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Fehler beim Laden der Bestellungen:'),
                          SizedBox(
                            height: 30,
                          ),
                          Text(snapshot.error.toString(),
                              style: const TextStyle(color: Colors.red)),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _refreshOrders,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yanaColor,
                            ),
                            child: const Text('Erneut versuchen',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('Keine Bestellungen verfügbar.');
                    }

                    final orders = snapshot.data!
                      ..sort(
                          (a, b) => (a['id'] as int).compareTo(b['id'] as int));

                    return IntrinsicWidth(
                      child: DataTable(
                        showCheckboxColumn: false,
                        columnSpacing: 20,
                        border: TableBorder.all(color: Colors.grey, width: 0.1),
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Filiale')),
                          DataColumn(label: Text('Tisch')),
                          DataColumn(label: Text('Artikel')),
                          DataColumn(label: Text('Preis (€)')),
                          DataColumn(label: Text('Notizen')),
                          DataColumn(label: Text('Datum/Uhrzeit')),
                          DataColumn(label: Text('Löschen')),
                        ],
                        rows: orders.map((order) {
                          final createdAt =
                              DateTime.tryParse(order['created_at'] as String);
                          final isOlderThanOneHour = createdAt != null &&
                              DateTime.now().difference(createdAt) >
                                  const Duration(hours: 1);
                          final isNewOrder =
                              !(_newOrderIds.contains(order['id'] as int));
                          final rowColor = isOlderThanOneHour
                              ? Colors.red.withValues(alpha: .3)
                              : (isNewOrder
                                  ? Colors.green.withValues(alpha: .3)
                                  : Colors.white);

                          final itemsList =
                              (order['items'] as List<dynamic>).map((item) {
                            final name = item['name'] ?? 'Unbekannt';
                            final quantity = item['quantity'] ?? 1;
                            final price =
                                (item['price'] as num?)?.toStringAsFixed(2) ??
                                    '0.00';
                            final note = item['note'] != null
                                ? ' -- (Notiz: ${item['note']})'
                                : '';
                            return '$quantity x $name – $price €$note';
                          }).join('\n');

                          return DataRow(
                            selected: _newOrderIds.contains(order['id'] as int),
                            onSelectChanged: (value) {
                              if (value == true) {
                                _markOrderAsSeen(order['id'] as int);
                              } else {
                                _markOrderAsUnseen(order['id'] as int);
                              }
                            },
                            color: WidgetStateProperty.all(rowColor),
                            cells: [
                              DataCell(
                                  Center(child: Text(order['id'].toString()))),
                              DataCell(Center(
                                  child:
                                      Text(order['filiale'] ?? 'Unbekannt'))),
                              DataCell(Center(
                                  child: Text(
                                      order['customer_name'] ?? 'Unbekannt'))),
                              DataCell(Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(itemsList, softWrap: true))),
                              DataCell(Center(
                                  child: Text(order['total_price'] ?? '0.00'))),
                              DataCell(
                                  Center(child: Text(order['notes'] ?? ''))),
                              DataCell(Center(
                                  child: Text(
                                      order['created_at'] ?? 'Unbekannt'))),
                              DataCell(
                                Center(
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    tooltip: "Bestellung löschen",
                                    color: const Color.fromARGB(
                                        255, 251, 107, 107),
                                    iconSize: 18,
                                    onPressed: () =>
                                        _deleteOrder(order['id'] as int),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 90,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _refreshOrders,
                    tooltip: "Bestellungen aktualisieren",
                    color: yanaColor,
                    iconSize: 30,
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: _deleteAllOrders,
                    icon: const Icon(Icons.delete_forever),
                    tooltip: "Alle Bestellungen löschen (!)",
                    color: yanaColor,
                    iconSize: 30,
                  ),
                  ElevatedButton(
                      onPressed: debugOrder, child: Text("order debug")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
