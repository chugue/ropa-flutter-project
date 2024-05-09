import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_codi_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_items_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_data/popular_user_photos.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';

class HomeRepository {
  Future<ResponseDTO> callHomeList() async {
    final response = await dio.get('/home-lists');

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // Logger().d(responseDTO.response);
    if (responseDTO.success) {
      List<dynamic> popularUserPhotos =
          responseDTO.response["popularUserPhotos"];
      // Logger().d(popularUserPhotos);
      List<PopularUserPhotos> UserPhotos =
          popularUserPhotos.map((e) => PopularUserPhotos.fromJson(e)).toList();
      // Logger().d(UserPhotos);

      List<dynamic> popularItemsPhotos =
          responseDTO.response["popularItemsPhotos"];
      // Logger().d(popularItemsPhotos);
      List<PopularItemsPhotos> ItemsPhotos = popularItemsPhotos
          .map((e) => PopularItemsPhotos.fromJson(e))
          .toList();
      // Logger().d(ItemsPhotos);

      List<dynamic> popularCodiPhotos =
          responseDTO.response["popularCodiPhotos"];
      // Logger().d(popularCodiPhotos);
      List<PopularCodiPhotos> CodiPhotos =
          popularCodiPhotos.map((e) => PopularCodiPhotos.fromJson(e)).toList();
      // Logger().d(CodiPhotos);

      HomeModel homeModel = HomeModel(
          codiPhotos: CodiPhotos,
          itemsPhotos: ItemsPhotos,
          userPhotos: UserPhotos);
      responseDTO.response = homeModel;
    }
    return responseDTO;
  }
}
