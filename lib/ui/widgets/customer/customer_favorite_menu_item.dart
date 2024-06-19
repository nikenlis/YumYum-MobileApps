import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';

class CustomerFavoriteMenuItem extends StatelessWidget {
  final int id;
  final String merchant;
  final String menu;
  final String price;
  final String imageUrl;
  final VoidCallback? onPressed;
  const CustomerFavoriteMenuItem(
      {super.key,
      required this.id,
      required this.menu,
      required this.merchant,
      required this.price,
      required this.imageUrl,
      this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
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
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: whiteColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        merchant,
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        menu,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        price,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(image: AssetImage(imageUrl))),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  color: purpleColor,
                ),
                CustomFilledButton(
                  title: 'Tambah',
                  width: 100,
                  height: 45,
                  onPressed: onPressed,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
