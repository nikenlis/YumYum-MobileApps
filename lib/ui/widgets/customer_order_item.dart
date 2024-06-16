import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/circular_icon.dart';

class CustomerOrderItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String merchant;
  final String menu;
  final int price;
  final int quantity;
  final bool isBeingDelivered;
  final TextEditingController? controller;
  const CustomerOrderItem(
      {required this.index,
      required this.imageUrl,
      required this.merchant,
      required this.menu,
      required this.price,
      required this.quantity,
      this.isBeingDelivered = true,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (_) {},
          backgroundColor: greyColor,
          foregroundColor: whiteColor,
          icon: Icons.delete,
          label: 'Delete',
        )
      ]),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(11),
        width: double.infinity,
        height: 340,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                ///Detail Order
                Column(
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
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          merchant,
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: medium),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      menu,
                      style: blackTextStyle.copyWith(
                          fontSize: 15, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rp $price',
                      style: blackTextStyle.copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(
              height: 5,
            ),
            Text(
              'Diantar',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Diantar
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),

                ///Add Button change quantity
                Row(
                  children: [
                    const CustomCircularIcon(
                      icon: Icons.remove,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      quantity.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: bold),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const CustomCircularIcon(
                      icon: Icons.add,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),

            ///Keterangan
            Text(
              'Notes',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            TextField(
              maxLines: 4,
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Contoh : Lokasi saya di deket',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                border: OutlineInputBorder(),
              ),
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            )
          ],
        ),
      ),
    );
  }
}