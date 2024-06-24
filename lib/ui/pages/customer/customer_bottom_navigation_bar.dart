import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_profile_page.dart';

// Controller for managing the current page index and updating the UI
class CustomerNavController extends GetxController {
  var currentPageIndex = 0.obs;

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}

// StatefulWidget for the bottom navigation bar
class CustomerBottomNavBar extends StatefulWidget {
  // Constructor with a key and initial index for the selected page
  const CustomerBottomNavBar({super.key, this.index = 0});
  final int index;

  @override
  State<CustomerBottomNavBar> createState() => _CustomerBottomNavBarState();
}

// State class for CustomerBottomNavBar, manages navigation and page rendering
class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
  // Instance of the navigation controller using GetX state management
  final CustomerNavController navController = Get.put(CustomerNavController());

  @override
  void initState() {
    // Set the initial page index when the widget initializes
    navController.currentPageIndex.value = widget.index;
    super.initState();
  }

  // List of pages corresponding to each bottom navigation bar item
  final List<Widget> pages = [
    const CustomerHomePage(),
    const CustomerMerchantOverviewPage(),
    const CustomerOrderPage(),
    const CustomerProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with bottom navigation bar and body that changes based on selected index
      bottomNavigationBar: Obx(() => NavigationBar(
            // Custom navigation bar widget
            onDestinationSelected: (int index) {
              navController.setPageIndex(index);
            },
            height: 80,
            elevation: 0,
            indicatorColor: lightGreyColor,
            selectedIndex: navController.currentPageIndex.value,
            destinations: [
              // Navigation destinations for each tab
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
      // Body of the scaffold, shows the page corresponding to the selected index
      body: Obx(() => pages[navController.currentPageIndex.value]),
    );
  }
}
