import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/profile_personal_detail_item.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
          height: 5,
        ),
        Text(
          'Niken Lismiati',
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
          ProfilePersonalDetailItem(
              title: 'Niken Lismiati', icon: Icons.person),
          ProfilePersonalDetailItem(title: '22.11.4797', icon: Icons.house),
          ProfilePersonalDetailItem(
              title: 'nikenlismiati@students.amikom.ac.id', icon: Icons.person),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                                    context, '/customer-sign-in', (route) => false);
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
          CustomTextButton(
            title: 'Report a Problem',
            onPressed: () {},
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
