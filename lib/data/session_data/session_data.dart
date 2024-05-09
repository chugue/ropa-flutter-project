import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/global_data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/move.dart';
import '../../main.dart';
import '../dtos/respons_dto.dart';
import '../dtos/user_request.dart';
import '../repositoreis/user_repository.dart';

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

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().callJoin(joinReqDTO);

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
    var (responseDTO, accessToken) =
        await UserRepository().callLogin(loginReqDTO);

    if (responseDTO.success) {
      await secureStorage.write(key: "accessToken", value: accessToken);

      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainHoder, (route) => false);
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
