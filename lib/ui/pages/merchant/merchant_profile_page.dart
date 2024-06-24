import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/profile_personal_detail_item.dart';

class MerchantProfilePage extends StatelessWidget {
  const MerchantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchant Profile'),
      ),
      body: ListView(
        children: [
          buildImageProfile(context),
          buildPersonalDetail(context),
        ],
      ),
    );
  }

  Widget buildImageProfile(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 26,
        ),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage('assets/img_profile.png'))),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Pak Anton',
          style: blackTextStyle.copyWith(fontSize: 15, fontWeight: semiBold),
        )
      ],
    );
  }

  Widget buildPersonalDetail(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 63),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Details',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
              const ProfilePersonalDetailItem(
              title: 'Bakso Tennis Pak Anton', icon: Icons.person),
          const ProfilePersonalDetailItem(
              title: 'Pak Anton', icon: Icons.house),
          const ProfilePersonalDetailItem(
              title: 'Jualan makanan, enak pokoke jos', icon: Icons.description),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/merchant-sign-in', (route) => false);
              },
              child: Text(
                'Log out',
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          Center(
            child: CustomTextButton(
              title: 'Report a Problem',
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
