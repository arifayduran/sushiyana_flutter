class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
      };
}
