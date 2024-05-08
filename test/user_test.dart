import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/repositoreis/user_repository.dart';

void main() async {
  // dio.interceptors.add(interceptor);
  await callProfile_test();
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

Future<void> callProfile_test() async {
  await UserRepository().callProfileV2();
}

Future<void> callProfile_test2() async {
  await UserRepository().callProfile(
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTIzMTc4NCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.OwPmgGXUSXFRDNqSWCywuH6tEz6QwF_p2Vy1jNAUaHLfEN75Nei31-kICT29krZqem6UiyJpfHX8P_68GD1idA');
}
