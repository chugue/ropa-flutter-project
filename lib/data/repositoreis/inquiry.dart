import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/inquiries_list_data/inquiries_list.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/inquiries_list_viewmodel.dart';
import 'package:logger/logger.dart';

class InquiryRepo {
  // 📢 문의 목록보기 테스트
  Future<void> callInquiriesListTest(String accessToken) async {
    final response = await dio.get('/app/inquiries-lists',
        options: Options(headers: {"Authorization": accessToken}));
    Logger().d(response.data!);
  }

  // 📢 문의 목록보기
  Future<ResponseDTO> callInquiriesList() async {
    final response = await dio.get('/app/inquiries-lists');
    Logger().d(response.data!);

    // 파싱하기!
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      // responseDTO.response = InquiriesList.fromJson(responseDTO.response);
      List<dynamic> inquiry = responseDTO.response;
      List<InquiriesList> inquiriesList =
          inquiry.map((e) => InquiriesList.fromJson(e)).toList();

      InquiriesListModel model =
          InquiriesListModel(inquiriesList: inquiriesList);
      responseDTO.response = model;
    }

    return responseDTO;
  }
}
