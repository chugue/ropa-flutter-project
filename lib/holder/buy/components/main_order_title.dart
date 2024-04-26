import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'buy_main_title.dart';
import 'ordering_items.dart';

class MainOrderTitle extends StatelessWidget {
  const MainOrderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.all(20),
        child: BuyMainTitle(text: "주문상품"),
      ),
      theme: ExpandableThemeData(
        iconColor: Colors.black,
        iconPadding: EdgeInsets.symmetric(horizontal: 20),
        iconSize: 30,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
      ),
      collapsed: SizedBox(),
      expanded: ListView(
        shrinkWrap: true,
        children: [
          OrderingItems(
              itemTitle: 'VL8814 웰라이트 와이드데님',
              subTitle: 'Black Heavy Brush',
              options: '[옵션: L (32)]',
              qty: '수량: 1개',
              price: "48,700원",
              photoPath: "assets/images/ootd/ootd03.webp"),
          OrderingItems(
              itemTitle: 'VL8814 웰라이트 와이드데님',
              subTitle: 'Black Heavy Brush',
              options: '[옵션: L (32)]',
              qty: '수량: 1개',
              price: "48,700원",
              photoPath: "assets/images/ootd/ootd01.jpg"),
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
