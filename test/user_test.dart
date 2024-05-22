import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

final accessToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJibG9nIiwicm9sZSI6dHJ1ZSwibmFtZSI6IuyCrOyaqeyekDHsnZgg7Iuk66qFIiwiaWQiOjEsImV4cCI6MTcxNTY3MTk5NCwiZW1haWwiOiJ1c2VyMUBleGFtcGxlLmNvbSJ9.1RnYFrIsghzIDfSlA1_kTaOnOBhR6jFPFz7JD7wN7AGOP5gDLTsNecGu-JWDL3P0odrV1Zo_7xG_nWn3wryQUw';

void main() async {
  // await callLogin_test2();
  await callUserProfileUpdate_test();

  // await callUserMyPage(accessToken);
  // await callUserCreatorApply_test();
}

Future<void> callUserProfileUpdate_test() async {
  Photo photo =
      Photo(name: "profile_picture.jpg", base64: "/9j/4AAQSkZJRgABAQA");
  UserProfileUpdateDTO reqDTO = UserProfileUpdateDTO(
    myName: "John Doe",
    nickName: "Johnny",
    mobile: "010-1234-5678",
    password: "password123",
    photo: photo,
  );
  await UserRepo().callUserProfileUpdate(1, reqDTO);
}

Future<void> callUserMyPage_test(accessToken) async {
  await UserRepo().callCreatorView(1);
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
