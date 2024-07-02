import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_model.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_request_model.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_response_model.dart';
import 'package:yumyum_amicta/services/customer_merchant_service.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class MerchantOverviewController extends GetxController {
  var merchants = List<MerchantModel>.empty().obs;

  var loading = false.obs;
  late CustomerMerchantService _customerMerchant;

  @override
  void onInit() {
    _customerMerchant = Get.put(CustomerMerchantService());
    super.onInit();
    getListMerchantAndProducts();
  }

  void getListMerchantAndProducts() async {
    loading(true);
    try {
      MerchantRequestModel requestModel = MerchantRequestModel(
        search: "",
        hideCategory: true,
        hideInacticveProduct: true,
      );

      MerchantResponseModel? response =
          await _customerMerchant.fetchMerchants(requestModel);

      if (response != null) {
        merchants.assignAll(response.merchantModel!);
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