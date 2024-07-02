import 'package:yumyum_amicta/models/product_model/product_model.dart';
class MerchantDataModel {
  String? username;
  String? name;
  String? photo;
  String? description;
  int? isOpen;
  String? deviceId;
  String? encryptedId;
  List<ProductModel>? product;

  MerchantDataModel(
      {this.username,
      this.name,
      this.photo,
      this.description,
      this.isOpen,
      this.deviceId,
      this.encryptedId,
      this.product});

MerchantDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    isOpen = json['is_open'];
    deviceId = json['device_id'];
    encryptedId = json['encrypted_id'];
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(ProductModel.fromJson(v));
      });
    }
  }
}