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
  final mContext = navigatorKey.currentContext;

  CodiDetailViewModel(super.state, this.ref);

  Future<ResponseDTO> loveCount(int codiId) async {
    SessionData sessionData = ref.read(sessionProvider);

    ResponseDTO responseDTO =
        await CodiRepo().callLoveCount(codiId, sessionData.accessToken!);

    if (responseDTO.success) {
      bool isLoved = !state!.codi.isLoved;
      int loveCount =
          isLoved ? state!.codi.loveCount! + 1 : state!.codi.loveCount! - 1;

      Codi codi = Codi(
        codiId: codiId,
        isLoved: isLoved = true,
        description: state!.codi.description,
        createdAt: state!.codi.createdAt,
        loveCount: loveCount,
      );

      List<ItemPhotos> itemPhotos = state!.itemPhotos;
      List<MainPhotos> mainPhotos = state!.mainPhotos;
      List<OtherCodiPhotos> otherCodiPhotos = state!.otherCodiPhotos;

      responseDTO.response = CodiDetailModel(
        codi: codi,
        itemPhotos: itemPhotos,
        mainPhotos: mainPhotos,
        otherCodiPhotos: otherCodiPhotos,
      );
    }

    return responseDTO;
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
  return CodiDetailViewModel(null, ref)..notifyInit(codiId);
});
