import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_adress.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_info_title.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_order.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_order_button.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_page_buy_box_divider.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_pay_ment.dart';
import 'package:flutter/cupertino.dart';

class BuyBody extends StatelessWidget {
  final List<int> itemIds;

  BuyBody({required this.itemIds});

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

          //주문상품
          BuyOrder(),
          BuyPageBodyBoxDivider(),

          //결제정보
          BuyInfo(),
          BuyPageBodyBoxDivider(),

          //결제수단
          BuyPayMent(),
          BuyPageBodyBoxDivider(),

          //결제 하기
          BuyOrderButton(text: "48,700원 결제하기")
        ],
      ),
    );
  }
}
