import 'dart:convert';

import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../item/item_page.dart';

class ItemScroll extends StatelessWidget {
  final HomeModel? model;

  ItemScroll({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, CodiIndex) {
          return SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model!.itemsPhotos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemPage(
                                    itemId: model!.itemsPhotos[index].itemsId,
                                  )),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Container(
                            width: double.infinity, // 셀의 전체 너비 사용
                            height: double.infinity, // 셀의 전체 높이 사용
                            child: Image.memory(
                              Base64Decoder().convert(model!.itemsPhotos[index].base64),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
