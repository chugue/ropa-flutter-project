import 'package:final_project_team02/ui/holder/buy/components/buy_body.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  final List<int> itemIds;

  BuyPage({required this.itemIds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuyBody(itemIds: itemIds),
    );
  }
}
