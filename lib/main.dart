import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/onboarding_page.dart';
import 'package:yumyum_amicta/ui/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const App());
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/onboarding', page: () => OnboardingPage()),
        GetPage(name: '/customer-sign-in', page: () => CustomerSignInPage()),
        GetPage(
            name: '/customer-bottom-navbar',
            page: () => CustomerBottomNavBar()),
        GetPage(name: '/customer-home', page: () => const CustomerHomePage()),
        GetPage(
            name: '/merchant-sign-in', page: () => const MerchantSignInPage()),
      ],
    );
  }
}
