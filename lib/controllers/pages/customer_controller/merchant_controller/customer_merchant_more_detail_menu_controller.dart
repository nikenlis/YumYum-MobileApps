import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/cart_controller/cart_controller.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/merchant_controller/merchant_detail_controller.dart';
import 'package:yumyum_amicta/models/product_model/product_model.dart';

class CustomerMerchantMoreDetailMenuController extends GetxController {
  var isActive = true.obs;
  var isFavorite = false.obs;
  MerchantDetailController merchantDetailController = Get.find();
  CartController cartController = Get.find();
  var products = List<ProductModel>.empty().obs;

  @override
  void onInit() {
    products.assignAll(merchantDetailController.products);
    super.onInit();
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void setActive(bool value) {
    isActive.value = value;
  }
}
