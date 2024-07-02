import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/home_controller/home_category_controller.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/home_controller/home_controller.dart';
import 'package:yumyum_amicta/controllers/pages/customer_controller/home_controller/home_recomendation_controller.dart';
import 'package:yumyum_amicta/models/category_model/home_category_model.dart';
import 'package:yumyum_amicta/models/customer/product.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/customer/home_category_item.dart';
import 'package:yumyum_amicta/ui/widgets/customer/home_rekomendation_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';

class CustomerHomePage extends StatelessWidget {
  CustomerHomePage({super.key});
  final HomeCategoryController categoriesController =
      Get.put(HomeCategoryController());
  final HomeRecomendationController homeRecomendationController =
      Get.put(HomeRecomendationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            buildProfile(context),
            buildSearchBar(context),
            buildBanner(context),
            buildCategory(context),
            buildRecomendation(context)
          ],
        ),
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                'Niken Lismiati',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchBar(
              controller: controller,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/customer-favorite');
            },
            icon: const Icon(
              Icons.favorite_outline,
              size: 25,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBanner(BuildContext context) {
    final List<String> imgList = [
      'assets/img_banner.png',
      'assets/img_banner.png',
      'assets/img_banner.png',
    ];
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: CarouselSlider(
        items: imgList.map((item) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              width: 415,
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.9,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }

  Widget buildCategory(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Kategori',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 100.0,
              child: Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesController.categories.length,
                  itemBuilder: (context, index) {
                    HomeCategoryModel homeCategoryModel =
                        categoriesController.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: HomeCategoryItem(
                        id: homeCategoryModel.encryptedId!,
                        imageUrl: homeCategoryModel.image!,
                        title: homeCategoryModel.name!,
                      ),
                    );
                  },
                );
              })),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Widget buildRecomendation(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'Recomendasi Buat Kamu',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          return GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(10.0),
            itemCount: homeRecomendationController.product.length,
            itemBuilder: (ctx, i) {
              var product = homeRecomendationController.product[i];
              return HomeRecomendationItem(
                id: product.merchant!.encryptedId!,
                menu: product.name!,
                merchant: product.merchant!.name!,
                price: product.price!,
                imageUrl: product.image!,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 29,
              mainAxisSpacing: 29,
            ),
          );
        })
      ],
    );
  }
}
