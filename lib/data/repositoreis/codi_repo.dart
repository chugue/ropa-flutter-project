import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/codi.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/item_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/other_codi_photos.dart';
import 'package:logger/logger.dart';

class CodiRepository {
  Future<void> callCodiDetail(int codiId, String accessToken) async {
    final response = await dio.get('/app/codi-pages/${codiId}',
        options: Options(headers: {'Authorization': '$accessToken'}));
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      Codi codi = Codi.fromJson(responseDTO.response);
      Logger().d(codi);

      List<dynamic> itemPhotos = responseDTO.response["itemPhotos"];
      Logger().d(itemPhotos);

      List<ItemPhotos> itemPhoto =
          itemPhotos.map((e) => ItemPhotos.fromJson(e)).toList();
      Logger().d(itemPhoto);

      List<dynamic> mainPhotos = responseDTO.response["mainPhotos"];
      Logger().d(mainPhotos);

      List<MainPhotos> mainPhoto =
          mainPhotos.map((e) => MainPhotos.fromJson(e)).toList();
      Logger().d(mainPhoto);

      List<dynamic> otherCodiPhotos = responseDTO.response["otherCodiPhotos"];
      Logger().d(otherCodiPhotos);

      List<OtherCodiPhotos> otherCodiPhoto =
          otherCodiPhotos.map((e) => OtherCodiPhotos.fromJson(e)).toList();
      Logger().d(otherCodiPhoto);
    }
  }
}
