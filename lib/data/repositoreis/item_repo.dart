import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:logger/logger.dart';

class ItemRepo {
  Future<void> callItemDetail(String Token) async {
    final response = await dio.get('/app/item-detail-pages/1',
        options: Options(headers: {'Authorization': Token}));
    Logger().d(response.data!);
  }
}
