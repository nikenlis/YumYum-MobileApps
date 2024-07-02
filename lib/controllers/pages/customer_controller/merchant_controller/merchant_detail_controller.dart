import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/product_model/merchant_data_model.dart';
import 'package:yumyum_amicta/models/product_model/product_model.dart';
import 'package:yumyum_amicta/models/product_model/product_request_model.dart';
import 'package:yumyum_amicta/services/customer_merchant_service.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class MerchantDetailController extends GetxController {
  var products = List<ProductModel>.empty().obs;
  var merchantData = MerchantDataModel().obs;
  var loading = false.obs;
  late String merchantId;
  late CustomerMerchantService _customerMerchant;

  MerchantDetailController(this.merchantId);

  @override
  void onInit() {
    _customerMerchant = Get.put(CustomerMerchantService());
    getListMerchantAndProducts();
    super.onInit();
  }

  void getListMerchantAndProducts() async {
    loading(true);
    try {
      ProductRequestModel requestModel = ProductRequestModel(
          id: merchantId,
          limitProduct: -1,
          hideCategory: true,
          hideInacticveProduct: false);

      MerchantDataModel? response =
          await _customerMerchant.fetchProducts(requestModel);

      if (response != null) {
        merchantData.value = response;
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