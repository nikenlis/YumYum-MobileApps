import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/recomendation_model/recomendation_model.dart';
import 'package:yumyum_amicta/services/recomendation_services.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class HomeRecomendationController extends GetxController {
  var product = List<RecomendationProductModel>.empty().obs;

  var loading = false.obs;
  late RecomendationServices _recomendationServices;

  @override
  void onInit() {
    _recomendationServices = Get.put(RecomendationServices());
    super.onInit();
    getListProductRecomendation();
  }

  void getListProductRecomendation() async {
    loading(true);
    try {
      RecomendationResponseModel? response =
          await _recomendationServices.fetchHomeProductRecomendation();

      if (response != null) {
        product.assignAll(response.data!);
        //print(product[1].merchant.encryptedId!);
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