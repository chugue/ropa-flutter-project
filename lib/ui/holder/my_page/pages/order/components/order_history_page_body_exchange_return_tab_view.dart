import 'package:flutter/material.dart';

import 'order_history_page_body_exchange_return_tab_view_card.dart';
import 'order_history_page_body_exchange_return_tab_view_drop_box.dart';

class OrderHistoryPageBodyExchangeReturnTabView extends StatefulWidget {
  @override
  State<OrderHistoryPageBodyExchangeReturnTabView> createState() =>
      _OrderHistoryPageBodyExchangeReturnTabViewState();
}

class _OrderHistoryPageBodyExchangeReturnTabViewState
    extends State<OrderHistoryPageBodyExchangeReturnTabView> {
  List<String> list = ["교환", "환불"];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderHistoryPageBodyExchangeReturnTabViewDropBox(
          list: ["교환신청", "반품신청"],
        ),
        SizedBox(height: 20),
        OrderHistoryPageBodyExchangeReturnTabViewCard(
          applyDate: "2024.05.06",
          deliveryCharge: "무료",
          whatTodo: "교환",
          deliveryStatus: "진행 중",
          itemName: "리버시블 플리스 가디건",
          itemBrand: "그라미치",
          itemOptions: "free",
          itemPrice: 352000,
          itemQty: '1',
        ),
        SizedBox(height: 20),
        Divider(),
        CustomInquiryButton(),
        SizedBox(height: 20)
      ],
    );
  }
}

class CustomInquiryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text("1:1 문의 하기",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ),
    );
  }
}
