import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class ProfileController extends GetxController {
  // Define any observable variables and methods here
}

class ProfilePersonalDetailItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfilePersonalDetailItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double itemWidth = mediaQuery.size.width - 34;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      width: itemWidth,
      height: 59,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 19),
          Expanded(
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
