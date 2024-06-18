import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class ProfilePersonalDetailController extends GetxController {
  var title = ''.obs;
  var icon = Icons.person.obs;

  void updateTitle(String newTitle) {
    title.value = newTitle;
  }

  void updateIcon(IconData newIcon) {
    icon.value = newIcon;
  }
}

class ProfilePersonalDetailItem extends StatelessWidget {
  final ProfilePersonalDetailController controller =
      Get.put(ProfilePersonalDetailController());

  final String title;
  final IconData icon;

  ProfilePersonalDetailItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double itemWidth = mediaQuery.size.width - 34;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      width: itemWidth,
      height: 59,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Obx(() => Icon(controller.icon.value)),
          const SizedBox(width: 19),
          Expanded(
            child: Obx(() => Text(
                  controller.title.value,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
          ),
        ],
      ),
    );
  }
}
