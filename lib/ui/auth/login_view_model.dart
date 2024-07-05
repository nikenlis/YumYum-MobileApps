import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';
import 'package:yumyum_amicta/ui/auth/models/login_request_model.dart';
import 'package:yumyum_amicta/ui/auth/services/login_service.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String username, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(asMerchant: false, username: username, password: password, deviceId: 'INIVALUEDEVICEID'));

    if (response != null) {
      print('Login successful, token: ${response.token}');
      _authManager.login(response.token);
      Get.offAllNamed('/customer-bottom-navbar');
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
