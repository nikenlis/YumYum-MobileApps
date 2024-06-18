import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class FormFieldController extends GetxController {
  var obsecureText = true.obs;

  void toggleObscureText() {
    obsecureText.value = !obsecureText.value;
  }
}

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final bool iconVisibility;
  final Function(String)? onFieldSubmitted;

  const CustomFormField({
    super.key,
    required this.title,
    this.obsecureText = false,
    this.controller,
    this.isShowTitle = true,
    this.iconVisibility = false,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final FormFieldController formFieldController =
        Get.put(FormFieldController());
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double fieldWidth = screenWidth - 32;

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShowTitle)
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            if (isShowTitle) const SizedBox(height: 8),
            SizedBox(
              width: fieldWidth,
              child: TextFormField(
                obscureText: formFieldController.obsecureText.value,
                controller: controller,
                decoration: InputDecoration(
                  hintText: !isShowTitle ? title : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  contentPadding: EdgeInsets.all(mediaQuery.size.width * 0.05),
                  suffixIcon: iconVisibility
                      ? IconButton(
                          onPressed: () {
                            formFieldController.toggleObscureText();
                          },
                          icon: Icon(
                              formFieldController.obsecureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: greyColor),
                        )
                      : null,
                ),
                onFieldSubmitted: onFieldSubmitted,
              ),
            ),
          ],
        ));
  }
}
