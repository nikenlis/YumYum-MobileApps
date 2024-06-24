import 'package:flutter/material.dart';
import 'package:yumyum_amicta/ui/widgets/merchant/merchant_orders_selesai_item.dart';

class MerchantOrdersTabSelesaiPage extends StatelessWidget {
  const MerchantOrdersTabSelesaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: const MerchantOrdersSelesaiItem(customerName: 'Niken Lismiati', jumlahItem: '4', total: 45000)
                  );
                }))
    );
  }
}