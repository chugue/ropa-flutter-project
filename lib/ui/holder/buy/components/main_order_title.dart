import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'buy_main_title.dart';
import 'main_order_ordering_items.dart';

class BuyOrderTitle extends StatelessWidget {
  const BuyOrderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ExpandableController expController =
        new ExpandableController(initialExpanded: true);

    return ExpandablePanel(
      controller: expController,
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
      expanded: Column(
        children: [
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return OrderingItems(
                  itemTitle: 'VL8814 웰라이트 와이드데님',
                  subTitle: 'Black Heavy Brush',
                  options: '[옵션: L (32)]',
                  qty: '수량: 1개',
                  price: "48,700원",
                  photoPath: "assets/images/ootd/ootd03.webp");
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
