import 'package:final_project_team02/ui/holder/item/components/item_body.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final int itemId;
  final int? codiId;

  const ItemPage({
    required this.itemId,
    required this.codiId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemBody(
        itemId: itemId,
        codiId: codiId,
      ),
    );
  }
}
