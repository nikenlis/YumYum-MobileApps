import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_model.dart';
import 'package:yumyum_amicta/models/product_model/product_model.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_bottom_navigation_bar.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';
import 'package:yumyum_amicta/ui/widgets/badge.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_menu_item.dart';

class MerchantDetailController extends GetxController {
  var isOpen = DateTime.now().hour >= 9 && DateTime.now().hour <= 21;

  var merchants = List<MerchantModel>.empty().obs;
  var products = List<ProductModel>.empty().obs;
  MerchantOverviewController merchantOverviewController = Get.find();

  @override
  void onInit() {
    merchants.assignAll(merchantOverviewController.merchants);
    products.assignAll(merchantOverviewController.products);
    super.onInit();
  }
}

class CutomerMerchantDetailPage extends StatelessWidget {
  const CutomerMerchantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MerchantDetailController>(
      init: MerchantDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
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
            physics: const PageScrollPhysics(),
            children: [
              buildProfile(context, controller),
              buildMenu(context, controller),
            ],
          ),
        );
      },
    );
  }

  Widget buildProfile(
      BuildContext context, MerchantDetailController controller) {
    return Obx(() {
      var pageIndex = ModalRoute.of(context)?.settings.arguments as int;
      if (pageIndex >= controller.merchants.length) {
        return Container();
      }
      MerchantModel merchant = controller.merchants[pageIndex];

      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                merchant.photo!,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    merchant.username!,
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
                    merchant.description!,
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
                    merchant.isOpen == 1 ? 'Online' : 'Offline',
                    style: merchant.isOpen == 1
                        ? greenTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold)
                        : yellowTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildMenu(BuildContext context, MerchantDetailController controller) {
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
      Obx(() {
        return GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          itemCount: controller.products.length,
          itemBuilder: (ctx, i) {
            ProductModel product = controller.products[i];
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
            mainAxisSpacing: 29,
          ),
        );
      })
    ],
  );
}
}
