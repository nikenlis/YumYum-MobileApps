import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_profile_page.dart';

class CustomerNavController extends GetxController {
  var currentPageIndex = 0.obs;

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}

class CustomerBottomNavBar extends StatefulWidget {
  const CustomerBottomNavBar({super.key, this.index = 0});
  final int index;

  @override
  State<CustomerBottomNavBar> createState() => _CustomerBottomNavBarState();
}

class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
  final CustomerNavController navController = Get.find<CustomerNavController>();

  @override
  void initState() {
    navController.currentPageIndex.value = widget.index;
    super.initState();
  }

  final List<Widget> pages = [
    const CustomerHomePage(),
    const CustomerMerchantOverviewPage(),
    const CustomerOrderPage(),
    const CustomerProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            onDestinationSelected: (int index) {
              navController.setPageIndex(index);
            },
            height: 80,
            elevation: 0,
            indicatorColor: lightGreyColor,
            selectedIndex: navController.currentPageIndex.value,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                label: 'Home',
                selectedIcon: Icon(Icons.home_outlined, color: purpleColor),
              ),
              NavigationDestination(
                icon: const Icon(Icons.shop_outlined),
                label: 'Merchant',
                selectedIcon: Icon(Icons.shop_outlined, color: purpleColor),
              ),
              NavigationDestination(
                icon: const Icon(Icons.list_outlined),
                label: 'Order',
                selectedIcon: Icon(Icons.list_outlined, color: purpleColor),
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                label: 'Profile',
                selectedIcon: Icon(Icons.person_outline, color: purpleColor),
              ),
            ],
          )),
      body: Obx(() => pages[navController.currentPageIndex.value]),
    );
  }
}
