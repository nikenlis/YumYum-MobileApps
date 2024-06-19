import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';

class ButtonController extends GetxController {
  var isLoading = false.obs;

  void setLoading(bool loading) {
    isLoading.value = loading;
  }
}

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.width,
    this.height = 50,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = width ?? screenWidth * 0.8;
    final ButtonController buttonController = Get.put(ButtonController());

    return SizedBox(
      width: buttonWidth,
      height: height,
      child: Obx(() => TextButton(
            onPressed: buttonController.isLoading.value ? null : onPressed,
            style: TextButton.styleFrom(
              backgroundColor: purpleColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56),
              ),
            ),
            child: buttonController.isLoading.value
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    title,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
          )),
    );
  }
}


class CustomOutlineButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const CustomOutlineButton({
    super.key,
    required this.title,
    this.width,
    this.height = 50,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = width ?? screenWidth * 0.8;
    final ButtonController buttonController = Get.put(ButtonController());

    return SizedBox(
      width: buttonWidth,
      height: height,
      child: Obx(() => OutlinedButton(
            onPressed: buttonController.isLoading.value ? null : onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: purpleColor, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56),
              ),
            ),
            child: buttonController.isLoading.value
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    title,
                    style: purpleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
          )),
    );
  }
}


class CustomTextButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = width ?? screenWidth * 0.8;
    final buttonHeight = height ?? 24.0;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
