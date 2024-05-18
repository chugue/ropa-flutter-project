import 'dart:convert';

import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:flutter/material.dart';

class CodiItemBrandTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  final CodiItemInsertModel model;

  const CodiItemBrandTabBar({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(
              child:
                  Image.memory(base64Decode('${model.brandList[0].base64}'))),
          Tab(
              child:
                  Image.memory(base64Decode('${model.brandList[1].base64}'))),
          Tab(
              child:
                  Image.memory(base64Decode('${model.brandList[2].base64}'))),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
// Adjust the height as needed
}
