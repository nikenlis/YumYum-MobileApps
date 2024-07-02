class MerchantRequestModel {
  String? search;
  bool? hideCategory;
  bool? hideInacticveProduct;

  MerchantRequestModel (
      {
      this.search,
      this.hideCategory,
      this.hideInacticveProduct});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['search'] = search;
    data['hide_category'] = hideCategory;
    data['hide_inacticve_product'] = hideInacticveProduct;
    return data;
  }
}