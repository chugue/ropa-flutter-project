import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_input.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_radio.dart';
import 'package:flutter/material.dart';

class BuyAddressTabBarView extends StatelessWidget {
  const BuyAddressTabBarView({
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
              BuyAddressTabBarViewRadio(),

              BuyAddressTabBarViewInput(),
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
