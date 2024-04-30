import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../_core/constants/theme.dart';
import 'order_history_page_body_title.dart';


class OrderHistioryPageBodyTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Text("최근주문내역",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold)),
        Text(" 교환/반품",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
