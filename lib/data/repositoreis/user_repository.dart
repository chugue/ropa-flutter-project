import 'package:logger/logger.dart';

import '../../_core/constants/http.dart';
import '../domain_data/user.dart';
import '../dtos/respons_dto.dart';
import '../dtos/user_request.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    final response = await dio.post("/user/join", data: requestDTO.toJson());
    Logger().d(response.data!);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/user/login", data: loginReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(response.headers["Authorization"]!.first);
    Logger().d(response.data!);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);

      return (responseDTO);
    } else {
      throw new Exception("${responseDTO.errorMessage}");
    }
  }
}
