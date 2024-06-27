import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';

class OnBoardCheck extends StatelessWidget {
  const OnBoardCheck({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
    return Obx(() {
       print('BISAAA NGGGA NIHHHHHHH: ${_authManager.isLogged.value}');
      return _authManager.isLogged.value ? CustomerBottomNavBar() : CustomerSignInPage();
    });
  }
}
