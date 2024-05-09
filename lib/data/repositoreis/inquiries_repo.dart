import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:logger/logger.dart';

class InquiriesRepo {
  Future<void> callInquiriesList(String accessToken) async {
    final response = await dio.get('/app/inquiries-lists',
        options: Options(headers: {"Authorization": accessToken}));
    Logger().d(response.data!);
  }

  Future<void> callInquiriesListv2() async {
    final response = await dio.get('/app/inquiries-lists');
    Logger().d(response.data!);
  }
}
