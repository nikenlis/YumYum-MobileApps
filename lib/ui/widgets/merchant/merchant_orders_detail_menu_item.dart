import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class MerchantOrderDetailMenuItem extends StatelessWidget {
  final String namaMenu;
  final int amount;
  final String price;
  const MerchantOrderDetailMenuItem({super.key, required this.namaMenu, required this.amount, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Text('${amount.toString()}x', style: blackTextStyle.copyWith(fontWeight: semiBold),),
            const SizedBox(width: 10,),
            Container(
              margin: const  EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width/2,
              child: Text(namaMenu, style: blackTextStyle.copyWith(fontWeight: semiBold), overflow: TextOverflow.ellipsis ,)),
            const Spacer(),
            Text(price, style: blackTextStyle.copyWith(fontWeight: light),),
          ],
        );
  }
}