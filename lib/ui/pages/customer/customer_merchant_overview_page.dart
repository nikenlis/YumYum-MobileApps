import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/customer/merchant.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_model.dart';
import 'package:yumyum_amicta/models/merchant_model/super_merchant_request_model.dart';
import 'package:yumyum_amicta/models/merchant_model/super_merchant_response_model.dart';
import 'package:yumyum_amicta/models/product_model/product_model.dart';
import 'package:yumyum_amicta/services/home_merchant_service.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_merchant_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';

class MerchantOverviewController extends GetxController {
  var merchants = List<MerchantModel>.empty().obs;
  var products = List<ProductModel>.empty().obs;
  var loading = false.obs;
  late GetMerchantOverview _getAllDataMerchant;

  @override
  void onInit() {
    _getAllDataMerchant = Get.put(GetMerchantOverview());
    super.onInit();
    getListMerchantAndProducts();
  }

  void getListMerchantAndProducts() async {
    loading(true);
    try {
      SuperMerchantRequestModel requestModel = SuperMerchantRequestModel(
        limitProduct: 1,
        search: "",
        hideCategory: true,
        hideInacticveProduct: false,
      );

      SuperMerchantResponseModel? response =
          await _getAllDataMerchant.fetchMerchants(requestModel);

      if (response != null) {
        merchants.assignAll(response.merchantModel!);
        for (var merchant in response.merchantModel!) {
          var product = merchant.productModel;
          if (product != null) {
            products.addAll(product);
          }
        }
      } else {
        Text(
          'Ngga ada data',
          style: blackTextStyle.copyWith(fontSize: 50),
        );
      }
    } finally {
      loading(false);
    }
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
              index: index,
              name: merchant.username!,
              imageUrl: merchant.photo!,
              description: merchant.description!,
              isOpen: merchant.isOpen!,
            );
          },
        ));
  }
}
