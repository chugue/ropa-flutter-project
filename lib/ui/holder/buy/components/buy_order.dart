import 'package:expandable/expandable.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/buy/buy_viewmodel.dart';
import 'package:flutter/material.dart';

import 'buy_order_item_card.dart';
import 'custom_main_title.dart';

class BuyOrder extends StatelessWidget {
  BuyModel model;

  BuyOrder({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    ExpandableController expController =
        new ExpandableController(initialExpanded: true);

    return ExpandablePanel(
      controller: expController,
      header: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomMainTitle(text: "주문상품"),
      ),
      theme: ExpandableThemeData(
        iconColor: Colors.black,
        iconPadding: EdgeInsets.symmetric(horizontal: 20),
        iconSize: 30,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
      ),
      collapsed: SizedBox(),
      expanded: Column(
        children: [
          ListView.builder(
            itemCount: model.cartInfos.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return BuyOrderItemCard(
                  itemTitle: '${model.cartInfos[index].itemName}',
                  subTitle: 'Black Heavy Brush',
                  options: ' ',
                  //1차 시연에서는 사이즈 없음
                  qty: '수량: 1개',
                  //1차에서 수량은 무조건 1개
                  price: "${formatCurrency(model.cartInfos[index].price)}",
                  photoPath: "${model.cartInfos[index].itemPhoto.photoPath}");
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black12,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("배송비",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold)),
                Text("0 (무료)원",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
