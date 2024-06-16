import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_detail_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/onboarding_page.dart';
import 'package:yumyum_amicta/ui/pages/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
              //color: blackColor,
              ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      routes: {
        '/' : (context) => const SplashPage(),
        '/onboarding' :(context) => const OnboardingPage(),
        '/customer-sign-in' :(context) => CustomerSignInPage(),
        '/customer-bottom-navbar' :(context) => CustomerBottomNavBar(),
        '/customer-home' :(context) => const CustomerHomePage(),
        '/cutomer-merchant-overview':(context) => const CustomerMerchantOverviewPage(),
        '/cutomer-merchant-detail':(context) => const CutomerMerchantDetailPage(),
        '/customer-order' :(context) => const CustomerOrderPage(),
        '/merchant-sign-in' :(context) => const MerchantSignInPage(),
      },
    );
  }
}
