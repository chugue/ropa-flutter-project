import 'package:final_project_team02/ui/components/bottom_button.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_adress.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_info_title.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_option_title.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_page_buy_box_divider.dart';
import 'package:final_project_team02/ui/holder/buy/components/main_order_title.dart';
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
          BuyAddress(),
          BuyPageBodyBoxDivider(),

          BuyOrderTitle(),
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
