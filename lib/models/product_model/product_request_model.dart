class ProductRequestModel {
  String? id;
  int? limitProduct;
  bool? hideCategory;
  bool? hideInacticveProduct;

  ProductRequestModel(
      {this.id,
      this.limitProduct,
      this.hideCategory,
      this.hideInacticveProduct});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['limit_product'] = limitProduct;
    data['hide_category'] = hideCategory;
    data['hide_inacticve_product'] = hideInacticveProduct;
    return data;
  }
}
