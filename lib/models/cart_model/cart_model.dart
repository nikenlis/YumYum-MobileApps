// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  String? encryptedId;
  String? encryptedMerchantId;
  String? name;
  String? price;
  String? image;
  int? quantity;
  bool? isExist;



  CartModel({
    this.encryptedId,
    this.encryptedMerchantId,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.isExist,


  });

  CartModel.fromJson(Map<String, dynamic> json) {
    encryptedId = json['encrypted_id'];
    encryptedMerchantId = json['encrypted_merchant_id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    isExist = json['isExist'];

  } //response

}
