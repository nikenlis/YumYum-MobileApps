import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/category_model/home_category_model.dart';
import 'package:yumyum_amicta/services/category_services.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class HomeCategoryController extends GetxController {
  var categories = List<HomeCategoryModel>.empty().obs;

  var loading = false.obs;
  late CategoryServices _categoryServices;

  @override
  void onInit() {
    _categoryServices = Get.put(CategoryServices());
    super.onInit();
    getListMerchantAndProducts();
  }

  void getListMerchantAndProducts() async {
    loading(true);
    try {
      HomeCategoryResponseModel? response =
          await _categoryServices.fetchHomeCategoryItem();

      if (response != null) {
        categories.assignAll(response.data!);
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