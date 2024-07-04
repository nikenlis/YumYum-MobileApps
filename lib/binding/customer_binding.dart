import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/home_controller/home_controller.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/merchant_controller/merchant_overview_controller.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_favorite_menu_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_success_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_profile_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerNavController>(() => CustomerNavController());
    Get.lazyPut<CustomerFavoriteMenuController>(
        () => CustomerFavoriteMenuController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MerchantOverviewController>(() => MerchantOverviewController());
    Get.lazyPut<CustomerOrderController>(() => CustomerOrderController());
    Get.lazyPut<CustomerOrderSuccessController>(
        () => CustomerOrderSuccessController());
    Get.lazyPut<CustomerProfileController>(() => CustomerProfileController());
    //Get.lazyPut<CustomerSignInController>(() => CustomerSignInController());
  }
}
