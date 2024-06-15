import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed('/onboarding');
    });
  }
}

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var size = constraints.maxWidth * 0.75;

          return Stack(
            children: [
              Positioned(
                left: -size / 2,
                top: -size / 2,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        purpleColor.withOpacity(0.8),
                        whiteColor.withOpacity(0.5)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -size / 2,
                bottom: -size / 6,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        purpleColor.withOpacity(0.8),
                        whiteColor.withOpacity(0.5)
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: constraints.maxWidth * 0.6,
                  height: constraints.maxHeight * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_logo_splash.png')),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
