import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/ui/holder/item/item_data/detail_photos.dart';
import 'package:final_project_team02/ui/holder/item/item_data/item.dart';
import 'package:final_project_team02/ui/holder/item/item_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/item/item_datail_viewmodel.dart';

import '../dtos/respons_dto.dart';

class ItemRepo {
  Future<ResponseDTO> callItemDetailList(int itemId) async {
    final response = await dio.get('/app/item-detail-pages/${itemId}');
    logger.d('😒😒😒😒😒😒😒🚧🚧🚧${response.data}');

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data!);

    if (responseDTO.success) {
      Item item = Item.fromJson(responseDTO.response);
      logger.d('😒😒😒😒😒😒😒${item}');
      List<dynamic> mainPhtos = responseDTO.response['mainPhotos'];
      List<MainPhotos> mainPhotoList =
          mainPhtos.map((e) => MainPhotos.fromJson(e)).toList();

      List<dynamic> detailPhtos = responseDTO.response['detailPhotos'];
      List<DetailPhotos> detailPhotoList =
          detailPhtos.map((e) => DetailPhotos.fromJson(e)).toList();

      ItemDetailListModel itemDetailListModel = ItemDetailListModel(
        detailPhotos: detailPhotoList,
        mainPhotos: mainPhotoList,
        item: item,
      );
      responseDTO.response = itemDetailListModel;
    }
    return responseDTO;
  }
}
