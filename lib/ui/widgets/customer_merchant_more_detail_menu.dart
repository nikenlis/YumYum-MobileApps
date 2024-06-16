import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/form.dart';

class CustomerMerchantMoreDetailMenu extends StatelessWidget {
  final int id;
  bool isActive;
  bool isFavorite;

  CustomerMerchantMoreDetailMenu({
    super.key,
     required this.id,
      this.isActive = true,
      this.isFavorite = false,
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 450,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: lightBackgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset('assets/img_menu_makanan.png',
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16,),
            Text(
              'Title Product 1',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 10,),
             Text(
              'Bakso Urat dengan + 2 ceker',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: regular), overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 13,),
            Text('Rp 10.000', style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),),
            const SizedBox(height: 25,),
             isActive
                ? Row(
                    children: [
                      Expanded(
                        child: CustomFilledButton(
                          title: 'Tambah pesanan',
                          onPressed: () {
                            // Tambahkan aksi untuk tombol "Tambah pesanan" di sini
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          isFavorite = !isFavorite;
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: purpleColor,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: blackColor),
                      ),
                      child: Center(
                        child: Text('Tutup', style: blackTextStyle),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
