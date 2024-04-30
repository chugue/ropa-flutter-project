import 'package:final_project_team02/holder/buy/components/buy_page_body_address/buy_main_address_delivery_address_tab_input_address.dart';
import 'package:final_project_team02/holder/buy/components/buy_page_body_address/buy_page_body_address_tab_bar_view_radio.dart';
import 'package:flutter/material.dart';

class BuyPageBodyAddressTabBarView extends StatelessWidget {
  const BuyPageBodyAddressTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              //회원정보 동일, 새로운 배송지 (선택)
              BuyPageBodyAddressTabBarViewRadio(),
              InputAddress(),
              SizedBox(height: 10),
              Divider(color: Colors.black12),
            ],
          ),
        ),
        Container(
          color: Colors.white,
        ),
      ],
    ));
  }
}
