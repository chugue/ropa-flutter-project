import 'package:flutter/material.dart';

class OrderHistioryPageBodyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Text("최근주문내역",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        // Text(" 교환/반품",
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
