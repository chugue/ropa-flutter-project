import 'dart:convert';

import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiMainScroll extends ConsumerWidget {
  final CodiDetailModel? model;

  const CodiMainScroll({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, codiIndex) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: model!.mainPhotos.length,
              itemBuilder: (context, index) {
                // 각 코디의 이미지 리스트에 대한 페이지 뷰 빌드
                return Container(
                  width: double.infinity, // 셀의 전체 너비 사용
                  height: double.infinity, // 셀의 전체 높이 사용
                  child: Image.memory(
                    Base64Decoder()
                        .convert(model!.mainPhotos[index].base64),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
