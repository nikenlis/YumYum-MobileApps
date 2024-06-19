class Order {
  final String image;
  final String name;
  final String price;
  final int amount;
  final int totalPrice;
  final int active;

  Order({
    required this.image,
    required this.name,
    required this.price,
    required this.amount,
    required this.totalPrice,
    required this.active,
  });
}