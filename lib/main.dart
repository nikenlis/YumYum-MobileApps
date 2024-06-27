import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/app.dart';
import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/widgets/customer/home_rekomendation_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationManager());
  Get.put(CustomerNavController());
  Get.put(HomeRecomendationItemController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
