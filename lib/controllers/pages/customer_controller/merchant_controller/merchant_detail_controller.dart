import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/cart_controller/cart_controller.dart';
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
  late CartController _cart;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

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
        products.clear();
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
    update();
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("INCREAMENT " + _quantity.toString());
      print("CHARTITEMS " + _inCartItems.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
       print("DECREAMENT " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Jumlah pesanan', 'Tidak bisa dikurangi lagi!',
          backgroundColor: purpleColor, colorText: whiteColor);
      return 0;
    } else if ((_inCartItems + quantity) > 10) {
      Get.snackbar('Jumlah pesanan', 'Tidak bisa ditambah lagi!',
          backgroundColor: purpleColor, colorText: whiteColor);
      return 10 - _inCartItems;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
     //print("the id is " + product.encryptedId! + "quantity in the cart is $_inCartItems");
  }

  void addItem(ProductModel product) {
  // Log the current state before adding the item
  print("Before adding: _quantity=$_quantity, _inCartItems=$_inCartItems");
  _cart.addItem(product, _quantity);

  // _quantity =0;
  _inCartItems = _cart.getQuantity(product);


  // Log the current state after adding the item
  print("After adding: _quantity=$_quantity, _inCartItems=$_inCartItems");

  _cart.items.forEach((key, value) {
    print("The id is " +
        value.encryptedId! +
        "the quantity is " +
        value.quantity.toString());
      });
      
  }

  int totalItems(CartController cart){
    return cart.totalItems;
  }
}
