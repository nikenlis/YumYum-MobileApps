import 'package:flutter/material.dart';
import 'package:yumyum_amicta/models/customer/merchant.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/customer_merchant_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';

class CustomerMerchantOverviewPage extends StatelessWidget {
  const CustomerMerchantOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merchant',style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(51),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: buildSearchBar(context)),
          ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildMerchantList(context),
        ],
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final controller = TextEditingController();
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: CustomSearchBar(controller: controller));
  }

  Widget buildMerchantList(BuildContext context) {
    final List<Merchant> loadedMerchant = List.generate(30, (index) {
      return Merchant(
          id: index,
          username: 'Anton',
          name: 'Bakso Tennis Pak Anton',
          imageUrl: 'assets/img_merchant.png',
          description: 'Jajanan, Sweet, Cepat Saji, Roti',
          password: 123,
          deviceId: 'samsung',
          rememberToken: '123');
    });

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: loadedMerchant.length,
        itemBuilder: (context, index) {
          return CustomerMerchantItem(
            id: loadedMerchant[index].id!,
            name: loadedMerchant[index].name!,
            imageUrl: loadedMerchant[index].imageUrl!,
            description: loadedMerchant[index].description!,
          );
        },
      ),
    );
  }
}
