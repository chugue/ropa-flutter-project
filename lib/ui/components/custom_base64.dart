import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../_core/constants/http.dart';

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
      child: CachedNetworkImage(
        imageUrl: '$baseURL${modelList[index].photoPath}',
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
