class SuperMerchantRequestModel {
  int? limitProduct;
  String? search;
  bool? hideCategory;
  bool? hideInacticveProduct;

  SuperMerchantRequestModel (
      {this.limitProduct,
      this.search,
      this.hideCategory,
      this.hideInacticveProduct});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit_product'] = limitProduct;
    data['search'] = search;
    data['hide_category'] = hideCategory;
    data['hide_inacticve_product'] = hideInacticveProduct;
    return data;
  }
}