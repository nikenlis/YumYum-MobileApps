import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/customer/cart_item.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_order_item.dart';
import 'package:yumyum_amicta/ui/widgets/line_sparator.dart';

class OrderController extends GetxController {
  var totalPayment = 0.obs;

  void calculateTotalPayment(List<int> prices) {
    totalPayment.value = prices.fold(0, (sum, price) => sum + price);
  }
}

class CustomerOrderPage extends StatelessWidget {
  const CustomerOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: GetBuilder<OrderController>(
        builder: (controller) {
          return ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              buildListOrder(context),
              buildTotalOrder(context, controller),
            ],
          );
        },
      ),
      floatingActionButton: buildButton(context, orderController),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget buildListOrder(BuildContext context) {
    final List<CartItem> loadedCartItem = List.generate(30, (index) {
      return CartItem(
        id: index,
        menu: 'Bakso Urat + Ceker',
        merchant: 'Bakso Tennis Pak Anton',
        price: 10000,
        quantity: 2,
        isBeingDelivered: true,
        imageUrl: 'assets/img_menu_makanan.png',
      );
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
            imageUrl: loadedCartItem[index].imageUrl,
            merchant: loadedCartItem[index].merchant,
            menu: loadedCartItem[index].menu,
            price: loadedCartItem[index].price,
          );
        },
      ),
    );
  }

  Widget buildTotalOrder(BuildContext context, OrderController controller) {
    List<int> prices = [10000, 10000, 10000];
    controller.calculateTotalPayment(prices);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DotLine(height: 2, color: greyColor),
        const SizedBox(
          height: 15,
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
              Obx(() => Text(
                    'Rp ${controller.totalPayment.value.toString()}',
                    style:
                        blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 90,
        )
      ],
    );
  }

  Widget buildButton(BuildContext context, OrderController controller) {
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
          ),
        ),
      ),
    );
  }
}
