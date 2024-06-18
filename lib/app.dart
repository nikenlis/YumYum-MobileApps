import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_success_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/onboarding_page.dart';
import 'package:yumyum_amicta/ui/pages/splash_page.dart';

class App extends StatelessWidget {
  
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

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
      darkTheme: ThemeData(
        scaffoldBackgroundColor: darkBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: darkBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(),
          titleTextStyle: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(name: '/onboarding', page: () => const OnboardingPage()),
        GetPage(name: '/customer-sign-in', page: () => CustomerSignInPage()),
        GetPage(
            name: '/customer-bottom-navbar',
            page: () => CustomerBottomNavBar()),
        GetPage(name: '/customer-home', page: () => const CustomerHomePage()),
        GetPage(
            name: '/customer-merchant-overview',
            page: () => const CustomerMerchantOverviewPage()),
        GetPage(name: '/customer-order', page: () => const CustomerOrderPage()),
        GetPage(
            name: '/customer-order-success',
            page: () => CustomerOrderSuccessPage()),
        GetPage(
            name: '/merchant-sign-in', page: () => const MerchantSignInPage()),
      ],
    );
  }
}
