import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/bottons.dart';
import 'package:yumyum_amicta/ui/widgets/form.dart';

class MerchantAddMenuPage extends StatelessWidget {
  const MerchantAddMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildAddImage(context),
          buildDataMenu(context),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }

  Widget buildAddImage(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    const SizedBox(
      height: 10,
    ),
    Text(
      'Add item',
      style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
    ),
    const SizedBox(
      height: 20,
    ),
    Container(
          width: 121,
          height: 121,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: greyColor,
              image: const DecorationImage(
                  image: AssetImage('assets/ic_upload.png'))),
        ),
    
          ],
        );
  }

  Widget buildDataMenu(BuildContext context) {
  final namaMenuController = TextEditingController(text: '');
  final hargaController = TextEditingController(text: '');
  final deskripsiProductController = TextEditingController(text: '');
  final estimasiController = TextEditingController(text: '');
  final kategoriController = TextEditingController(text: '');
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFormField(title: 'Nama Menu', controller: namaMenuController,),
          const SizedBox(height: 15,),
          CustomFormField(title: 'Harga', controller: hargaController,),
          const SizedBox(height: 15,),
          CustomFormField(title: 'Estimasi Waktu', controller: estimasiController,),
          const SizedBox(height: 15,),
          CustomFormField(title: 'Kategori', controller: kategoriController,),
          const SizedBox(height: 15,),
         Text(
              'Deskripsi',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              controller: deskripsiProductController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14)
                ),
              ),
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          const SizedBox(height: 64,),

          const CustomFilledButton(title: 'Tambah', width: double.infinity,)
        ],
      ),
    );
  }
}
