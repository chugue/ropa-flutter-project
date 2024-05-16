import 'dart:convert';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiItemBrandTabView extends ConsumerWidget  {
  final CodiItemInsertModel model;
  final int selectedIndex;

  const CodiItemBrandTabView({
    required this.model,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 1,
      ),
      itemCount: model.brandList[selectedIndex].itemInfo.length,
      itemBuilder: (context, index) {
        final item = model.brandList[selectedIndex].itemInfo[index];
        return GestureDetector(
          onTap: () { ref.read(codiInsertProvider.notifier).pickAndAddImageFromBase64(item.base64);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.memory(
                      base64Decode(item.base64),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  item.itemName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
