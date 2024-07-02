import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/category_model/category_detail_model.dart';
import 'package:yumyum_amicta/services/category_services.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CategoryDetailController extends GetxController {
  var products = List<CategoryProductModel>.empty().obs;
  var category = CategoryModel().obs;
  var loading = false.obs;
  late String categoryId;
  late CategoryServices _categoryServices;

  CategoryDetailController(this.categoryId);

  @override
  void onInit() {
    _categoryServices = Get.put(CategoryServices());
    getListMerchantAndProducts();
    super.onInit();
  }

  void getListMerchantAndProducts() async {
    loading(true);
    try {
      CategoryDetailRequestModel requestModel = CategoryDetailRequestModel(
          id: categoryId,
          limitProduct: -1,
          hideMerchant: true,
          hideInacticveProduct: false);

      CategoryModel? response = await _categoryServices.fetchCategoryDetail(requestModel);

      if (response != null) {
        category.value = response;
        products.assignAll(response.product!);
      } else {
        Text(
          'Data kosong',
          style: blackTextStyle.copyWith(fontSize: 50),
        );
      }
    } finally {
      loading(false);
    }
  }
}