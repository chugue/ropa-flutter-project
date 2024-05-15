import 'package:dio/dio.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/serach/search_data/codi_photo.dart';
import 'package:final_project_team02/ui/holder/serach/search_data/items_photo.dart';

import '../../ui/holder/serach/search_viewmodel.dart';

class SearchRepo {
  final Dio dio;

  SearchRepo() : dio = Dio();

  // 데이터를 가져오는 메소드
  Future<SearchModel> callSearchData() async {
    final response = await dio.get('/app/main-search-page'); // 실제 API URL로 변경
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    try {
      if (responseDTO.success) {
        final data = responseDTO.response;

        final codiPhotos = (data['codiPhotos'] as List)
            .map((e) => CodiPhoto.fromJson(e))
            .toList();
        final itemPhotos = (data['itemPhotos'] as List)
            .map((e) => ItemPhoto.fromJson(e))
            .toList();

        return SearchModel(codiPhotos: codiPhotos, itemPhotos: itemPhotos);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
