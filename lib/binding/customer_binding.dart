import 'package:get/get.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_category_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_favorite_menu_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_detail_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_success_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_profile_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerNavController>(() => CustomerNavController());
    Get.lazyPut<CustomerCategoryController>(() => CustomerCategoryController());
    Get.lazyPut<CustomerFavoriteMenuController>(
        () => CustomerFavoriteMenuController());
    Get.lazyPut<CustomerHomeController>(() => CustomerHomeController());
    Get.lazyPut<MerchantDetailController>(() => MerchantDetailController());
    Get.lazyPut<MerchantOverviewController>(() => MerchantOverviewController());
    Get.lazyPut<CustomerOrderController>(() => CustomerOrderController());
    Get.lazyPut<CustomerOrderSuccessController>(
        () => CustomerOrderSuccessController());
    Get.lazyPut<CustomerProfileController>(() => CustomerProfileController());
    Get.lazyPut<CustomerSignInController>(() => CustomerSignInController());
  }
}
