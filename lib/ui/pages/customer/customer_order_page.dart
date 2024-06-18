import 'package:flutter/material.dart';
import 'package:yumyum_amicta/models/customer/cart_item.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer_order_item.dart';

class CustomerOrderPage extends StatelessWidget {
  const CustomerOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          buildListOrder(context),
          buildTotalOrder(context),
        ],
      ),
      floatingActionButton: buildBotton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget buildListOrder(BuildContext context) {
    final List<CartItem> loadedChartItem = List.generate(30, (index) {
      return CartItem(
          id: index,
          menu: 'Bakso Urat + Ceker',
          merchant: 'Bakso Tennis Pak Anton',
          price: 10000,
          quantity: 2,
          isBeingDelivered: true,
          imageUrl: 'assets/img_menu_makanan.png');
    });

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomerOrderItem(
            index: index,
            imageUrl: loadedChartItem[index].imageUrl,
            merchant: loadedChartItem[index].merchant,
            menu: loadedChartItem[index].menu,
            price: loadedChartItem[index].price,
          );
        },
      ),
    );
  }

  Widget buildTotalOrder(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          width: double.infinity,
          height: 3,
          decoration: BoxDecoration(
              color: greyColor, borderRadius: BorderRadius.circular(24)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pembayaran',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Text(
                'Rp 35.000',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 90,
        )
      ],
    );
  }

  Widget buildBotton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/customer-order-success', (route) => false);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.circular(56),
        ),
        child: Center(
            child: Text(
          'Pesan Sekarang',
          style: whiteTextStyle.copyWith(fontSize: 15, fontWeight: semiBold),
        )),
      ),
    );
  }
}
