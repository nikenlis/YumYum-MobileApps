import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_orders_tab_masuk_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_orders_tab_ready_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_orders_tab_selesai_page.dart';
import 'package:yumyum_amicta/ui/pages/merchant/merchant_orders_tab_proses_page.dart';

class MerchantOrdersPage extends StatefulWidget {
  const MerchantOrdersPage({super.key});

  @override
  State<MerchantOrdersPage> createState() => _MerchantOrdersPageState();
}

class _MerchantOrdersPageState extends State<MerchantOrdersPage> {
  final List<Tab> _tabs = [
    const Tab(
      child: Text("Masuk"),
    ),
    const Tab(
      child: Text("Diproses"),
    ),
    const Tab(
      child: Text("Ready"),
    ),
    const Tab(
      child: Text("Selesai"),
    )
  ];

  final List<Widget> _tabsBody = [
    const MerchantOrdersTabMasukPage(),
    const MerchantOrdersTabProsesPage(),
    const MerchantOrdersTabReadyPage(),
    const MerchantOrdersTabSelesaiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: const Text('Orders'), bottom: TabBar(
          indicatorColor: purpleColor,
          tabs: _tabs,
        ),),
        body: TabBarView(children: _tabsBody),
      ),
    );
  }
}
