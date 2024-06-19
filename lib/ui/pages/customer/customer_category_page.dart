import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yumyum_amicta/models/customer/product.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_menu_item.dart';

class CustomerCategoryPage extends StatelessWidget {
  const CustomerCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          buildHead(context),
          buildBody(context)
        ],
      ),
    );
  }

  Widget buildHead(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img_banner.png',
            height: 160,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Ganjel perut buat naikin mood.',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
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
    return GridView.builder(
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
        );
  }
}
