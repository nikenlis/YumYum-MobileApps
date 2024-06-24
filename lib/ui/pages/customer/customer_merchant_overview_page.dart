import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/customer/merchant.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_merchant_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';

import 'package:get/get.dart';
import 'package:yumyum_amicta/models/customer/merchant.dart';

class MerchantOverviewController extends GetxController {
  var merchants = List<Merchant>.empty().obs;

  void fetchMerchants() {
    List<Merchant> loadedMerchant = List.generate(30, (index) {
      return Merchant(
        id: index,
        username: 'Anton',
        name: 'Bakso Tennis Pak Anton',
        imageUrl: 'assets/img_merchant.png',
        description: 'Jajanan, Sweet, Cepat Saji, Roti',
        password: 123,
        deviceId: 'samsung',
        rememberToken: '123',
      );
    });
    merchants.assignAll(loadedMerchant);
  }

  @override
  void onInit() {
    fetchMerchants();
    super.onInit();
  }
}

class CustomerMerchantOverviewPage extends StatelessWidget {
  const CustomerMerchantOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MerchantOverviewController>(
      init: MerchantOverviewController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Merchant',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(51),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: buildSearchBar(context),
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              buildMerchantList(context, controller),
            ],
          ),
        );
      },
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CustomSearchBar(controller: controller),
    );
  }

  Widget buildMerchantList(
      BuildContext context, MerchantOverviewController controller) {
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.merchants.length,
          itemBuilder: (context, index) {
            Merchant merchant = controller.merchants[index];
            return CustomerMerchantItem(
              id: merchant.id!,
              name: merchant.name!,
              imageUrl: merchant.imageUrl!,
              description: merchant.description!,
            );
          },
        ));
  }
}
