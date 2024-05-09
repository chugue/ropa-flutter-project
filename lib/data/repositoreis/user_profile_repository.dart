import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_data/user_profile.dart';
import 'package:logger/logger.dart';

import '../dtos/respons_dto.dart';

class UserProfileRepository {
  Future<ResponseDTO> fetchUserProfile(String accessToken) async {
    final response = await dio.get("/app/profile",
        options: Options(headers: {"Authorization": accessToken}));
    Logger().d(response.data!);
    print(response.data);

    // 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = UserProfile.fromJson(responseDTO.response);
      Logger().d(responseDTO.response);
    }
    Logger().d(responseDTO);

    return responseDTO;
  }
}
