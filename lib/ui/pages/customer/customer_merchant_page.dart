import 'package:flutter/material.dart';
import 'package:yumyum_amicta/models/customer/merchant.dart';
import 'package:yumyum_amicta/ui/widgets/customer_merchant_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';

class CustomerMerchantPage extends StatelessWidget {
  const CustomerMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Merchant"), leading: IconButton(icon :Icon(Icons.arrow_back), onPressed: (){},),),
     body: ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        buildSearchBar(context),
        buildMerchantList(context)
      ],
     ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CustomSearchBar(controller: controller),
    );
  }

  Widget buildMerchantList(BuildContext context) {
    final List<Merchant> loadedMerchant = List.generate(10, (index) {
      return Merchant(
        id: index, 
        username: 'Anton', 
        name: 'Warung DGJ', 
        imageUrl: 'assets/img_merchant.png', 
        password: 123, 
        deviceId: 'samsung', 
        rememberToken: '123');
    });


    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
         physics: const ScrollPhysics(),
        itemCount: loadedMerchant.length,
        itemBuilder:(context, index) {
          return  CustomerMerchantItem(
            name: loadedMerchant[index].name!, 
            imageUrl: loadedMerchant[index].imageUrl!);
        },
       ),
    );
  }
}