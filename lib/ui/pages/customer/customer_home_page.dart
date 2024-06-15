import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumyum_amicta/models/customer/category.dart';
import 'package:yumyum_amicta/models/customer/product.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/home_category_item.dart';
import 'package:yumyum_amicta/ui/widgets/home_rekomendation_item.dart';
import 'package:yumyum_amicta/ui/widgets/searchbar.dart';

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

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
          Expanded(child: CustomSearchBar(controller: controller,)),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.favorite_outline,
            size: 25,
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 415,
                  ));
            }).toList(),
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.9,
              enableInfiniteScroll: true,
            )));
  }

  Widget buildCategory(BuildContext context) {
    final List<Category> loadedCategories = List.generate(7, (index) {
      return Category(
        title: "menu ${index + 1}",
        imageUrl: 'assets/img_category_makanan.png',
      );
    });

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
              'Category',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: HomeCategoryItem(imageUrl: loadedCategories[index].imageUrl, title: loadedCategories[index].title),
                );
              },
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Widget buildRecomendation(BuildContext context) {
    final List<Product> loadedProducts = List.generate(7, (index) {
      return Product(
          id: index,
          categoryId: index + 5,
          merchantId: index + 4,
          name: "Product ${index + 1}",
          imageUrl: 'assets/img_menu_makanan.png',
          description: 'Ini adalah deskripsi produk ${index + 1}',
          price: 10 + Random().nextInt(100) * 1000,
          estimate: '5 menit');
    });
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
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          itemCount: 7,
          itemBuilder: (ctx, i) => HomeRecomendationItem(
              menu: loadedProducts[i].name,
              merchant: 'Warung Bu rini',
              price: 'Rp ${loadedProducts[i].price}',
              imageUrl: loadedProducts[i].imageUrl),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 29,
            mainAxisSpacing: 29,
          ),
        )
      ],
    );
  }
}
