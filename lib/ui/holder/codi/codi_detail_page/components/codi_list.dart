import 'dart:convert';

import 'package:final_project_team02/data/global_data/ootd.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodiList extends StatelessWidget {
  final CodiDetailModel? model;

  const CodiList({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {

    if(model ==null) {
      return Align(child: CircularProgressIndicator());
    }
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // ✅한 행에 두 개의 항목
        mainAxisSpacing:2,

      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            width: double.infinity, // 셀의 전체 너비 사용
            height: double.infinity, // 셀의 전체 높이 사용
            child: Image.memory(
              Base64Decoder()
                  .convert(model!.otherCodiPhotos[index].base64),
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: model!.otherCodiPhotos.length,
      ),
    );
  }
}
