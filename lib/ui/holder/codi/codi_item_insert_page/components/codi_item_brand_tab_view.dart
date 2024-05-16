import 'dart:convert';

import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:flutter/material.dart';

class CodiItemBrandTabView extends StatelessWidget {
  final CodiItemInsertModel model;
  final int selectedIndex;

  const CodiItemBrandTabView({
    required this.model,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
      ),
      itemCount: model.brandList[selectedIndex].itemInfo.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 4,
                      child: ClipRRect(
                        child: Image.memory(
                          const Base64Decoder().convert(model
                              .brandList[selectedIndex].itemInfo[index].base64),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            model.brandList[selectedIndex].itemInfo[index]
                                .itemName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        //numberFormat 사용하면되
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
