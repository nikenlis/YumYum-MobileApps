import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:get/get.dart';

class BadgeController extends GetxController {
  var badgeValue = '0'.obs;

  void updateBadgeValue(String newValue) {
    badgeValue.value = newValue;
  }
}

class CustomBadge extends StatelessWidget {
  final Widget child;
  final String value;
  final BadgeController badgeController = Get.put(BadgeController());

  CustomBadge({
    required this.child,
    required this.value,
    super.key,
  }) {
    badgeController.updateBadgeValue(value);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double badgeSize = screenWidth * 0.05;

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 5,
          top: 5,
          child: Obx(
            () => Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: purpleColor,
              ),
              constraints: BoxConstraints(
                minWidth: badgeSize,
                minHeight: badgeSize,
              ),
              child: Center(
                child: Text(
                  badgeController.badgeValue.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: badgeSize * 0.6,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
