import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/move.dart';
import '../../main.dart';
import '../domain_data/user.dart';
import '../dtos/respons_dto.dart';
import '../dtos/user_request.dart';
import '../repositoreis/user_repository.dart';

class SessionUser {
  User? user;
  bool isLogin = false;
  int? selectedUserId;

  SessionUser();
}

// 창고
class SessionData extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionData();

  void loginCheck(String path) {
    if (isLogin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.loginPage);
    }
  }

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

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
    var (responseDTO) = await UserRepository().fetchLogin(loginReqDTO);

    if (responseDTO.success) {
      this.user = responseDTO.response;
      this.isLogin = true;

      Navigator.pushNamed(mContext!, Move.mainHoder);
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
