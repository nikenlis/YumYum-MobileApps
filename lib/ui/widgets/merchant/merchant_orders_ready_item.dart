import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';

class MerchantOrdersReadyItem extends StatelessWidget {
  final String customerName;
  final String jumlahItem;
  const MerchantOrdersReadyItem({super.key, required this.customerName, required this.jumlahItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: lightPurpleColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Pesanan dari $customerName',),
                Text("$jumlahItem menu",)
              ],
            ),
          ),

          const CustomFilledButton(title: 'Selesai', width: 80, height: 30, fontSize: 12,)

        ],
      )
    );
  }
}