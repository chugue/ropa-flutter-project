import 'dart:convert';

import 'package:final_project_team02/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class CodiInsertModel {
  final List<XFile> images;
  final String prevImg;

  final String? fileName; // 파일이름
  final String? fileExtension; // 확장자
  final bool? isMainPhoto;

  final int? topItemId;
  final int? topBrandId;
  final String? topImageBase64;
  final int? topImageId;
  final String? topItemName;

  final int? bottomItemId;
  final int? bottomBrandId;
  final String? bottomImageBase64;
  final int? bottomImageId;
  final String? bottomItemName;

  final String comment;

  const CodiInsertModel({
    this.comment = '',
    required this.images,
    required this.prevImg,
    this.fileName,
    this.fileExtension,
    this.isMainPhoto,
    this.topItemId,
    this.topBrandId,
    this.topImageBase64,
    this.topImageId,
    this.topItemName,
    this.bottomItemId,
    this.bottomBrandId,
    this.bottomImageBase64,
    this.bottomImageId,
    this.bottomItemName,
  });

  CodiInsertModel copyWith({
    List<XFile>? images,
    String? prevImg,
    String? fileName,
    String? fileExtension,
    bool? isMainPhoto,
    int? topItemId,
    int? topBrandId,
    String? topImageBase64,
    int? topImageId,
    String? topItemName,
    int? bottomItemId,
    int? bottomBrandId,
    String? bottomImageBase64,
    int? bottomImageId,
    String? comment,
    String? bottomItemName,
  }) {
    return CodiInsertModel(
      comment: comment ?? this.comment,
      images: images ?? this.images,
      prevImg: prevImg ?? this.prevImg,
      fileName: fileName ?? this.fileName,
      fileExtension: fileExtension ?? this.fileExtension,
      isMainPhoto: isMainPhoto ?? this.isMainPhoto,
      topItemId: topItemId ?? this.topItemId,
      topBrandId: topBrandId ?? this.topBrandId,
      topImageBase64: topImageBase64 ?? this.topImageBase64,
      topImageId: topImageId ?? this.topImageId,
      topItemName: topItemName ?? this.topItemName,
      bottomItemId: bottomItemId ?? this.bottomItemId,
      bottomBrandId: bottomBrandId ?? this.bottomBrandId,
      bottomImageBase64: bottomImageBase64 ?? this.bottomImageBase64,
      bottomImageId: bottomImageId ?? this.bottomImageId,
      bottomItemName: bottomItemName ?? this.bottomItemName,
    );
  }
}

class CodiInsertViewModel extends StateNotifier<CodiInsertModel> {
  final ImagePicker picker = ImagePicker();
  final cacheManager = DefaultCacheManager();
  final mContext = navigatorKey.currentContext;

  CodiInsertViewModel()
      : super(CodiInsertModel(
          prevImg: '',
          images: [],
          isMainPhoto: false,
          topImageBase64: null,
          bottomImageBase64: null,
        ));

  void updateComment(String comment) {
    if (state != null) {
      state = state!.copyWith(comment: comment);
    }
  }

  Future<void> pickAndAddImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String base64String = await convertToBase64(image);

      // 파일 경로에서 파일 이름과 확장자 추출
      String fileName = path.basename(image.path);
      String fileExtension = path.extension(image.path);

      await cacheManager.putFile(
        image.path,
        await image.readAsBytes(),
        fileExtension: fileExtension,
      );

      // isMainPhoto 설정
      bool isMainPhoto = state.images.isEmpty;

      state = state.copyWith(
        images: [...state.images, image],
        prevImg: base64String,
        fileName: fileName,
        fileExtension: fileExtension,
        isMainPhoto: isMainPhoto,
      );
    }
  }

  Future<void> pickAndAddImageFromBase64(String itemBase64, String itemName,
      int itemId, int brandId, String category) async {
    if (category == 'top') {
      state = state.copyWith(
        topBrandId: brandId,
        topItemId: itemId,
        topImageBase64: itemBase64,
        topItemName: itemName,
        topImageId: itemId,
      );
      Navigator.pop(navigatorKey.currentContext!);
    } else if (category == 'bottom') {
      state = state.copyWith(
        bottomBrandId: brandId,
        bottomItemId: itemId,
        bottomImageBase64: itemBase64,
        bottomItemName: itemName,
        bottomImageId: itemId,
      );
      Navigator.pop(navigatorKey.currentContext!);
    }
  }

  Future<String> convertToBase64(XFile image) async {
    Uint8List imageBytes = await image.readAsBytes();
    return compute(base64Encode, imageBytes);
  }

  void setMainImg(String pushImages) {
    state = state.copyWith(prevImg: pushImages);
  }

  void removeImage(int index) {
    List<XFile> updatedImages = List.from(state.images)..removeAt(index);
    state = state.copyWith(images: updatedImages);
  }
}

final codiInsertProvider =
    StateNotifierProvider<CodiInsertViewModel, CodiInsertModel>(
  (ref) => CodiInsertViewModel(),
);
