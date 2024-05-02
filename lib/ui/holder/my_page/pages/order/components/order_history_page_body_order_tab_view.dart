import 'package:flutter/material.dart';

import 'order_history_page_body_exchange_return_tab_view.dart';
import 'order_history_page_body_order_tab_view_card.dart';
import 'order_history_page_body_order_tab_view_drop_box.dart';

class OrderHistoryPageBodyOrderTabView extends StatelessWidget {
  String? selectedValue;

  List<String> list = ["배송중", "배송완료", "배송전"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderHistoryPageBodyOrderTabViewDropBox(
          list: ["배송중", "배송완료", "배송전"],
        ),
        SizedBox(height: 20),
        OrderHistoryPageBodyOrderTabViewCard(
          deliveryCharge: "무료",
          deliveryStatus: "배송중",
          itemName: "상의",
          itemOptions: "free",
          itemPrice: 352000, //쉼표 포멧 필요
        ),
        SizedBox(height: 20),
        Divider(),
        CustomInquiryButton(),
        SizedBox(height: 20)
      ],
    );
  }
}
