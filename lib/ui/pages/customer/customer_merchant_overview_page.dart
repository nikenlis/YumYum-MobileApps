import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/merchant_controller/merchant_overview_controller.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_model.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_merchant_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';


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
          body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                buildMerchantList(context, controller),
              ],
            ),
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
            MerchantModel merchant = controller.merchants[index];
            return CustomerMerchantItem(
              id: merchant.encryptedId!,
              name: merchant.name!,
              imageUrl: merchant.photo!,
              description: merchant.description!,
              isOpen: merchant.isOpen!,
            );
          },
        ));
  }
}
