import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_data/user_profile.dart';
import 'package:logger/logger.dart';

class UserRepo {
  Future<void> callSetting() async {
    final response = await dio.get("/app/setting");
    Logger().d(response.data!);
    //
    // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // return responseDTO;
  }

  Future<ResponseDTO> callUserProfile() async {
    final response = await dio.get("/app/profile");
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

  Future<ResponseDTO> callJoin(JoinReqDTO requestDTO) async {
    final response = await dio.post("/user/join", data: requestDTO.toJson());
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<(ResponseDTO, String)> callLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/user/login", data: loginReqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(response.data!);
    Logger().d(response.headers["Authorization"]!.first);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;

      return (responseDTO, accessToken);
    } else {
      throw new Exception("${responseDTO.errorMessage}");
    }
  }
}
