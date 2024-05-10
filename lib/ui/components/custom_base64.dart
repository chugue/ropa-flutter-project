import 'dart:convert';

import 'package:flutter/material.dart';

class CustomBase64 extends StatelessWidget {
  final List<dynamic> modelList;
  final int index;

  const CustomBase64({
    required this.modelList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 셀의 전체 너비 사용
      height: double.infinity, // 셀의 전체 높이 사용
      child: Image.memory(
        Base64Decoder().convert(modelList[index].base64),
        fit: BoxFit.cover,
      ),
    );
  }
}
