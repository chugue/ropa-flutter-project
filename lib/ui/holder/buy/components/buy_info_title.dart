import 'package:expandable/expandable.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/buy/buy_viewmodel.dart';
import 'package:flutter/material.dart';

import 'buy_info_row.dart';
import 'custom_main_title.dart';

class BuyInfo extends StatelessWidget {
  BuyModel model;

  BuyInfo({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    String orderAmount = formatCurrency(model!.orderInfo.orderAmount);
    String purchaseAmount = formatCurrency(model.orderInfo.purchaseAmount);

    ExpandableController expController =
        new ExpandableController(initialExpanded: true);

    return ExpandablePanel(
      controller: expController,
      header: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomMainTitle(text: "결제정보"),
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
          Container(height: 1, color: Colors.black12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                BuyInfoRow(
                    name: "주문상품",
                    price: "${orderAmount}",
                    colors: Colors.black),
                BuyInfoRow(name: "배송비", price: "+0", colors: Colors.black),
                BuyInfoRow(name: "할인/부가결제", price: "-0", colors: Colors.red),
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xFFF4F7FF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "최종 결제 금액",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${purchaseAmount}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
