import 'package:final_project_team02/components/bottom_button.dart';
import 'package:final_project_team02/holder/buy/components/buy_info_title.dart';
import 'package:final_project_team02/holder/buy/components/buy_option_title.dart';
import 'package:final_project_team02/holder/buy/components/buy_page_body_address/buy_page_body_address_tab_bar_ciew.dart';
import 'package:final_project_team02/holder/buy/components/buy_page_buy_box_divider.dart';
import 'package:final_project_team02/holder/buy/components/main_order_title.dart';
import 'package:flutter/cupertino.dart';

class BuyPageBody extends StatelessWidget {
  const BuyPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          //배송지 주소
          BuyPageBodyAddress(),
          BuyPageBodyBoxDivider(),

          MainOrderTitle(),
          BuyPageBodyBoxDivider(),

          BuyInfoTitle(),
          BuyPageBodyBoxDivider(),

          BuyOptionTitle(),
          BuyPageBodyBoxDivider(),

          BottomButton(text: "48,700원 결제하기")
        ],
      ),
    );
  }
}
