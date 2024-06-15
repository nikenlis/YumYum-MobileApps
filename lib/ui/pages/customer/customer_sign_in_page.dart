import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/share_method.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/form.dart';

// Step 2: Create a controller
class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

class CustomerSignInPage extends StatelessWidget {
  CustomerSignInPage({super.key});

  // Step 3: Instantiate the controller
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen dimensions
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.15,
                height: screenHeight * 0.06,
                margin: EdgeInsets.only(
                  top: screenHeight * 0.12,
                  bottom: screenHeight * 0.12,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_logo.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.06,
                margin: EdgeInsets.only(
                  top: screenHeight * 0.12,
                  bottom: screenHeight * 0.12,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_logo_name.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Sign In to Your\nAccount',
            style: blackTextStyle.copyWith(
              fontSize: screenWidth * 0.05,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: EMAIL INPUT
                CustomFormField(
                  title: 'Student Number',
                  controller: controller.emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: PASSWORD INPUT
                CustomFormField(
                  title: 'Password',
                  obsecureText: true,
                  iconVisibility: true,
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Sign In',
                  onPressed: () {
                    if (controller.validate()) {
                      Get.offNamed('/customer-bottom-navbar');
                    } else {
                      showCustomSnackbar(context, 'Semua Field Harus diIsi');
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButton(
            title: 'Masuk sebagai merchant',
            onPressed: () {
              Get.offNamed('/merchant-sign-in');
            },
          ),
        ],
      ),
    );
  }
}
