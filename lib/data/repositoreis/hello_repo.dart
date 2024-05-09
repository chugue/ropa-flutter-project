import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:logger/logger.dart';

class HelloRepository {
  Future<void> hello() async {
    final response = await dio.post('/hello/1',
        options: Options(headers: {'hello': 'Hello'}));
    Logger().d(response.data!);
  }
}
