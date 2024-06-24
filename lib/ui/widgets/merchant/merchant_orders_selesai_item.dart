
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class MerchantOrdersSelesaiItem extends StatelessWidget {
  final String customerName;
  final String jumlahItem;
  final int total;

  const MerchantOrdersSelesaiItem(
      {super.key,
      required this.customerName,
      required this.jumlahItem,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: lightPurpleColor
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  customerName,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                      overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2,),
                Text(
                  "$jumlahItem menu",
                  style: greyTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
          Text(
            'Rp $total',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
