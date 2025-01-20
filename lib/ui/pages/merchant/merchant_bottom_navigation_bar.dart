import 'package:carousel_slider/carousel_controller.dart' as carousel_slider;
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_orders_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_profile_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_status_menu_page.dart';

class MerchantBottomNavBar extends StatefulWidget {
  const MerchantBottomNavBar({super.key});

  @override
  State<MerchantBottomNavBar> createState() => _MerchantBottomNavBarState();
}

class _MerchantBottomNavBarState extends State<MerchantBottomNavBar> {
  int currentPageIndex = 0;
  carousel_slider.CarouselController controller = carousel_slider.CarouselController();
  final List<Widget> pages = [
    const MerchantOrdersPage(),
    MerchantStatusMenuPage(),
    const MerchantProfilePage(),
  ];
  
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
                icon: const Icon(Icons.list_outlined),
                label: 'Orders',
                selectedIcon: Icon(Icons.list_outlined, color: purpleColor)),
            NavigationDestination(
                icon: const Icon(Icons.shop_outlined),
                label: 'Menu',
                selectedIcon: Icon(Icons.shop_outlined, color: purpleColor)),
            NavigationDestination(
                icon: const Icon(Icons.person_outline),
                label: 'Profile',
                selectedIcon: Icon(Icons.person_outline, color: purpleColor)),
          ]),
      body: pages[currentPageIndex],
    );
  }
}