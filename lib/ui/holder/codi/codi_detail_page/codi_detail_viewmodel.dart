import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/codi.dart';
import 'package:final_project_team02/data/repositoreis/codi_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/item_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/other_codi_photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
}

class CodiDetailViewModel extends StateNotifier<CodiDetailModel?> {
  Ref ref;
  SessionData sessionData;
  final mContext = navigatorKey.currentContext;

  CodiDetailViewModel(super.state, this.ref, this.sessionData);

  Future<ResponseDTO> loveCount(int codiId) async {
    if (state!.codi.isLoved == false) {
      ResponseDTO responseDTO = await CodiRepo().callSaveLoveCount(codiId);

      if (responseDTO.success) {
        bool isLoved = !state!.codi.isLoved;
        int loveCount = state!.codi.loveCount + 1;

        Codi codi = Codi(
          codiId: codiId,
          isLoved: isLoved,
          description: state!.codi.description,
          createdAt: state!.codi.createdAt,
          loveCount: loveCount,
        );

        state = CodiDetailModel(
          codi: codi,
          itemPhotos: state!.itemPhotos,
          mainPhotos: state!.mainPhotos,
          otherCodiPhotos: state!.otherCodiPhotos,
        );
      }
      return responseDTO;
    } else {
      ResponseDTO responseDTO = await CodiRepo().callDeleteLoveCount(codiId);
      if (responseDTO.success) {
        bool isLoved = !state!.codi.isLoved;
        int loveCount = state!.codi.loveCount - 1;

        Codi codi = Codi(
          codiId: codiId,
          isLoved: isLoved,
          description: state!.codi.description,
          createdAt: state!.codi.createdAt,
          loveCount: loveCount,
        );

        state = CodiDetailModel(
          codi: codi,
          mainPhotos: state!.mainPhotos,
          itemPhotos: state!.itemPhotos,
          otherCodiPhotos: state!.otherCodiPhotos,
        );
      }
      return responseDTO;
    }
  }

  Future<ResponseDTO> notifyInit(int codiId) async {
    ResponseDTO responseDTO = await CodiRepo().callCodiDetail(codiId);
    if (responseDTO.success) {
      state = responseDTO.response;
      Logger().d(responseDTO.response);
    }
    return responseDTO;
  }
}

final codiDetailProvider =
    StateNotifierProvider.family<CodiDetailViewModel, CodiDetailModel?, int>(
        (ref, codiId) {
  SessionData sessionData = ref.read(sessionProvider);
  return CodiDetailViewModel(null, ref, sessionData)..notifyInit(codiId);
});
