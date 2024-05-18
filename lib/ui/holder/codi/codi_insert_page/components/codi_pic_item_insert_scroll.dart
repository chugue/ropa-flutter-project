import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_item_insert.dart';
import 'package:flutter/cupertino.dart';

class CodiPicItemInsertScroll extends StatelessWidget {
  const CodiPicItemInsertScroll({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CodiItemInsert(category: "top"),
          CodiItemInsert(category: "bottom"),
          // ItemInsert(category: "Outer"),
          // ItemInsert(category: "Shoes"),
          // ItemInsert(category: "Acc"),
        ],
      ),
    );
  }
}
