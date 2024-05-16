import 'package:final_project_team02/ui/holder/my_page/pages/order/order_history_page.dart';
import 'package:flutter/material.dart';

class MyPageOrderInquiry extends StatelessWidget {
  final int orderId;

  const MyPageOrderInquiry({
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OrderHistoryPage(orderId: orderId),
          Container(width: 2, height: 50, color: Colors.white),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "1대1 문의하기",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
