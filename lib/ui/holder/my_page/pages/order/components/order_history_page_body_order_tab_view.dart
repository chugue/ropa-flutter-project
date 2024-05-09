import 'package:final_project_team02/ui/holder/my_page/pages/order/components/order_history_page_body_exchange_return_tab_view.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/components/order_history_page_body_order_tab_view_card.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/components/order_history_page_body_order_tab_view_drop_box.dart';
import 'package:flutter/material.dart';

class OrderHistoryPageBodyOrderTabView extends StatelessWidget {
  final list = ["배송중", "배송완료", "배송전"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderHistoryPageBodyOrderTabViewDropBox(
          list: ["배송중", "배송완료", "배송전"],
        ),
        SizedBox(height: 20),
        OrderHistoryPageBodyOrderTabViewCard(
          orderDate: "2024.05.08",
          deliveryCharge: "무료",
          deliveryStatus: "배송중",
          itemBrand: "Clo Market",
          itemName: "U - neck t -shirt 유넥 워싱 티셔츠",
          itemOptions: "free",
          itemQty: 1,
          itemPrice: 19500,
        ),
        SizedBox(height: 20),
        Divider(),
        CustomInquiryButton(),
        SizedBox(height: 20)
      ],
    );
  }
}
