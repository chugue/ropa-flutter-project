import 'package:dio/dio.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_profile.dart';
import 'package:logger/logger.dart';

class UserProfileRepository {
  Future<ResponseDTO> fetchUserProfile(int userId, String accessToken) async {
    final response = await dio.get(
      "/app/profile",
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTE1MDYwNywiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.hJ-pyxYjVTQDaJcnsSYRQf6NO_04EtIsxjIv49d6usIiVB0af8I85z9hWaSKqHy9nhy2hk3IxPuJ2hrJTCcfsw",
        },
      ),
    );

    // 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200)
      responseDTO.response = UserProfile.fromJson(responseDTO.response);

    Logger().d(response.headers);
    Logger().d(response.data!);
    return ResponseDTO.fromJson(response.data);
  }
}
