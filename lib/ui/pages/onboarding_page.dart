import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  List<String> titles = [
    'All your favorites',
    'Free delivery offers',
    'Choose your food',
  ];

  List<String> subtitles = [
    'Order from the best local restaurants with easy, on-demand delivery.',
    'Free delivery for new customers\nvia Apple Pay and others payment methods.',
    'Easily find your type of food craving and you’ll get delivery in wide range.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/img_onboarding1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1, //biar satu gambar satu page
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: controller,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            CustomFilledButton(
                              title: 'Sign-in',
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/customer-sign-in', (route) => false);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 0
                                    ? purpleColor
                                    : greyColor,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 1
                                    ? purpleColor
                                    : greyColor,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 2
                                    ? purpleColor
                                    : greyColor,
                              ),
                            ),
                            const Spacer(),
                            CustomFilledButton(
                              title: 'Continue',
                              width: 150,
                              onPressed: () {
                                controller.nextPage();
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
