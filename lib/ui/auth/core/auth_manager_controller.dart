import 'package:yumyum_amicta/ui/auth/core/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    print('Login AuthenticationManager token: ${token}');
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    print('check AuthenticationManager token: ${token}');
    if (token != null) {
      isLogged.value = true;
    }
  }
}