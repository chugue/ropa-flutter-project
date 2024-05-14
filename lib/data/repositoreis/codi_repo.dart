import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/codi.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/item_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/other_codi_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:logger/logger.dart';

class CodiRepo {
  Future<ResponseDTO> callSaveLoveCount(int codiId) async {
    final response = await dio.post('/app/function/love/${codiId}');

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = Codi.fromJson(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callDeleteLoveCount(int codiId) async {
    final response = await dio.delete('/app/function/love/${codiId}');
    Logger().d(response.data!);
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<ResponseDTO> callCodiDetail(int codiId) async {
    final response = await dio.get('/codi-pages/${codiId}');
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      Codi codi = Codi.fromJson(responseDTO.response);
      Logger().d(codi);

      List<dynamic> itemPhoto = responseDTO.response["itemPhotos"];
      Logger().d(itemPhoto);

      List<ItemPhotos> itemPhotos =
          itemPhoto.map((e) => ItemPhotos.fromJson(e)).toList();
      Logger().d(itemPhotos);

      List<dynamic> mainPhoto = responseDTO.response["mainPhotos"];
      Logger().d(mainPhoto);

      List<MainPhotos> mainPhotos =
          mainPhoto.map((e) => MainPhotos.fromJson(e)).toList();
      Logger().d(mainPhotos);

      List<dynamic> otherCodiPhoto = responseDTO.response["otherCodiPhotos"];
      Logger().d(otherCodiPhoto);

      List<OtherCodiPhotos> otherCodiPhotos =
          otherCodiPhoto.map((e) => OtherCodiPhotos.fromJson(e)).toList();
      Logger().d(otherCodiPhoto);

      CodiDetailModel model = CodiDetailModel(
        codi: codi,
        itemPhotos: itemPhotos,
        mainPhotos: mainPhotos,
        otherCodiPhotos: otherCodiPhotos,
      );
      responseDTO.response = model;
    }
    return responseDTO;
  }
}
