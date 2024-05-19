import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/global_data/codi.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/item_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_data/other_codi_photos.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_data/brand.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';

// options: Options(headers: {'Authorization': '${ }'})
class CodiRepo {
  Future<ResponseDTO> callSetItemInsert(CodiInsertReqDTO reqDTO) async {
  print(reqDTO.toJson());
    final response = await dio.post(
      '/app/codi-register',
      data: reqDTO.toJson(),
    );
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    logger.d(responseDTO.response);
    return responseDTO;
  }

  Future<ResponseDTO> callGetItemInsert(String? category) async {
    final response = await dio.get('/app/codi-register/add-item/${category}');
    logger.d(response.data);
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      List<dynamic> brand = responseDTO.response;
      List<Brand> brandList = brand.map((e) => Brand.fromJson(e)).toList();
      responseDTO.response = CodiItemInsertModel(brandList: brandList);
    }
    return responseDTO;
  }

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
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<ResponseDTO> callCodiDetail(int codiId) async {
    final response = await dio.get('/app/codi-pages/${codiId}');

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      Codi codi = Codi.fromJson(responseDTO.response);

      List<dynamic> itemPhoto = responseDTO.response["itemPhotos"];

      List<ItemPhotos> itemPhotos =
          itemPhoto.map((e) => ItemPhotos.fromJson(e)).toList();

      List<dynamic> mainPhoto = responseDTO.response["mainPhotos"];

      List<MainPhotos> mainPhotos =
          mainPhoto.map((e) => MainPhotos.fromJson(e)).toList();

      List<dynamic> otherCodiPhoto = responseDTO.response["otherCodiPhotos"];

      List<OtherCodiPhotos> otherCodiPhotos =
          otherCodiPhoto.map((e) => OtherCodiPhotos.fromJson(e)).toList();

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
