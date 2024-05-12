import 'dart:convert';

import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  final ItemDetailListModel? model;

  const ItemInfo({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 600,
          height: mediaQuery,
          child: ListView.builder(
            itemCount: model!.mainPhotos.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Image.memory(
                Base64Decoder()
                    .convert(model!.mainPhotos[index].mainPhotoBase64),
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "[${model!.item.brandName}]",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "${model!.item.brandName}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0) /* 패딩 왼위오밑 */,
              child: Row(
                children: [
                  Text(
                    "${model!.item.discountPrice}",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${model!.item.price}원",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        // _itemName(model!.item.brandName, model!.item.brandName),
      ],
    );
  }

  Padding _itemBrand() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: double.infinity, // 셀의 전체 너비 사용
              height: double.infinity, // 셀의 전체 높이 사용
              // child: Image.memory(
              //   Base64Decoder().convert(model!.mainPhotos[index].mainPhotoBase64),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
