import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuuzgOyasOyEnSIsImlkIjozLCJleHAiOjE3MTU5MTQ3MTgsImVtYWlsIjoiYnVud3VzZW9rQGV4YW1wbGUuY29tIn0.1YrvkNaE5KG_6HkaGoTOrOMn4F8LGtgmxIhxBQsOxq9dcXHHGGeppmty3aebWLsJdMHjuSnDu90tarCFK_eodw';

void main() async {
  // await callUserMyPage(accessToken);
  await callLogin_test2();
  // await callUserCreatorApply_test();
}

Future<void> callUserMyPage(accessToken) async {
  await UserRepo().callCreatorView();
}

Future<void> callUserCreatorApply_test() async {
  UserCreatorApplyReqDTO reqDTO = UserCreatorApplyReqDTO(
      height: '123',
      instagram: 'asd',
      job: '직장인',
      weight: '123',
      comment: 'ffff');
  await UserRepo().callUserCreatorApply(reqDTO);
}

Future<void> callUserProfile_test() async {
  await UserRepo().callUserProfile();
}

Future<void> callUserSetting_test() async {
  // await UserRepo().callUserSetting(accessToken);
  await UserRepo().callUserSetting();
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
      LoginReqDTO(email: "bunwuseok@example.com", password: "1234");
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
