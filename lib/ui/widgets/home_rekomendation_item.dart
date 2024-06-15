import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class HomeRecomendationItem extends StatelessWidget {
  final String imgUrl;
  final String menu;
  final String merchant;
  final String price;
  final VoidCallback? onPressed;
  const HomeRecomendationItem(
      {required this.menu,
      required this.merchant,
      required this.price,
      required this.imgUrl,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width/2-30,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(11)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2-50,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
            const SizedBox(height: 8,),
            Text(
              price,
              style: purpleTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
