import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/circular_icon.dart';

class OrderItemController extends GetxController {
  var isBeingDelivered = true.obs;
  var quantity = 1.obs;

  void toggleDeliveryStatus() {
    isBeingDelivered.value = !isBeingDelivered.value;
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}

class CustomerOrderItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String merchant;
  final String menu;
  final int price;
  final TextEditingController? controller;

  const CustomerOrderItem({
    required this.index,
    required this.imageUrl,
    required this.merchant,
    required this.menu,
    required this.price,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OrderItemController orderItemController =
        Get.put(OrderItemController());

    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double itemWidth = screenWidth - 100;
    final double imageWidth = itemWidth / 2 - 20;

    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: greyColor,
            foregroundColor: whiteColor,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(11),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: imageWidth,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            merchant,
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        menu,
                        style: blackTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Rp $price',
                        style: blackTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Diantar',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: orderItemController.isBeingDelivered.value,
                        onChanged: (value) {
                          orderItemController.toggleDeliveryStatus();
                        },
                      ),
                    ),
                    Row(
                      children: [
                        CustomCircularIcon(
                          onPressed: (){},
                          icon: Icons.remove,
                          size: 15,
                        ),
                        const SizedBox(width: 12),
                        Obx(() => Text(
                              '${orderItemController.quantity.value}',
                              style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                            )),
                        const SizedBox(width: 12),
                       CustomCircularIcon(
                          onPressed: (){},
                          icon: Icons.add,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Text(
              'Notes',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 3),
            TextField(
              maxLines: 4,
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Contoh : Lokasi saya di deket',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                border: OutlineInputBorder(),
              ),
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
