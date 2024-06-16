class Product {
  final int id;
  final int categoryId;
  final int merchantId;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  final String estimate;
  bool isActive;


  Product({
    required this.id,
    required this.categoryId,
    required this.merchantId,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.estimate,
    this.isActive = true,
  });
}
