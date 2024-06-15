import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CustomerMerchantItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  int isOpen;

  CustomerMerchantItem(
      {super.key, required this.name, required this.imageUrl, this.isOpen = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isOpen == 1 ? whiteColor : greyColor,
      ),
      child: Center(
        child: ListTile(
            onTap: () {},
            leading: Image.asset(
              imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
            title: Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
              overflow: TextOverflow.ellipsis,
            )),
      ),
    );
  }
}
