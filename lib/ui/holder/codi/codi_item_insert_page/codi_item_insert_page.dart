import 'package:final_project_team02/data/global_data/brand.dart';
import 'package:flutter/material.dart';

class ItemInsertPage extends StatelessWidget {
  const ItemInsertPage({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemInsertBody(category: category),
    );
  }
}
