import 'package:final_project_team02/ui/holder/buy/components/buy_body.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  final List<int> itemIds;
  final int? codiId;

  const BuyPage({
    required this.itemIds,
    required this.codiId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuyBody(itemIds: itemIds, codiId: codiId),
    );
  }
}
