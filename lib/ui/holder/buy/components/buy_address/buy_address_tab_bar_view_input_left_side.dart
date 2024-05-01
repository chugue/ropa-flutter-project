import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_input_small_title.dart';
import 'package:flutter/cupertino.dart';

class BuyAddressTabBarViewInputLeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButAddressTabBarViewInputSmallTitle(text: "받는사람"),
            SizedBox(height: 38),
            ButAddressTabBarViewInputSmallTitle(text: "주소"),
            SizedBox(height: 140),
            ButAddressTabBarViewInputSmallTitle(text: "휴대전화"),
            SizedBox(height: 38),
            ButAddressTabBarViewInputSmallTitle(text: "이메일"),
          ],
        ),
      ),
    );
  }
}
