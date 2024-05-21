import 'dart:convert';
import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
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
      PopularCodiPhotos codiPhotos =
          PopularCodiPhotos.fromJson(responseDTO.response);
      ref.read(homeProvider.notifier).addNewCodiPhotos(codiPhotos);

      CreatorCodiList newCodi = CreatorCodiList.fromJson(responseDTO.response);

      ref.read(creatorProvider.notifier).addNewCodi(newCodi);
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

  Future<void> pickAndAddCodiImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String base64String = await convertToBase64(image);

      // 파일 경로에서 파일 이름과 확장자 추출
      String fileName =basename(image.path);
      String fileExtension = extension(image.path);

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
    AutoDisposeStateNotifierProvider<CodiInsertViewModel, CodiInsertModel>(
        (ref) {
  SessionData sessionData = ref.watch(sessionProvider);
  return CodiInsertViewModel(ref, sessionData);
});
