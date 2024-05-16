import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/brand.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/item_info.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiItemInsertModel {
  final List<Brand> brandList;
  final String comment;
  final String photoBase64;
  final List<ItemInfo> selectedItems;

  const CodiItemInsertModel({
    required this.brandList,
    this.comment = '',
    this.photoBase64 = '',
    this.selectedItems = const [],
  });

  CodiItemInsertModel copyWith({
    List<Brand>? brandList,
    String? comment,
    String? photoBase64,
    List<ItemInfo>? selectedItems,
  }) {
    return CodiItemInsertModel(
      brandList: brandList ?? this.brandList,
      comment: comment ?? this.comment,
      photoBase64: photoBase64 ?? this.photoBase64,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }
}

class CodiItemInsertViewModel extends StateNotifier<CodiItemInsertModel?> {
  final mContext = navigatorKey.currentContext;

  CodiItemInsertViewModel(super.state);

  Future<void> callItemInsert(String category) async {
    ResponseDTO responseDTO = await CodiRepo().callGetItemInsert(category);

    // 카테고리를 검색해서 받은 결과
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
      state = state!.copyWith(comment: comment);
    }
  }

  void addItem(ItemInfo item) {
    if (state != null) {
      state = state!.copyWith(
        selectedItems: [...state!.selectedItems, item],
      );
    }
  }

  void removeItem(ItemInfo item) {
    if (state != null) {
      state = state!.copyWith(
        selectedItems: state!.selectedItems.where((i) => i != item).toList(),
      );
    }
  }
}

final codiItemInsertProvider = StateNotifierProvider.family<
    CodiItemInsertViewModel, CodiItemInsertModel?, String?>((ref, category) {
  return CodiItemInsertViewModel(null)..callItemInsert(category!);
});
