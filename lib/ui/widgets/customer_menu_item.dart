import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/circular_icon.dart';
import 'package:yumyum_amicta/ui/widgets/customer_merchant_more_detail_menu.dart';

class CustomerMenuItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String menu;
  final String description;
  final String price;
  final String estimate;
  int isActive;
  bool isFavorite;

  CustomerMenuItem({
    required this.id,
    required this.menu,
    required this.description,
    required this.price,
    required this.estimate,
    required this.imageUrl,
    this.isActive = 1,
    this.isFavorite = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => CustomerMerchantMoreDetailMenu(id: id));
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2 - 30,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isActive == 1 ? whiteColor : greyColor,
            borderRadius: BorderRadius.circular(11)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image
            Container(
              width: MediaQuery.of(context).size.width / 2 - 60,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///Keterangan
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
            const SizedBox(
              height: 2,
            ),
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
                isActive == 1
                    ? IconButton(
                        onPressed: () {
                          isFavorite = !isFavorite;
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite_outlined
                              : Icons.favorite_outlined,
                          color: purpleColor,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 1,
            ),
            isActive == 1
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
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            estimate,
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: semiBold),
                          ),
                        ],
                      ),
                      const CustomCircularIcon(icon: Icons.add)
                    ],
                  )
                : Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: blackColor)),
                      child: const Center(child: Text('Tutup')),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
