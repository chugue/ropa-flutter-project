import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_item_insert.dart';
import 'package:flutter/cupertino.dart';

class ItemInsertScroll extends StatelessWidget {
  const ItemInsertScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemInsert(category: "Outer"),
          ItemInsert(category: "Top"),
          ItemInsert(category: "Bottom"),
          ItemInsert(category: "Shoes"),
          ItemInsert(category: "Acc"),
        ],
      ),
    );
  }
}
