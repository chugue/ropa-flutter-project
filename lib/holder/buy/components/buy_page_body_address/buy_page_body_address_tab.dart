import 'package:final_project_team02/holder/buy/components/buy_page_body_address/buy_page_body_address_tab_bar.dart';
import 'package:final_project_team02/holder/buy/components/buy_page_body_address/buy_page_body_address_tab_bar_view.dart';
import 'package:flutter/material.dart';

class BuyPageBodyAddressTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 480,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            BuyPageBodyAddressTabBar(),
            BuyPageBodyAddressTabBarView(),
          ],
        ),
      ),
    );
  }
}
