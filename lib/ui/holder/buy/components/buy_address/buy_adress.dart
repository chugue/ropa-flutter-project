import 'package:expandable/expandable.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_request.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_main_title.dart';
import 'package:flutter/material.dart';

class BuyAddress extends StatelessWidget {
  const BuyAddress({
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
          BuyAddressTab(),
          BuyMainAddressRequest(),
        ],
      ),
    );
  }
}
