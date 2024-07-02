
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/category_controller/category_detail_controller.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/widgets/badge.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_menu_item.dart';

class CustomerCategoryPage extends StatelessWidget {
  const CustomerCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    Get.lazyPut<CategoryDetailController>(() => CategoryDetailController(id));

    final CategoryDetailController controller = Get.find<CategoryDetailController>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(()=> Text('Kategori ${controller.category.value.name}')),
        actions: [
          CustomBadge(
                value: "0",
                child: IconButton(
                  onPressed: () {
                    Get.offAll(() => const CustomerBottomNavBar(index: 2));
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
            buildHead(context),
            buildBody(context, controller),
          ],
        )
    );
  }

  Widget buildHead(BuildContext context) {
    return SizedBox(
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
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Ganjel perut buat naikin mood.',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context, CategoryDetailController controller) {
    return Obx((){
      return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: controller.products.length,
      itemBuilder: (ctx, i) {
        var product = controller.products[i];
        return CustomerMenuItem(
        id: i,
        menu: product.name!,
        description: product.description!,
        price: product.price!,
        estimate: product.estimate!,
        imageUrl: product.image!,
      );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 29,
        mainAxisSpacing: 20,
      ),
    );
    });
  }
}
