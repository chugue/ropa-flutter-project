import 'dart:convert';

import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/other_codi_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_data/codi_insert.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_data/creator_codi_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CodiInsertViewModel extends StateNotifier<CodiInsertModel> {
  Ref ref;
  final ImagePicker picker = ImagePicker();
  final cacheManager = DefaultCacheManager();
  final mContext = navigatorKey.currentContext;
  SessionData sessionData;

  CodiInsertViewModel(this.ref, this.sessionData) : super(CodiInsertModel());

  Future<void> codiSave(CodiInsertReqDTO reqDTO) async {
    ResponseDTO responseDTO = await CodiRepo().callSetItemInsert(reqDTO);

    if (responseDTO.success) {
      PopularCodiPhotos codiPhotos =
          PopularCodiPhotos.fromJson(responseDTO.response);
      ref.read(homeProvider.notifier).addNewCodiPhotos(codiPhotos);

      CreatorCodiList newCodi = CreatorCodiList.fromJson(responseDTO.response);
      ref.read(creatorProvider.notifier).addNewCodi(newCodi);
      Navigator.pop(mContext!);

      OtherCodiPhotos newOtherCodiPhotos =
          OtherCodiPhotos.fromJson(responseDTO.response);
      ref
          .read(codiDetailProvider(null).notifier)
          .addNewCodi(newOtherCodiPhotos);
      Navigator.pop(mContext!);
    }
  }

  Future<void> pickAndAddItemImage(
    String photoPath,
    String itemName,
    int itemId,
    int brandId,
    String category,
  ) async {
    if (category == 'top') {
      state = state.copyWith(
        topBrandId: brandId,
        topItemId: itemId,
        topPhotoPath: photoPath,
      );
      Navigator.pop(mContext!);
    } else if (category == 'bottom') {
      state = state.copyWith(
        bottomBrandId: brandId,
        bottomItemId: itemId,
        bottomPhotoPath: photoPath,
      );
      Navigator.pop(mContext!);
    }
  }

  void updateComment(String comment) {
    state = state.copyWith(comment: comment);
  }

  Future<void> pickAndAddCodiImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String base64String = await convertToBase64(image);

      // 파일 경로에서 파일 이름과 확장자 추출
      String fileName = basename(image.path);
      String fileExtension = extension(image.path);

      // 파일을 캐시에 저장
      await cacheManager.putFile(
        image.path,
        await image.readAsBytes(),
        fileExtension: fileExtension,
      );

      // isMainPhoto 설정: 첫 번째 이미지인 경우 true로 설정
      bool isMainPhoto = state.images.isEmpty;

      state = state.copyWith(
        images: [...state.images, image],
        prevImgs: [...state.prevImgs, base64String],
        fileNames: [...state.fileNames, fileName],
        fileExtensions: [...state.fileExtensions, fileExtension],
        isMainPhotos: [...state.isMainPhotos, isMainPhoto],
      );

      // 디버깅 로그 추가
      print('isMainPhoto: $isMainPhoto');
      print('Current images: ${state.images.length}');
    }
  }

  Future<String> convertToBase64(XFile image) async {
    Uint8List imageBytes = await image.readAsBytes();
    return base64Encode(imageBytes);
  }

  void setMainImg(String pushImages) {
    state = state.copyWith(prevImgs: [...state.prevImgs, pushImages]);
  }

  void removeImage(int index) {
    List<XFile> updatedImages = List.from(state.images)..removeAt(index);
    List<String> updatedPrevImgs = List.from(state.prevImgs)..removeAt(index);
    List<String?> updatedFileNames = List.from(state.fileNames)
      ..removeAt(index);
    List<String?> updatedFileExtensions = List.from(state.fileExtensions)
      ..removeAt(index);
    List<bool> updatedIsMainPhotos = List.from(state.isMainPhotos)
      ..removeAt(index);

    state = state.copyWith(
      images: updatedImages,
      prevImgs: updatedPrevImgs,
      fileNames: updatedFileNames,
      fileExtensions: updatedFileExtensions,
      isMainPhotos: updatedIsMainPhotos,
    );
  }
}

final codiInsertProvider =
    AutoDisposeStateNotifierProvider<CodiInsertViewModel, CodiInsertModel>(
        (ref) {
  SessionData sessionData = ref.watch(sessionProvider);
  return CodiInsertViewModel(ref, sessionData);
});
