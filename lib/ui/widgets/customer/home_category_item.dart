import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class HomeCategoryItemController extends GetxController {
  var isClicked = false.obs;

  void toggleClicked() {
    isClicked.value = !isClicked.value;
  }
}

class HomeCategoryItem extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  final String title;
  // final VoidCallback? onTap;

  const HomeCategoryItem({
    this.categoryName = 'Drink',
    required this.imageUrl,
    required this.title,
    // this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double itemWidth = (mediaQuery.size.width / 3) - 75;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/customer-catagory',
            arguments: categoryName);
      },
      child: Column(
        children: [
          Container(
            width: itemWidth,
            height: itemWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: medium),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
