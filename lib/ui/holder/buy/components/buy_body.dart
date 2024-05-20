import 'package:final_project_team02/ui/holder/buy/buy_viewmodel.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_adress.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_info_title.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_order.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_order_button.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_page_buy_box_divider.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_pay_ment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyBody extends ConsumerWidget {
  final List<int> itemIds;
  final int codiId;

  const BuyBody({
    required this.itemIds,
    required this.codiId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BuyModel? model = ref.watch(buyProvider);

    if (model == null) {
      return CupertinoActivityIndicator();
    } else {
      return SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            //배송지 주소
            BuyAddress(),
            BuyPageBodyBoxDivider(),

            //주문상품
            BuyOrder(model: model),
            BuyPageBodyBoxDivider(),

            //결제정보
            BuyInfo(model: model),
            BuyPageBodyBoxDivider(),

            //결제수단
            BuyPayMent(),
            BuyPageBodyBoxDivider(),

            //결제 하기
            BuyOrderButton(model: model, text: "결제하기", codiId: codiId)
          ],
        ),
      );
    }
  }
}
