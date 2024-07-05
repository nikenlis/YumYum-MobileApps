import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/cart_controller/cart_controller.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/merchant_controller/customer_merchant_more_detail_menu_controller.dart';
import 'package:yumyum_amicta/models/product_model/product_model.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';

class CustomerMerchantMoreDetailMenu extends StatelessWidget {
  final ProductModel product;

  const CustomerMerchantMoreDetailMenu({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final CustomerMerchantMoreDetailMenuController detailMenuController =
        Get.put(CustomerMerchantMoreDetailMenuController());

    final mediaQuery = MediaQuery.of(context);
    detailMenuController.merchantDetailController
        .initProduct(product, Get.find<CartController>());

    return Obx(() => AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          alignment: Alignment.bottomCenter,
          content: Container(
            padding: const EdgeInsets.all(30),
            height: 480,
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: lightBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    product.image!,
                    width: mediaQuery.size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.name!,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(height: 10),
                Text(
                  product.description!,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 13),
                Text(
                  product.price!,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(height: 25),
                detailMenuController.isActive.value
                    ? Row(
                        children: [
                          Expanded(
                            child: CustomFilledButton(
                              title: 'Kurangi pesanan',
                              onPressed: () {
                                detailMenuController.merchantDetailController
                                    .setQuantity(false);
                                detailMenuController.merchantDetailController
                                    .addItem(product);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              detailMenuController.toggleFavorite();
                            },
                            icon: Icon(
                              detailMenuController.isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: purpleColor,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: mediaQuery.size.width * 0.2,
                          height: mediaQuery.size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: blackColor),
                          ),
                          child: Center(
                            child: Text('Tutup', style: blackTextStyle),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
