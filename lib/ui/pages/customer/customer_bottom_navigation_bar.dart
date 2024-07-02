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
  _CustomerBottomNavBarState createState() => _CustomerBottomNavBarState();
}

class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
  final CustomerNavController navController = Get.put(CustomerNavController());

  @override
  void initState() {
    navController.currentPageIndex.value = widget.index;
    super.initState();
  }

  final List<Widget> pages = [
    CustomerHomePage(),
    const CustomerMerchantOverviewPage(),
    const CustomerOrderPage(),
    CustomerProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: (index) {
              navController.setPageIndex(index);
            },
            currentIndex: navController.currentPageIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop_outlined),
                label: 'Merchant',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            selectedItemColor: purpleColor,
            unselectedItemColor: Colors.black,
          )),
      body: Obx(() => pages[navController.currentPageIndex.value]),
    );
  }
}
