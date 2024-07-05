import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/profile_personal_detail_item.dart';

class CustomerProfileController extends GetxController {}

class CustomerProfilePage extends StatelessWidget {
  CustomerProfilePage({super.key});
  AuthenticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProfileController>(
      init: CustomerProfileController(),
      builder: (controller) {
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
      },
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
            image: DecorationImage(
              image: AssetImage('assets/img_profile.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
          const ProfilePersonalDetailItem(
              title: 'Niken Lismiati', icon: Icons.person),
          const ProfilePersonalDetailItem(
              title: '22.11.4797', icon: Icons.house),
          const ProfilePersonalDetailItem(
              title: 'nikenlismiati@students.amikom.ac.id', icon: Icons.email),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                _authManager.logOut();
                Get.offAllNamed('/customer-sign-in');
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
