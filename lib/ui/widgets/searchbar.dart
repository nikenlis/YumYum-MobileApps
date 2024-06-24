import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class SearchController extends GetxController {
  var searchText = ''.obs;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(() {
      searchText.value = textEditingController.text;
    });
  }

  void clearSearch() {
    textEditingController.clear();
  }
}

class CustomSearchBar extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());

  CustomSearchBar({super.key, required TextEditingController controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: Obx(
        () => TextFormField(
          controller: searchController.textEditingController,
          onChanged: (value) {
            searchController.searchText.value = value;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: greyColor),
            ),
            hintText: "What are you craving?",
            prefixIcon: const Icon(Icons.search_outlined),
            prefixIconColor: greyColor,
            suffixIcon: searchController.searchText.value.isNotEmpty
                ? IconButton(
                    onPressed: searchController.clearSearch,
                    icon: const Icon(
                      Icons.clear_outlined,
                      size: 20,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }
}
