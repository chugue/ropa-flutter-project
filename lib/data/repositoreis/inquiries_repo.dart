import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:logger/logger.dart';

class Inquiries {
  Future<void> callInquiriesList(String accessToken) async {
    final response = await dio.post('/app/inquiries-lists',
        options: Options(headers: {'Authorzation': '$accessToken'}));
    Logger().d(response.data!);
  }
}
