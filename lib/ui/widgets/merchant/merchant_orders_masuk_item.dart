import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumyum_amicta/models/merchant/order.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/line_sparator.dart';
import 'package:yumyum_amicta/ui/widgets/merchant/merchant_orders_detail_menu_item..dart';

class MerchantOrdersMasukItem extends StatelessWidget {
  final String customerName;
  final String jumlahItem;
  final bool isBeingDelivered;
  final String note;

  const MerchantOrdersMasukItem({
    super.key,
    required this.customerName,
    required this.jumlahItem,
    required this.isBeingDelivered,
    this.note = 'Pak jangan make bawang ya',
  });

  @override
  Widget build(BuildContext context) {
    final List<Order> loadedOrder = List.generate(7, (index) {
      return Order(
          image:
              'https://yumyum.beliaplikasi.shop/storage/product/default-product.png',
          name: 'Bakso Urat + Ceker',
          price: "Rp 25.000",
          amount: 1,
          totalPrice: 50000,
          active: 0);
    });

    int total = 0;
    final List<Order> orders = loadedOrder;
    orders.forEach((order) {
      total += order.totalPrice;
    });

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerName,
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "$jumlahItem menu",
                style:
                    greyTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomOutlineButton(
                    title: 'Tolak',
                    onPressed: () {},
                    width: 100,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomFilledButton(
                    title: 'Terima',
                    onPressed: () {},
                    width: 100,
                    height: 35,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),

          //bagian expandnya
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(24),
                color: whiteColor,
                child: ListView(
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const PageScrollPhysics(),
                      itemCount: int.parse(jumlahItem),
                      itemBuilder: (context, index) {
                        return MerchantOrderDetailMenuItem(
                          amount: loadedOrder[index].amount,
                          namaMenu: loadedOrder[index].name,
                          price: loadedOrder[index].price,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DotLine(height: 1, color: greyColor),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: blackTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        Text(
                          'Rp ${total}',
                          style: blackTextStyle.copyWith(fontWeight: semiBold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DotLine(height: 1, color: greyColor),
                    const SizedBox(
                      height: 10,
                    ),
                    isBeingDelivered
                        ? Row(
                            children: [
                              Icon(
                                Icons.send,
                                color: redColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Pesanan minta diantar')
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.takeout_dining,
                                color: redColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Pesanan akan diambil sendiri')
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    DotLine(height: 1, color: greyColor),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: lightYellowColor,
                      ),
                      child: Text(
                        note,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
