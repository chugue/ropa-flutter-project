

import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/ui/holder/item/item_data/detail_photos.dart';
import 'package:final_project_team02/ui/holder/item/item_data/item.dart';
import 'package:final_project_team02/ui/holder/item/item_data/main_photos.dart';
import 'package:logger/logger.dart';

import '../dtos/respons_dto.dart';

class ItemRepo{
  Future<void> callItemDetailList(String accessToken) async {
    final response = await dio.get('/app/item-detail-pages/1',
        options: Options(headers: {"Authorization": accessToken}));
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data!);

    if(responseDTO.success) {
      Item item = Item.fromJson(responseDTO.response);
      Logger().d('${item}');


      List<dynamic> mainPhtos = responseDTO.response['mainPhotos'];
      List<MainPhotos>  mainPhotoList = mainPhtos.map((e) => MainPhotos.fromJson(e)).toList();
      Logger().d('${mainPhotoList}');


      List<dynamic> detailPhtos = responseDTO.response['detailPhotos'];
      List<DetailPhotos>  detailPhotoList = detailPhtos.map((e) => DetailPhotos.fromJson(e)).toList();
      Logger().d('${detailPhotoList}');


    }

  }


}