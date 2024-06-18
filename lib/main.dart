import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/app.dart';

import 'ui/widgets/home_rekomendation_item.dart';

void main() {
  Get.put(HomeRecomendationItemController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
