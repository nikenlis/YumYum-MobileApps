import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/models/customer/product.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/badge.dart';
import 'package:yumyum_amicta/ui/widgets/customer_menu_item.dart';

class CutomerMerchantDetailPage extends StatelessWidget {
  const CutomerMerchantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              CustomBadge(
                value: "0",
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/customer-order', (route) => false);
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
          physics: const PageScrollPhysics(),
          children: [buildProfile(context), buildMenu(context)],
        ));
  }

  Widget buildProfile(BuildContext context) {
    bool isOpen = DateTime.now().hour >= 9 && DateTime.now().hour <= 21;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/img_merchant.png',
                width: 100,
                height: 100,
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bakso Tennis Pak Anton',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Jajanan, Sweet, Cepat Saji, Roti',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Online',
                  style: isOpen
                      ? greenTextStyle.copyWith(fontSize: 12, fontWeight: bold)
                      : yellowTextStyle.copyWith(
                          fontSize: 12, fontWeight: bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenu(BuildContext context) {
    final List<Product> loadedProducts = List.generate(7, (index) {
      return Product(
          id: index,
          categoryId: index + 5,
          merchantId: index + 4,
          name: "Product ${index + 1}",
          imageUrl: 'assets/img_menu_makanan.png',
          description: 'Ini adalah deskripsi produk ${index + 1}',
          price: 10 + Random().nextInt(100) * 1000,
          estimate: '10 min');
    });
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'Pilihan menu untukmu',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          itemCount: 7,
          itemBuilder: (ctx, i) => CustomerMenuItem(
              id: loadedProducts[i].id,
              menu: loadedProducts[i].name,
              description: loadedProducts[i].description,
              price: 'Rp ${loadedProducts[i].price}',
              estimate: loadedProducts[i].estimate,
              imageUrl: loadedProducts[i].imageUrl),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 29,
            mainAxisSpacing: 29,
          ),
        )
      ],
    );
  }
}
