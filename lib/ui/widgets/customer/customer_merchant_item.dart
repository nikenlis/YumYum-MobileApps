import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/customer/customer_merchant_overview_page.dart';


class CustomerMerchantItem extends StatelessWidget {
  final int index;
  final String name;
  final String imageUrl;
  final String description;
  final int isOpen;

  const CustomerMerchantItem({
    required this.index,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.isOpen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth / 2 - 50;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/cutomer-merchant-detail',
            arguments: index);
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
                width: containerWidth,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 27),
                      Text(
                        name,
                        style: blackTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
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
                ),
              ),
            ],
          ),
        ),

    );
  }
}
