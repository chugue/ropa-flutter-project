import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_input_left_side.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_input_right_side.dart';
import 'package:flutter/material.dart';

class BuyAddressTabBarViewInput extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            BuyAddressTabBarViewInputLeftSide(),
            BuyAddressTabBarViewInputRightSide(formkey: _formkey),
          ],
        ),
      ),
    );
  }
}
