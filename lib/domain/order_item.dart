class OrderItem {
  final String name;
  final int quantity;
  final double price;
  final String? note;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.note,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'note': note,
      };

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json['name'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
      note: json['note'] ?? "",
    );
  }
}
