import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yumyum_amicta/shared/theme.dart';

class HomeRecomendationItemController extends GetxController {
  var itemWidth = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mediaQuery = MediaQuery.of(Get.context!);
      itemWidth.value = (mediaQuery.size.width / 2) - 30;
    });
  }
}

class HomeRecomendationItem extends StatelessWidget {
  final String imageUrl;
  final String menu;
  final String merchant;
  final String price;
  final VoidCallback? onPressed;
  final HomeRecomendationItemController controller =
      Get.find<HomeRecomendationItemController>();

  HomeRecomendationItem({
    required this.menu,
    required this.merchant,
    required this.price,
    required this.imageUrl,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final itemWidth = controller.itemWidth.value;
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/cutomer-merchant-detail');
        },
        child: Container(
          height: 200,
          width: itemWidth,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: itemWidth - 20,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
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
                merchant,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    });
  }
}
