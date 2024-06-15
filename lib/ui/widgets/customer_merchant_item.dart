import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CustomerMerchantItem extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  int isOpen;

  CustomerMerchantItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    this.isOpen = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/cutomer-merchant-detail', (route) => false, arguments: id);
      },
      child: Container(
        height: 110,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isOpen == 1 ? whiteColor : greyColor,
        ),
        child: Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width/2-50,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover,),
                ),
              ),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 27,),
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      description,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ))
          ])
            ),
    );
  }
}
