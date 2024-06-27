import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/share_method.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/auth/login_view_model.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/form.dart';

class CustomerSignInController extends GetxController {
  final studentNumberController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final LoginViewModel _viewModel = Get.put(LoginViewModel());

  bool validate() {
    if (studentNumberController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void signIn(BuildContext context) {
    if (validate()) {
     _viewModel.loginUser(studentNumberController.text, passwordController.text);
    } else {
      showCustomSnackbar(context, 'Semua Field Harus diIsi');
    }
  }

  @override
  void dispose() {
    studentNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class CustomerSignInPage extends StatelessWidget {
  CustomerSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerSignInController>(
      init: CustomerSignInController(),
      builder: (controller) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 50,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 100,
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
                    width: 155,
                    height: 50,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 100,
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
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Student Number',
                      controller: controller.studentNumberController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                      onPressed: () => controller.signIn(context),
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
                  Get.offAllNamed('/merchant-sign-in');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
