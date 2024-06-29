import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/circular_icon.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_merchant_more_detail_menu.dart';

class MenuItemController extends GetxController {
  var isActive = 1.obs;
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void setActive(int value) {
    isActive.value = value;
  }
}

class CustomerMenuItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String menu;
  final String description;
  final String price;
  final String estimate;
  final int initialIsActive;
  final bool initialIsFavorite;

  const CustomerMenuItem({
    required this.id,
    required this.menu,
    required this.description,
    required this.price,
    required this.estimate,
    required this.imageUrl,
    this.initialIsActive = 1,
    this.initialIsFavorite = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MenuItemController menuItemController = Get.put(MenuItemController());
    menuItemController.isActive.value = initialIsActive;
    menuItemController.isFavorite.value = initialIsFavorite;

    final mediaQuery = MediaQuery.of(context);
    final itemWidth = mediaQuery.size.width / 2 - 30;
    final imageWidth = itemWidth - 30;

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => CustomerMerchantMoreDetailMenu(id: id));
      },
      child: Obx(() => Container(
            height: 300,
            width: itemWidth,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: menuItemController.isActive.value == 1
                  ? whiteColor
                  : greyColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: imageWidth,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  menu,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: purpleTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    menuItemController.isActive.value == 1
                        ? IconButton(
                            onPressed: menuItemController.toggleFavorite,
                            icon: Icon(
                              menuItemController.isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: purpleColor,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 1),
                menuItemController.isActive.value == 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                color: greyColor,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                estimate,
                                style: greyTextStyle.copyWith(
                                    fontSize: 12, fontWeight: semiBold),
                              ),
                            ],
                          ),
                          const CustomCircularIcon(icon: Icons.add),
                        ],
                      )
                    : Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: blackColor),
                          ),
                          child: const Center(child: Text('Tutup')),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}
