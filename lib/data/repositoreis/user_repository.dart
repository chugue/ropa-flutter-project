import 'package:final_project_team02/data/global_data/user.dart';
import 'package:logger/logger.dart';

import '../../_core/constants/http.dart';
import '../dtos/respons_dto.dart';
import '../dtos/user_request.dart';

class UserRepository {
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

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;

      return (responseDTO, accessToken);
      return (responseDTO);
    } else {
      throw new Exception("${responseDTO.errorMessage}");
    }
  }

  Future<void> callProfile() async {
    final response = await dio.get("/app/profile");
    Logger().d(response.data!);
    //
    // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // return responseDTO;
  }
}
