import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/widgets/merchant/merchant_status_menu_item.dart';

class MerchantStatusMenuPage extends StatefulWidget {
  int isOpen;
  int isActive;
  MerchantStatusMenuPage({super.key, this.isOpen = 1, this.isActive = 0});

  @override
  State<MerchantStatusMenuPage> createState() => _MerchantStatusMenuPageState();
}

class _MerchantStatusMenuPageState extends State<MerchantStatusMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(
                        context, '/merchant-add-menu');
          }, icon: const Icon(Icons.add)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        children: [
          buildTop(context),
          buildBody(context)
        ],
      ),
    );
  }

  Widget buildTop(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 24,),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://yumyum.beliaplikasi.shop/storage/merchant/default-merchant.png"))),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Bakso Tennis Pak Anton',
                  style: blackTextStyle.copyWith(
                      fontSize: 15, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Transform.scale(
            scale: 0.5,
            child: LiteRollingSwitch(
              width: 120,
              value: widget.isOpen == 1,
              textOn: 'Open',
              textOff: 'Closed',
              textOnColor: whiteColor,
              textOffColor: blackColor,
              colorOn: purpleColor,
              colorOff: greyColor,
              iconOn: Icons.done,
              iconOff: Icons.alarm_off,
              textSize: 15,
              onChanged: (bool value) {
                setState(() {
                      widget.isOpen = value ? 1 : 0;
                    });
              }, 
              onTap: (){}, // tiga kosong ini biarin aja ka, bawaan packagenya
              onDoubleTap: (){},
              onSwipe: (){},
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: MerchantStatusMenuItem(price: 'Rp 24.000', namaMenu: 'Bakso Tennis Pak Anton',)
                  );
                }));
  }
}
