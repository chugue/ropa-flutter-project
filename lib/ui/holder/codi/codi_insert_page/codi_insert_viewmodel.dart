import 'dart:convert';

import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/codi_list.dart';
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
  final String? topPhotoPath;
  final int? topImageId;
  final String? topItemName;

  final int? bottomItemId;
  final int? bottomBrandId;
  final String? bottomPhotoPath;
  final int? bottomImageId;
  final String? bottomItemName;

  final String comment;

  const CodiInsertModel({
    required this.images,
    required this.prevImg,
    this.fileName,
    this.fileExtension,
    this.isMainPhoto,
    this.topItemId,
    this.topBrandId,
    this.topPhotoPath,
    this.topImageId,
    this.topItemName,
    this.bottomItemId,
    this.bottomBrandId,
    this.bottomPhotoPath,
    this.bottomImageId,
    this.bottomItemName,
    required this.comment,
  });

  CodiInsertModel copyWith({
    List<XFile>? images,
    String? prevImg,
    String? fileName,
    String? fileExtension,
    bool? isMainPhoto,
    int? topItemId,
    int? topBrandId,
    String? topPhotoPath,
    int? topImageId,
    String? topItemName,
    int? bottomItemId,
    int? bottomBrandId,
    String? bottomPhotoPath,
    int? bottomImageId,
    String? bottomItemName,
    String? comment,
  }) {
    return CodiInsertModel(
      images: images ?? this.images,
      prevImg: prevImg ?? this.prevImg,
      fileName: fileName ?? this.fileName,
      fileExtension: fileExtension ?? this.fileExtension,
      isMainPhoto: isMainPhoto ?? this.isMainPhoto,
      topItemId: topItemId ?? this.topItemId,
      topBrandId: topBrandId ?? this.topBrandId,
      topPhotoPath: topPhotoPath ?? this.topPhotoPath,
      topImageId: topImageId ?? this.topImageId,
      topItemName: topItemName ?? this.topItemName,
      bottomItemId: bottomItemId ?? this.bottomItemId,
      bottomBrandId: bottomBrandId ?? this.bottomBrandId,
      bottomPhotoPath: bottomPhotoPath ?? this.bottomPhotoPath,
      bottomImageId: bottomImageId ?? this.bottomImageId,
      bottomItemName: bottomItemName ?? this.bottomItemName,
      comment: comment ?? this.comment,
    );
  }
}

class CodiInsertViewModel extends StateNotifier<CodiInsertModel> {
  Ref ref;
  final ImagePicker picker = ImagePicker();
  final cacheManager = DefaultCacheManager();
  final mContext = navigatorKey.currentContext;
  SessionData sessionData;

  CodiInsertViewModel(this.ref, this.sessionData)
      : super(CodiInsertModel(
            prevImg: '',
            images: [],
            isMainPhoto: false,
            topPhotoPath: null,
            bottomPhotoPath: null,
            comment: ''));

  Future<void> codiSave(CodiInsertReqDTO reqDTO) async {
    print('${reqDTO.toJson()}');
    ResponseDTO responseDTO = await CodiRepo().callSetItemInsert(reqDTO);

    if (responseDTO.success) {

      PopularCodiPhotos codiPhotos = PopularCodiPhotos.fromJson(responseDTO.response);
      ref.read(homeProvider.notifier).addNewCodiPhotos(codiPhotos);


      CodiList newCodi = CodiList.fromJson(responseDTO.response);

      ref
          .read(creatorProvider(sessionData.user!.id!).notifier)
          .addNewCodi(newCodi);
      Navigator.pop(mContext!);
    }
  }
  Future<void> pickAndAddImageFromBase64(String photoPath, String itemName,
      int itemId, int brandId, String category) async {

    if (category == 'top') {
      state = state.copyWith(
        topBrandId: brandId,
        topItemId: itemId,
        topPhotoPath: photoPath,
        topItemName: itemName,
        topImageId: itemId,
      );
      Navigator.pop(navigatorKey.currentContext!);
    } else if (category == 'bottom') {
      state = state.copyWith(
        bottomBrandId: brandId,
        bottomItemId: itemId,
        bottomPhotoPath: photoPath,
        bottomItemName: itemName,
        bottomImageId: itemId,
      );


      Navigator.pop(navigatorKey.currentContext!);
    }
  }

  void updateComment(String comment) {
    if (state != null) {
      state = state.copyWith(comment: comment);
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
AutoDisposeStateNotifierProvider<CodiInsertViewModel, CodiInsertModel>((ref) {
  SessionData sessionData = ref.watch(sessionProvider);
  return CodiInsertViewModel(ref, sessionData);
});
