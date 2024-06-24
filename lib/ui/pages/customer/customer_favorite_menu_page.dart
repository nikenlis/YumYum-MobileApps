import 'package:flutter/material.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/widgets/badge.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_favorite_menu_item.dart';

// Stateless widget for displaying favorite menu items
class CustomerFavoriteMenuPage extends StatelessWidget {
  const CustomerFavoriteMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Menu'), // Title of the app bar
        actions: [
          // Action button for shopping cart with badge
          CustomBadge(
            value: "0", // Initial value of badge
            child: IconButton(
              onPressed: () {
                // Navigate to Order page (index 2) in CustomerBottomNavBar and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerBottomNavBar(index: 2)),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 28,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          buildListFavItem(context), // Build the list of favorite menu items
        ],
      ),
    );
  }

  // Widget for building the list of favorite menu items
  Widget buildListFavItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 6, // Hard-coded number of favorite items
        itemBuilder: (context, index) {
          return CustomerFavoriteMenuItem(
            id: index,
            menu: 'Bakso Urat + Ceker', // Example menu name
            merchant: 'Bakso Tennis', // Example merchant name
            price: 'Rp 10.000', // Example price in Indonesian Rupiah
            imageUrl: 'assets/img_menu_makanan.png', // Example image URL
          );
        },
      ),
    );
  }
}
