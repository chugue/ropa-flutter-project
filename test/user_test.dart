import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTQwNjUzNSwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.AhzXTCAv5kC3y67OsgAVLarLDWs9aWzGo8cnuAyXg7K2gc-XDmldlH2FyHXCgylk5JnJL1m-wLz-NYAyXC0z6A';

void main() async {
  await callUserSetting_test();
}

Future<void> callUserProfile_test() async {
  await UserRepo().callUserProfile();
}

Future<void> callUserSetting_test() async {
  await UserRepo().callUserSetting(accessToken);
}

Future<void> callJoin_test() async {
  JoinReqDTO reqDTO =
  JoinReqDTO(email: "asd@nate.com", nickName: "asdasd", password: "1234");
  await UserRepo().callJoin(reqDTO);
}

Future<void> callLogin_test() async {
  LoginReqDTO reqDTO = LoginReqDTO(email: "asd@nate.com", password: "1234");
  await UserRepo().callLogin(reqDTO);
}

Future<void> callLogin_test2() async {
  LoginReqDTO reqDTO =
  LoginReqDTO(email: "user1@example.com", password: "1234");
  await UserRepo().callLogin(reqDTO);
}

Future<void> callProfile_test2() async {
  var response;
  try {
    response = await dio.get("/app/profile");
  } catch (e) {
    logger.e('Failed to fetch profile: $e');
  }
  Logger().d(response.data!);
}
