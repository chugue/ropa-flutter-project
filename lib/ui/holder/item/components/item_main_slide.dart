import 'dart:convert';
import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/holder/item/components/item_detail_view.dart';
import 'package:final_project_team02/ui/holder/item/components/item_info.dart';
import 'package:flutter/material.dart';
import 'package:final_project_team02/ui/components/main_app_bar.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemMainSlide extends StatelessWidget {
  const ItemMainSlide({
    super.key,
    required this.model,
  });

  final ItemDetailListModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.mainPhotos.length,
        itemBuilder: (context, index) {
          return Image.memory(
            Base64Decoder()
                .convert(model.mainPhotos[index].mainPhotoBase64),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

