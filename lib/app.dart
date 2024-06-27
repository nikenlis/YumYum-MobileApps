import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/binding/customer_binding.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_category_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_favorite_menu_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_detail_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_success_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_profile_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_sign_in_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_add_menu_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_edit_menu_page.dart';
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
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/customer-profile',
          page: () => const CustomerProfilePage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/',
          page: () => const SplashPage(),
        ),
        GetPage(
          name: '/onboarding',
          page: () => const OnboardingPage(),
        ),
        GetPage(
          name: '/customer-sign-in',
          page: () => const CustomerSignInPage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/customer-bottom-navbar',
          page: () => const CustomerBottomNavBar(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/customer-home',
          page: () => const CustomerHomePage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/customer-merchant-overview',
          page: () => const CustomerMerchantOverviewPage(),
        ),
        GetPage(
          name: '/cutomer-merchant-detail',
          page: () => const CutomerMerchantDetailPage(),
        ),
        GetPage(
          name: '/customer-order',
          page: () => const CustomerOrderPage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/customer-order-success',
          page: () => const CustomerOrderSuccessPage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/customer-favorite',
          page: () => const CustomerFavoriteMenuPage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/customer-catagory',
          page: () => CustomerCategoryPage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/merchant-sign-in',
          page: () => MerchantSignInPage(),
          binding: CustomerBinding(),
        ),
        GetPage(
          name: '/merchant-bottom-navbar',
          page: () => const MerchantBottomNavBar(),
        ),
        GetPage(
          name: '/merchant-add-menu',
          page: () => const MerchantAddMenuPage(),
        ),
        GetPage(
          name: '/merchant-edit-menu',
          page: () => const MerchantEditMenuPage(),
        ),
      ],
    );
  }
}
