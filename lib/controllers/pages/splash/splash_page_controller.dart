
import 'package:get/get.dart';
import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';

class SplashPageController extends GetxController {
  late AuthenticationManager _authManager;
  @override
  void onInit() {
    _authManager = Get.find<AuthenticationManager>();
    _authManager.checkLoginStatus();
    super.onInit();
  }

    @override
  void onReady() async {
    super.onReady();
    if (_authManager.isLogged.value) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed('/customer-bottom-navbar');
      });
    } else {
     Get.offAllNamed('/customer-sign-in');
    }
  }

  
}