import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class MerchantStatusMenuItem extends StatefulWidget {
  final String price;
  final String namaMenu;
  int isActive;
  MerchantStatusMenuItem({super.key, this.isActive = 1, required this.namaMenu, required this.price,});

  @override
  State<MerchantStatusMenuItem> createState() => _MerchantStatusMenuItemState();
}

class _MerchantStatusMenuItemState extends State<MerchantStatusMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.pushNamed(
                        context, '/merchant-edit-menu', arguments: widget.namaMenu);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 109,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(24)),
        child: 
            Row(
              children: [
                Container(
                  width: 77,
                  height: 87,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.indonesia.travel/content/dam/indtravelrevamp/en/trip-ideas/the-ultimate-guide-to-must-try-indonesian-food/thumbnail.jpg"))),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.namaMenu,
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.price,
                        style: greyTextStyle.copyWith(
                            fontSize: 19, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                        value: widget.isActive == 1, //biarin int soalnya dari zuma tipeny int
                        onChanged: (bool value) {
                          setState(() {
                      widget.isActive = value ? 1 : 0;
                    });
                        }),
                  ),
                )
              ],
            ),
      ),
    );
  }
}
