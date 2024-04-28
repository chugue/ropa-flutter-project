import 'package:final_project_team02/holder/buy/components/bottom_control_with_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/buy_box_divider.dart';
import 'components/buy_info_title.dart';
import 'components/buy_main_address.dart';
import 'components/buy_option_title.dart';
import 'components/main_order_title.dart';

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(CupertinoIcons.chevron_left),
        toolbarHeight: 45,
      ),
      body: ListView(
        children: [
          BuyMainAddress(),
          BuyBoxDivider(),
          MainOrderTitle(),
          BuyBoxDivider(),
          BuyInfoTitle(),
          BuyBoxDivider(),
          BuyOptionTitle(),
          BuyBoxDivider(),
        ],
      ),
      bottomNavigationBar: BottomControlWithButton(text: "48,700원 결제하기"),
    );
  }
}
