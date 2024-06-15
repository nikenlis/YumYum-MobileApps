import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class OnboardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      title: 'All your favorites',
      subtitle:
          'Order from the best local restaurants with easy, on-demand delivery.',
      imagePath: 'assets/img_onboarding1.png',
    ),
    OnboardingData(
      title: 'Free delivery offers',
      subtitle:
          'Free delivery for new customers via Apple Pay and others payment methods.',
      imagePath: 'assets/img_onboarding2.png',
    ),
    OnboardingData(
      title: 'Choose your food',
      subtitle:
          'Easily find your type of food craving and you’ll get delivery in wide range.',
      imagePath: 'assets/img_onboarding3.png',
    ),
  ];

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    carouselController.nextPage();
  }

  void goToSignIn() {
    Get.offAllNamed('/customer-sign-in');
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? purpleColor : greyColor,
      ),
    );
  }
}

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;

  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: whiteColor, fontSize: 16),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: controller.onboardingData.map((data) {
                return Image.asset(
                  data.imagePath,
                  height: 331,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  controller.updateIndex(index);
                },
              ),
              carouselController: controller.carouselController,
            ),
            SizedBox(height: size.height * 0.08),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.055,
                vertical: size.height * 0.03,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        controller.onboardingData[controller.currentIndex.value]
                            .title,
                        style: blackTextStyle,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(height: size.height * 0.03),
                  Obx(() => Text(
                        controller.onboardingData[controller.currentIndex.value]
                            .subtitle,
                        style: greyTextStyle,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: controller.currentIndex.value == 2
                        ? size.height * 0.038
                        : size.height * 0.05,
                  ),
                  Obx(() => controller.currentIndex.value == 2
                      ? Column(
                          children: [
                            CustomFilledButton(
                              title: 'Sign-in',
                              onPressed: controller.goToSignIn,
                            ),
                            SizedBox(height: size.height * 0.02),
                          ],
                        )
                      : Row(
                          children: [
                            IndicatorDot(
                                isActive: controller.currentIndex.value == 0),
                            IndicatorDot(
                                isActive: controller.currentIndex.value == 1),
                            IndicatorDot(
                                isActive: controller.currentIndex.value == 2),
                            const Spacer(),
                            CustomFilledButton(
                              title: 'Continue',
                              width: 150,
                              onPressed: controller.nextPage,
                            ),
                          ],
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
