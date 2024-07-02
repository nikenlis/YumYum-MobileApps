class ProductModel {
  String? name;
  String? price;
  String? image;
  String? description;
  String? estimate;
  int? active;
  String? encryptedId;
  String? encryptedCategoryId;
  String? encryptedMerchantId;

  ProductModel(
      {this.name,
      this.price,
      this.image,
      this.description,
      this.estimate,
      this.active,
      this.encryptedId,
      this.encryptedCategoryId,
      this.encryptedMerchantId,});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    estimate = json['estimate'];
    active = json['active'];
    encryptedId = json['encrypted_id'];
    encryptedCategoryId = json['encrypted_category_id'];
    encryptedMerchantId = json['encrypted_merchant_id'];
  } //response

}
