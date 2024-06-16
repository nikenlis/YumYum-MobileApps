import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class ProfilePersonalDetailItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfilePersonalDetailItem(
      {required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        width: double.infinity,
        height: 59,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 19,
            ),
            Flexible(
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
        ));
  }
}
