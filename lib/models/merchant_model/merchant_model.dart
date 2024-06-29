import 'package:yumyum_amicta/models/product_model/product_model.dart';

class MerchantModel {
  String? username;
  String? name;
  String? photo;
  String? description;
  int? isOpen;
  String? encryptedId;
  List<ProductModel>? productModel;

  MerchantModel(
      {this.username,
      this.name,
      this.photo,
      this.description,
      this.isOpen,
      this.encryptedId,
      this.productModel});

  MerchantModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    isOpen = json['is_open'];
    encryptedId = json['encrypted_id'];
    if (json['product'] != null) {
      productModel = <ProductModel>[];
      json['product'].forEach((v) {
        productModel!.add(ProductModel.fromJson(v));
      });
    }
  } //response

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['is_open'] = isOpen;
    data['encrypted_id'] = encryptedId;
    if (productModel != null) {
      data['product'] = productModel!.map((v) => v.toJson()).toList();
    }
    return data;
  } //request
}