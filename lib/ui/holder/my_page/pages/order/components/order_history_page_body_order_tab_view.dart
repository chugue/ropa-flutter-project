import 'package:final_project_team02/ui/holder/my_page/pages/order/components/order_history_page_body_exchange_return_tab_view.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/components/order_history_page_body_order_tab_view_card.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/order_history_viewmodel.dart';
import 'package:flutter/material.dart';

class OrderHistoryPageBodyOrderTabView extends StatelessWidget {
  final OrderHistoryModel model;

  OrderHistoryPageBodyOrderTabView({
    required this.model,
  });

  final list = ["배송중", "배송완료", "배송전"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OrderHistoryPageBodyOrderTabViewDropBox(
        //   list: ["배송중", "배송완료", "배송전"],
        // ),
        SizedBox(height: 20),
        OrderHistoryPageBodyOrderTabViewCard(
          model: model,
        ),
        SizedBox(height: 30),
        Divider(),
        CustomInquiryButton(),
        SizedBox(height: 20)
      ],
    );
  }
}
