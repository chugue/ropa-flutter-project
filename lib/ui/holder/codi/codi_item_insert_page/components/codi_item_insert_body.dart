import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_insert_brand_scroll.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/components/codi_item_select_scroll.dart';
import 'package:flutter/material.dart';

class ItemInsertBody extends StatelessWidget {
  const ItemInsertBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BrandScroll(),
        ItemSelectScroll(screenWidth: screenWidth),
      ],
    );
  }
}
