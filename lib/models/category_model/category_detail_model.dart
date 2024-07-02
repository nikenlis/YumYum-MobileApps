class CategoryDetailRequestModel {
  String? id;
  int? limitProduct;
  bool? hideMerchant;
  bool? hideInacticveProduct;

  CategoryDetailRequestModel(
      {this.id,
      this.limitProduct,
      this.hideMerchant,
      this.hideInacticveProduct});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['limit_product'] = limitProduct;
    data['hide_merchant'] = hideMerchant;
    data['hide_inacticve_product'] = hideInacticveProduct;
    return data;
  }
}



class CategoryModel {
  String? name;
  String? image;
  String? description;
  String? encryptedId;
  List<CategoryProductModel>? product;

  CategoryModel(
      {this.name,
      this.image,
      this.description,
      this.encryptedId,
      this.product});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    encryptedId = json['encrypted_id'];
    if (json['product'] != null) {
      product = <CategoryProductModel>[];
      json['product'].forEach((v) {
        product!.add(CategoryProductModel.fromJson(v));
      });
    }
  }

}

class CategoryProductModel {
  String? name;
  String? image;
  String? description;
  String? price;
  String? estimate;
  int? active;
  String? encryptedId;
  String? encryptedCategoryId;
  String? encryptedMerchantId;

  CategoryProductModel(
      {this.name,
      this.image,
      this.description,
      this.price,
      this.estimate,
      this.active,
      this.encryptedId,
      this.encryptedCategoryId,
      this.encryptedMerchantId});

  CategoryProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    estimate = json['estimate'];
    active = json['active'];
    encryptedId = json['encrypted_id'];
    encryptedCategoryId = json['encrypted_category_id'];
    encryptedMerchantId = json['encrypted_merchant_id'];
  }
}
