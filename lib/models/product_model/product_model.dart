import 'package:yumyum_amicta/models/category_model/category_model.dart';


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
  CategoryModel? categoryModel;

  ProductModel(
      {this.name,
      this.price,
      this.image,
      this.description,
      this.estimate,
      this.active,
      this.encryptedId,
      this.encryptedCategoryId,
      this.encryptedMerchantId,
      this.categoryModel});

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
    categoryModel = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  } //response

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['estimate'] = estimate;
    data['active'] = active;
    data['encrypted_id'] = encryptedId;
    data['encrypted_category_id'] = encryptedCategoryId;
    data['encrypted_merchant_id'] = encryptedMerchantId;
    if (categoryModel != null) {
      data['category'] = categoryModel!.toJson();
    }
    return data;
  } //request
}
