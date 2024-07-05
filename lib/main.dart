import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yumyum_amicta/app.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/cart_controller/cart_controller.dart';
import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';
import 'package:yumyum_amicta/ui/widgets/customer/home_category_item.dart';
import 'package:yumyum_amicta/ui/widgets/form.dart';
import 'ui/widgets/customer/home_rekomendation_item.dart';

void main() async {
   await GetStorage.init();
  Get.put(HomeRecomendationItemController());
  Get.put(HomeCategoryItemController());
  Get.put(CartController());
  Get.put(FormFieldController());
  Get.put(AuthenticationManager());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
