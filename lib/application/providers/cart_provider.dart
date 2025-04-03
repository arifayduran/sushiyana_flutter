import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sushiyana_flutter/application/parse_price_to_double.dart';
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
  final Map<String, String> _notes = {};

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

  void removeSingleItem(String id) {
    if (items.containsKey(id)) {
      items[id]!.quantity--;
      if (items[id]!.quantity <= 0) {
        items.remove(id);
      }
      saveCartToStorage();
      notifyListeners();
    }
  }

  void removeItemQuantity(String id) {
    if (items.containsKey(id)) {
      items.remove(id);
      saveCartToStorage();
      notifyListeners();
    }
  }

  void clearCart() {
    _branchCarts[_currentBranch] = {};
    saveCartToStorage();
    notifyListeners();
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
          if (item.bestellbar) {
            matchedItemsWithQuantity.add({
              'item': item,
              'quantity': cartItems[item.id]!.quantity,
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cartItems.remove(item.id);
              notifyListeners();
            });
          }
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

    matchedItemsWithQuantity.sort((a, b) {
      double parsePrice(String price) {
        return double.parse(price.replaceAll(',', '.').split(' ')[0]);
      }

      double priceA = parsePrice(a['item'].preis);
      double priceB = parsePrice(b['item'].preis);
      return priceB.compareTo(priceA);
    });

    return matchedItemsWithQuantity;
  }

  String getNoteForItem(String id) {
    return _notes[id] ?? '';
  }

  void setNoteForItem(String id, String note) {
    _notes[id] = note;
    saveNotesToStorage();
    notifyListeners();
  }

  Future<void> saveNotesToStorage() async {
    await _storage.write(key: 'itemNotes', value: jsonEncode(_notes));
  }

  Future<void> loadNotesFromStorage() async {
    final notesString = await _storage.read(key: 'itemNotes');
    if (notesString != null) {
      final Map<String, dynamic> notesData = jsonDecode(notesString);
      _notes.clear();
      notesData.forEach((key, value) {
        _notes[key] = value;
      });
      notifyListeners();
    }
  }

  int getAmountForItem(String id) {
    return items[id]?.quantity ?? 0;
  }

  double getTotalPriceForItem(String id, String pricePerUnit) {
    double? pricePerUnitParsed = parsePriceToDouble(pricePerUnit);
    return (items[id]?.quantity ?? 0) * pricePerUnitParsed!;
  }
}
