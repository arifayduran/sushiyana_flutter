import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/domain/item.dart';

class CartItem {
  final String id;
  int quantity;

  CartItem({required this.id, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final Map<String, Map<String, CartItem>> _branchCarts = {};
  late String _currentBranch;

  void setBranch(String branch) {
    _currentBranch = branch;
    if (!_branchCarts.containsKey(branch)) {
      _branchCarts[branch] = {};
    }

    notifyListeners();
  }

  Map<String, CartItem> get items => _branchCarts[_currentBranch] ?? {};

  int get cartLength =>
      items.values.fold(0, (sum, cartItem) => sum + cartItem.quantity);

  void addItem(String id) {
    if (!items.containsKey(id)) {
      items[id] = CartItem(id: id);
    } else {
      items[id]!.quantity++;
    }
    saveCartToStorage();
    notifyListeners();
  }

  void removeItem(String id) {
    if (items.containsKey(id)) {
      items[id]!.quantity--;
      if (items[id]!.quantity <= 0) {
        items.remove(id);
      }
      saveCartToStorage();
      notifyListeners();
    }
  }

  Future<void> saveCartToStorage() async {
    final cartData = _branchCarts.map((branch, cart) => MapEntry(
        branch,
        cart.map((key, value) => MapEntry(key, {
              'id': value.id,
              'quantity': value.quantity,
            }))));
    await _storage.write(key: 'branchCarts', value: jsonEncode(cartData));
  }

  Future<void> loadCartFromStorage() async {
    final cartString = await _storage.read(key: 'branchCarts');
    if (cartString != null) {
      final Map<String, dynamic> cartData = jsonDecode(cartString);
      _branchCarts.clear();
      cartData.forEach((branch, cart) {
        _branchCarts[branch] =
            (cart as Map<String, dynamic>).map((key, value) => MapEntry(
                key,
                CartItem(
                  id: value['id'],
                  quantity: value['quantity'],
                )));
      });
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> getMatchedCartItemsWithQuantity() {
    List<Map<String, dynamic>> matchedItemsWithQuantity = [];

    void searchAndMatchItems(
        List<Item> items, Map<String, CartItem> cartItems) {
      for (var item in items) {
        if (cartItems.containsKey(item.id)) {
          matchedItemsWithQuantity.add({
            'item': item,
            'quantity': cartItems[item.id]!.quantity,
          });
        }
      }
    }

    Map<String, CartItem> cartItems = items;

    localDatabase["Sushis"]["categories"].forEach((_, category) {
      List<Item> items = List<Item>.from(category["items"]);
      searchAndMatchItems(items, cartItems);
    });

    localDatabase["Warme Küche"]["categories"].forEach((_, category) {
      List<Item> items = List<Item>.from(category["items"]);
      searchAndMatchItems(items, cartItems);
    });

    localDatabase.forEach((key, value) {
      if (key != "Sushis" &&
          key != "Warme Küche" &&
          value.containsKey("items")) {
        List<Item> items = List<Item>.from(value["items"]);
        searchAndMatchItems(items, cartItems);
      }
    });

    return matchedItemsWithQuantity;
  }
}
