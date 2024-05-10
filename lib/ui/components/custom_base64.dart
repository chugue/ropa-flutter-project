import 'dart:convert';

import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class CustomBase64 extends StatelessWidget {
  final HomeModel? model;
  final int index;

  const CustomBase64({
    this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 셀의 전체 너비 사용
      height: double.infinity, // 셀의 전체 높이 사용
      child: Image.memory(
        Base64Decoder().convert(model!.codiPhotos[index].base64),
        fit: BoxFit.cover,
      ),
    );
  }
}
