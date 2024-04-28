import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'buy_main_address_address_tab.dart';
import 'buy_main_title.dart';
import 'delivery_request.dart';

class BuyMainAddress extends StatelessWidget {
  const BuyMainAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.all(20),
        child: BuyMainTitle(text: "배송지"),
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
          BuyMainAddressAddressTab(),
          BuyMainAddressDelieveryRequest(),
        ],
      ),
    );
  }
}
