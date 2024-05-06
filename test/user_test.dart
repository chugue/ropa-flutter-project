import 'package:final_project_team02/data/dtos/user_request.dart';
import 'package:final_project_team02/data/repositoreis/user_repository.dart';

void main() async {
  await callLogin_test2();
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
  await UserRepository().callLogin(reqDTO);
}
