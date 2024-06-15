import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
@override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 1.5;
    return Scaffold(
      body: Stack(
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
                      colors: [purpleColor.withOpacity(0.8), whiteColor.withOpacity(0.5)])),
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
                      colors: [purpleColor.withOpacity(0.8), whiteColor.withOpacity(0.5)])),
            ),
          ),
          Center(
            child: Container(
              width: 337,
              height: 262,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/img_logo_splash.png'))
              ),
            ),
          )
        ],
      ),
    );
  }
}