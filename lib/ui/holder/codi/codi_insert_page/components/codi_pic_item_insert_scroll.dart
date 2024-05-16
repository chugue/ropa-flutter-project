import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_item_insert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiPicItemInsertScroll extends ConsumerWidget {
  const CodiPicItemInsertScroll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // ItemInsert(category: "Outer"),
          CodiItemInsert(category: "top"),
          CodiItemInsert(category: "bottom"),
          // ItemInsert(category: "Shoes"),
          // ItemInsert(category: "Acc"),
        ],
      ),
    );
  }
}



