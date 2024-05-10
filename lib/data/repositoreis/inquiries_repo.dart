import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_list_page/inquiries_data/inquiries_list.dart';
import 'package:logger/logger.dart';

class InquiriesRepo {
  Future<ResponseDTO> callInquiriesList() async {
    final response = await dio.get('/app/inquiries-lists',
        options: Options(headers: {"Authorization": globalAccessToken}));
    Logger().d(response.data!);

    ResponseDTO responseDTO = await ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      List<dynamic> response = responseDTO.response;
      List<InquiriesList> inquiriesList =
          response.map((e) => InquiriesList.fromJson(e)).toList();
    }
    return responseDTO;
  }
}
