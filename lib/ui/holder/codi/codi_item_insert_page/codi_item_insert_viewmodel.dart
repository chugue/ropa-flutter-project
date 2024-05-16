import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/brand.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiItemInsertModel {
  final List<Brand> brandList;
  final String comment;

  const CodiItemInsertModel({
    required this.brandList,
    this.comment = '',
  });

  CodiItemInsertModel copyWith({
    List<Brand>? brandList,
    String? comment,
  }) {
    return CodiItemInsertModel(
      brandList: brandList ?? this.brandList,
      comment: comment ?? this.comment,
    );
  }
}

class CodiItemInsertViewModel extends StateNotifier<CodiItemInsertModel?> {
  final mContext = navigatorKey.currentContext;

  CodiItemInsertViewModel(super.state);

  Future<void> callItemInsert(String category) async {
    ResponseDTO responseDTO = await CodiRepo().callItemInsert(category);
    if (responseDTO.success) {
      state = responseDTO.response;

      Navigator.push(
        mContext!,
        MaterialPageRoute(
          builder: (context) => ItemInsertPage(category: category),
        ),
      );
    }
  }

  void updateComment(String comment) {
    if (state != null) {
      state =
          CodiItemInsertModel(brandList: state!.brandList, comment: comment);
    }
  }
//
// Future<void> notifyinit() async {
//   ResponseDTO responseDTO = await CodiRepo().callItemInsert();
//
//   if (responseDTO.success) {
//     state = responseDTO.response;
//   }
// }
}

final codiItemInsertProvider = StateNotifierProvider.family<
    CodiItemInsertViewModel, CodiItemInsertModel?, String>((ref, category) {
  return CodiItemInsertViewModel(null)..callItemInsert(category);
});
