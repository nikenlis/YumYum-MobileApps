import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_menu_item.dart';
import 'dart:math';

import 'package:yumyum_amicta/models/customer/product.dart';

// Controller for managing the products displayed in the category page
class CustomerCategoryController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load initial products when the controller is initialized
    loadProducts();
  }

  // Generates dummy products and assigns them to the products list
  void loadProducts() {
    List<Product> loadedProducts = List.generate(7, (index) {
      return Product(
        id: index,
        categoryId: index + 5,
        merchantId: index + 4,
        name: "Product ${index + 1}",
        imageUrl: 'assets/img_menu_makanan.png',
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100) * 1000,
        estimate: '10 min',
      );
    });
    products.assignAll(loadedProducts); // Update products observable list
  }
}

// Stateless widget representing the category page for customers
class CustomerCategoryPage extends StatelessWidget {
  // Instance of the category controller to manage products state
  final CustomerCategoryController categoryController =
      Get.put(CustomerCategoryController());

  CustomerCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'), // App bar title
      ),
      body: Obx(() => ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              buildHead(context),
              buildBody(context)
            ], // Build page content
          )),
    );
  }

  // Widget for the banner section at the top of the category page
  Widget buildHead(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img_banner.png', // Banner image
            height: 160,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Ganjel perut buat naikin mood.', // Banner text
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          )
        ],
      ),
    );
  }

  // Widget for displaying the grid of product items
  Widget buildBody(BuildContext context) {
    return Obx(() {
      final products = categoryController.products;
      return GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => CustomerMenuItem(
          id: products[i].id,
          menu: products[i].name,
          description: products[i].description,
          price:
              'Rp ${products[i].price}', // Displaying price in Indonesian Rupiah
          estimate: products[i].estimate,
          imageUrl: products[i].imageUrl,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 29,
          mainAxisSpacing: 29,
        ),
      );
    });
  }
}
