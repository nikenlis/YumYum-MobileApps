import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';

class DetailMenuController extends GetxController {
  var isActive = true.obs;
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void setActive(bool value) {
    isActive.value = value;
  }
}

class CustomerMerchantMoreDetailMenu extends StatelessWidget {
  final int id;

  const CustomerMerchantMoreDetailMenu({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final DetailMenuController detailMenuController =
        Get.put(DetailMenuController());
    final mediaQuery = MediaQuery.of(context);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: mediaQuery.size.height * 0.5,
        width: mediaQuery.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/img_menu_makanan.png',
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Title Product 1',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10),
            Text(
              'Bakso Urat dengan + 2 ceker',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 13),
            Text(
              'Rp 10.000',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 25),
            Obx(() => detailMenuController.isActive.value
                ? Row(
                    children: [
                      Expanded(
                        child: CustomFilledButton(
                          title: 'Tambah pesanan',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          detailMenuController.toggleFavorite();
                        },
                        icon: Icon(
                          detailMenuController.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: purpleColor,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: mediaQuery.size.width * 0.2,
                      height: mediaQuery.size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: blackColor),
                      ),
                      child: Center(
                        child: Text('Tutup', style: blackTextStyle),
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
