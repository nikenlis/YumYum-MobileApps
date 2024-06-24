import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';

class OrderSuccessController extends GetxController {
  // State untuk menampilkan teks pesanan berhasil
  var successMessage = "Pesanan Berhasil".obs;

  // State untuk menampilkan teks status pengantaran
  var deliveryStatus = "Mohon tunggu sebentar\npesanan akan segera diantar".obs;

  // Metode untuk mengubah pesan pengantaran
  void updateDeliveryStatus(bool isDelivering) {
    if (isDelivering) {
      deliveryStatus.value = "Pesanan sedang diantar";
    } else {
      deliveryStatus.value = "Pesanan akan segera diantar";
    }
  }
}

class CustomerOrderSuccessPage extends StatelessWidget {
  const CustomerOrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderSuccessController controller = Get.put(OrderSuccessController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.successMessage.value,
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 26,
            ),
            Obx(() => Text(
                  controller.deliveryStatus.value,
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              width: 183,
              title: 'Back to Home',
              onPressed: () {
                Get.offNamed(
                    '/customer-bottom-navbar'); // Menggunakan GetX untuk navigasi
              },
            ),
          ],
        ),
      ),
    );
  }
}
