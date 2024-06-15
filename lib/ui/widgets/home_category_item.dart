import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class HomeCategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  const HomeCategoryItem(
      {required this.imageUrl, required this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(imageUrl))),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium),
            )
          ],
        ));
  }
}
