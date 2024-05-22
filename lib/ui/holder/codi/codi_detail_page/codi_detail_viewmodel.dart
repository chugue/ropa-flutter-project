import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/codi.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/item_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/other_codi_photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiDetailModel {
  final Codi codi;
  final List<ItemPhotos> itemPhotos;
  final List<MainPhotos> mainPhotos;
  final List<OtherCodiPhotos> otherCodiPhotos;

  const CodiDetailModel({
    required this.codi,
    required this.itemPhotos,
    required this.mainPhotos,
    required this.otherCodiPhotos,
  });

  CodiDetailModel copyWith({
    Codi? codi,
    List<ItemPhotos>? itemPhotos,
    List<MainPhotos>? mainPhotos,
    List<OtherCodiPhotos>? otherCodiPhotos,
  }) {
    return CodiDetailModel(
      codi: codi ?? this.codi,
      itemPhotos: itemPhotos ?? this.itemPhotos,
      mainPhotos: mainPhotos ?? this.mainPhotos,
      otherCodiPhotos: otherCodiPhotos ?? this.otherCodiPhotos,
    );
  }
}

class CodiDetailViewModel extends StateNotifier<CodiDetailModel?> {
  Ref ref;
  SessionData sessionData;
  final mContext = navigatorKey.currentContext;

  CodiDetailViewModel(super.state, this.ref, this.sessionData);

  void addNewCodi(OtherCodiPhotos newOtherCodiPhotos) {
    if (state != null) {
      List<OtherCodiPhotos> updatedOtherCodiPhotos = [
        newOtherCodiPhotos,
        ...state!.otherCodiPhotos
      ];
      state = state!.copyWith(otherCodiPhotos: updatedOtherCodiPhotos);
    }
  }

  Future<ResponseDTO> loveCount(int codiId) async {
    if (state!.codi.isLoved == false) {
      ResponseDTO responseDTO = await CodiRepo().callSaveLoveCount(codiId);

      if (responseDTO.success) {
        state = state!.copyWith(
          codi: state!.codi.copyWith(
            isLoved: true,
            loveCount: state!.codi.loveCount + 1,
          ),
        );
      }
      return responseDTO;
    } else {
      ResponseDTO responseDTO = await CodiRepo().callDeleteLoveCount(codiId);
      if (responseDTO.success) {
        state = state!.copyWith(
          codi: state!.codi.copyWith(
            isLoved: false,
            loveCount: state!.codi.loveCount - 1,
          ),
        );
      }
      return responseDTO;
    }
  }

  Future<ResponseDTO> notifyInit(int codiId) async {
    ResponseDTO responseDTO = await CodiRepo().callCodiDetail(codiId);
    if (responseDTO.success) {
      CodiDetailModel model = responseDTO.response;
      state = model;
    }
    return responseDTO;
  }
}

final codiDetailProvider =
    StateNotifierProvider.family<CodiDetailViewModel, CodiDetailModel?, int?>(
        (ref, codiId) {
  SessionData sessionData = ref.read(sessionProvider);
  return CodiDetailViewModel(null, ref, sessionData)..notifyInit(codiId!);
});
