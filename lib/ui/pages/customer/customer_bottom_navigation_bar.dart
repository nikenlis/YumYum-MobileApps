import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_home_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_order_page.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_profile_page.dart';

class CustomerBottomNavBar extends StatefulWidget {
  const CustomerBottomNavBar({super.key, this.index = 0});

  final int index;

  @override
  State<CustomerBottomNavBar> createState() => _CustomerBottomNavBarState();
}

class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
  int currentPageIndex = 0;
  CarouselController controller = CarouselController();
  final List<Widget> pages = [
    const CustomerHomePage(),
    const CustomerMerchantOverviewPage(),
    const CustomerOrderPage(),
    const CustomerProfilePage()
  ];

  @override
  void initState() {
    currentPageIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          height: 80,
          elevation: 0,
          indicatorColor: lightGreyColor,
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              label: 'Home',
              selectedIcon: Icon(
                Icons.home_outlined,
                color: purpleColor,
              ),
            ),
            NavigationDestination(
                icon: const Icon(Icons.shop_outlined),
                label: 'Merchant',
                selectedIcon: Icon(Icons.shop_outlined, color: purpleColor)),
            NavigationDestination(
                icon: const Icon(Icons.list_outlined),
                label: 'Order',
                selectedIcon: Icon(Icons.list_outlined, color: purpleColor)),
            NavigationDestination(
                icon: const Icon(Icons.person_outline),
                label: 'Profile',
                selectedIcon: Icon(Icons.person_outline, color: purpleColor)),
          ]),
      body: pages[currentPageIndex],
    );
  }
}
