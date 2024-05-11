import 'package:flutter/material.dart';

import 'components/item_body.dart';

class ItemPage extends StatelessWidget {
  final int itemId;

  const ItemPage({
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // TODO: Empty AppBar
      body: ItemBody(itemId: itemId),
    );
  }
}
