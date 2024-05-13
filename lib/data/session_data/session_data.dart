import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/user_my_page_apply_modal_body_form_apply_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 싱글톤
class SessionUser {
  User? user;
  bool isLogin = false;
  String? accessToken;
  int? selectedUserId;

  SessionUser();
}

// 창고
class SessionData extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionData();

  void logout() {
    user = null;
    accessToken = null;
    isLogin = false;
  }

  Future<void> UserCreatorApply(UserCreatorApplyReqDTO reqDTO) async {
    ResponseDTO responseDTO = await UserRepo().callUserCreatorApply(reqDTO);

    if (responseDTO.success) {
      showDialog(
        context: mContext!,
        builder: (BuildContext context) {
          return UserMyPageApplyModalBodyApplyButton();
        },
      );
      User user = responseDTO.response;

      this.user = User(
          id: user.id,
          nickName: user.nickName,
          username: user.username,
          blueChecked: user.blueChecked,
          instagram: user.instagram,
          createdAt: user.createdAt);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("크리에이터를 지원 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepo().callJoin(joinReqDTO);

    // 비지니스 로직
    if (responseDTO.success) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    print("loginReqDTO : ${loginReqDTO.toJson()}");
    var (responseDTO, accessToken) = await UserRepo().callLogin(loginReqDTO);

    if (responseDTO.success) {
      await secureStorage.write(key: "accessToken", value: accessToken);

      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      globalAccessToken = accessToken;
      print("sjfsjfsjsf : ${globalAccessToken}");
      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainHolder, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionData>((ref) {
  return SessionData();
});
