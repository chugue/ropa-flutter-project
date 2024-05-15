import 'dart:convert';

import 'package:final_project_team02/ui/holder/item/components/item_body.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/main_app_bar.dart';
import 'components/item_detail_view.dart';

class ItemPage extends StatelessWidget {
  final int itemId;

  const ItemPage({
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ItemBody(itemId: itemId),
    );
  }
}

