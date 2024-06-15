import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CustomerMenuItem extends StatelessWidget {
  final String imageUrl;
  final String menu;
  final String description;
  final String price;
  final String estimate;
  final VoidCallback? onPressed;
  bool isFavorite;

  CustomerMenuItem(
      {required this.menu,
      required this.description,
      required this.price,
      required this.estimate,
      required this.imageUrl,
      this.onPressed,
      this.isFavorite = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2 - 30,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(11)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                IconButton(
                    onPressed: () {
                      isFavorite = !isFavorite;
                    },
                    icon: isFavorite
                        ? const Icon(Icons.favorite_outlined)
                        : const Icon(Icons.favorite_border_outlined))
              ],
            ),
            const SizedBox(
              height: 1,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.timer_outlined, color: greyColor,),
                    SizedBox(width: 3,),
                    Text(estimate, style: greyTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),),
                  ],
                ),
                CircleAvatar(
                radius: 20,
                backgroundColor: purpleColor,
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () { },
                    splashColor: greyColor,
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
