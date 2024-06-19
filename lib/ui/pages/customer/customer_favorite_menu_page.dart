import 'package:flutter/material.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/widgets/badge.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_favorite_menu_item.dart';

class CustomerFavoriteMenuPage extends StatelessWidget {
  const CustomerFavoriteMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Menu'), actions: [
        CustomBadge(
          value: "0",
          child: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerBottomNavBar()),
                    (route) => false);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 28,
              )),
        ),
        const SizedBox(
          width: 20,
        )
      ]),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          buildListFavItem(context),
        ],
      ),
    );
  }

  Widget buildListFavItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return CustomerFavoriteMenuItem(
              id: index,
              menu: 'Bakso Urat + Ceker',
              merchant: 'Bakso Tennis',
              price: 'Rp 10.000',
              imageUrl: 'assets/img_menu_makanan.png');
        },
      ),
    );
  }
}
