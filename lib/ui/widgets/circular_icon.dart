import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:get/get.dart';

class IconController extends GetxController {
  var iconClicked = false.obs;

  void toggleIcon() {
    iconClicked.value = !iconClicked.value;
  }
}

class CustomCircularIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const CustomCircularIcon({
    required this.icon,
    this.size = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    double adjustedSize = screenSize * 0.05;
    final IconController iconController = Get.put(IconController());

    return Obx(() => CircleAvatar(
          radius: adjustedSize,
          backgroundColor:
              iconController.iconClicked.value ? Colors.red : purpleColor,
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                iconController.toggleIcon();
              },
              splashColor: greyColor,
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: whiteColor,
                  size: adjustedSize,
                ),
              ),
            ),
          ),
        ));
  }
}
