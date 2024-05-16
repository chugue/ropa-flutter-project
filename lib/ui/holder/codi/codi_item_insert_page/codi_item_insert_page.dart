import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_insert_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemInsertPage extends StatelessWidget {
  const ItemInsertPage({super.key, required this.category});

  final String? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemInsertBody(category: category),
    );
  }
}
