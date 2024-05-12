import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_data/user_profile.dart';
import 'package:logger/logger.dart';

class UserRepo {
  Future<ResponseDTO> callUserCreatorApply(
      UserCreatorApplyReqDTO reqDTO) async {
    final response = await dio.put("/app/creator-apply",
        data: reqDTO.toJson(),
        options: Options(headers: {'Authorization': globalAccessToken}));
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      Logger().d(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callUserSetting() async {
    final response = await dio.get("/app/setting");
    // 🚧🚧🚧🚧Test🚧🚧🚧🚧
    // final response = await dio.get("/app/setting",
    //     options: Options(headers: {"Authorization": accessToken}));
    Logger().d(response.data!);

    // 🔀PARSING
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = UserProfile.fromJson(responseDTO.response);
    }
    Logger().d(responseDTO);

    return responseDTO;
  }

  Future<ResponseDTO> callUserProfile() async {
    print(globalAccessToken);

    final response = await dio.get("/app/profile");
    // final response = await dio.get("/app/profile",
    //     options: Options(headers: {"Authorization": accessToken}));
    Logger().d(response.data!);
    print(response.data);

    // 🔀PARSING
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success) {
      responseDTO.response = UserProfile.fromJson(responseDTO.response);
      Logger().d(responseDTO.response);
    }
    Logger().d(responseDTO);

    return responseDTO;
  }

  Future<ResponseDTO> callJoin(JoinReqDTO reqDTO) async {
    final response = await dio.post("/user/join", data: reqDTO.toJson());
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<(ResponseDTO, String)> callLogin(LoginReqDTO reqDTO) async {
    final response = await dio.post("/user/login", data: reqDTO.toJson());

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
