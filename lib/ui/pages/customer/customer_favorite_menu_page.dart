import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/customer/product.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/widgets/badge.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_favorite_menu_item.dart';

class CustomerFavoriteMenuController extends GetxController {
  var favoriteProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavoriteProducts();
  }

  void loadFavoriteProducts() {
    List<Product> loadedProducts = List.generate(6, (index) {
      return Product(
        id: index,
        categoryId: index + 5,
        merchantId: index + 4,
        name: 'Bakso Urat + Ceker',
        imageUrl: 'assets/img_menu_makanan.png',
        description: 'Bakso Tennis',
        price: 10000,
        estimate: '10 min',
      );
    });
    favoriteProducts.assignAll(loadedProducts);
  }
}

class CustomerFavoriteMenuPage extends StatelessWidget {
  const CustomerFavoriteMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerFavoriteMenuController favoriteMenuController =
        Get.put(CustomerFavoriteMenuController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Menu'),
        actions: [
          CustomBadge(
            value: "0",
            child: IconButton(
              onPressed: () {
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
      body: Obx(() {
        final favoriteProducts = favoriteMenuController.favoriteProducts;
        return ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            buildListFavItem(context, favoriteProducts),
          ],
        );
      }),
    );
  }

  Widget buildListFavItem(BuildContext context, List<Product> products) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CustomerFavoriteMenuItem(
            id: products[index].id,
            menu: products[index].name,
            merchant: products[index].description,
            price: 'Rp ${products[index].price}',
            imageUrl: products[index].imageUrl,
          );
        },
      ),
    );
  }
}
