import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/repositoreis/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

final token =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTIzMTc4NCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.OwPmgGXUSXFRDNqSWCywuH6tEz6QwF_p2Vy1jNAUaHLfEN75Nei31-kICT29krZqem6UiyJpfHX8P_68GD1idA';

void main() async {
  // TestWidgetsFlutterBinding.ensureInitialized(); // 바인딩 초기화
  // WidgetsFlutterBinding.ensureInitialized() ////통합테스트 바인딩 초기화
  await callProfile_test2();
}

Future<void> callSetting_test() async {
  await UserRepository().callSetting();
}

Future<void> callJoin_test() async {
  JoinReqDTO reqDTO =
      JoinReqDTO(email: "asd@nate.com", nickName: "asdasd", password: "1234");
  await UserRepository().callJoin(reqDTO);
}

Future<void> callLogin_test() async {
  LoginReqDTO reqDTO = LoginReqDTO(email: "asd@nate.com", password: "1234");
  await UserRepository().callLogin(reqDTO);
}

Future<void> callLogin_test2() async {
  LoginReqDTO reqDTO =
      LoginReqDTO(email: "user1@example.com", password: "1234");
  final response = await UserRepository().callLogin(reqDTO);
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

Future<void> callProfile_test() async {
  await UserRepository().callProfile(token);
}
