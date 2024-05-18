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

// 싱글톤 패턴을 사용하여 단일 인스턴스를 유지하는 클래스
class SessionUser {
  User? user; // 현재 로그인한 사용자 정보를 저장
  bool isLogin = false; // 로그인 상태를 나타내는 플래그
  String? accessToken; // 인증 토큰을 저장
  int? selectedUserId; // 선택된 사용자 ID를 저장

  SessionUser(); // 기본 생성자
}

// SessionUser를 상속받아 데이터를 관리하는 클래스
class SessionData extends SessionUser {
  final mContext = navigatorKey.currentContext; // 네비게이션 컨텍스트를 가져옴

  SessionData(); // 기본 생성자

  // 로그아웃 메소드
  void logout() async {
    user = null; // 사용자 정보 초기화
    accessToken = null; // 인증 토큰 초기화
    globalAccessToken = null; // 전역 인증 토큰 초기화
    isLogin = false; // 로그인 상태 초기화

    await secureStorage.delete(key: "accessToken"); // 안전한 저장소에서 토큰 삭제
    Navigator.pushNamedAndRemoveUntil(
        mContext!, Move.mainHolder, (route) => false); // 메인 화면으로 이동
  }

  // 사용자 크리에이터 신청 메소드
  Future<void> UserCreatorApply(UserCreatorApplyReqDTO reqDTO) async {
    ResponseDTO responseDTO =
        await UserRepo().callUserCreatorApply(reqDTO); // API 호출

    if (responseDTO.success) {
      showDialog(
        context: mContext!,
        builder: (BuildContext context) {
          return UserMyPageApplyModalBodyApplyButton(); // 성공 시 모달 창 표시
        },
      );
      User user = responseDTO.response; // 응답 데이터에서 사용자 정보 가져오기

      // 사용자 정보 업데이트
      this.user = User(
          id: user.id,
          nickName: user.nickName,
          username: user.username,
          blueChecked: user.blueChecked,
          instagram: user.instagram,
          createdAt: user.createdAt);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text(
                "크리에이터를 지원 실패 : ${responseDTO.errorMessage}")), // 실패 시 스낵바 표시
      );
    }
  }

  // 회원 가입 메소드
  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepo().callJoin(joinReqDTO); // API 호출

    // 비지니스 로직
    if (responseDTO.success) {
      Navigator.pushNamed(mContext!, Move.loginPage); // 성공 시 로그인 페이지로 이동
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content:
                Text("로그인 실패 : ${responseDTO.errorMessage}")), // 실패 시 스낵바 표시
      );
    }
  }

  // 로그인 메소드
  Future<void> login(LoginReqDTO loginReqDTO) async {
    print("loginReqDTO : ${loginReqDTO.toJson()}");
    var (responseDTO, accessToken) =
        await UserRepo().callLogin(loginReqDTO); // API 호출

    if (responseDTO.success) {
      await secureStorage.write(
          key: "accessToken", value: accessToken); // 성공 시 인증 토큰 저장

      // 사용자 정보와 로그인 상태 업데이트
      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      globalAccessToken = accessToken; // 전역 인증 토큰 업데이트
      print("sjfsjfsjsf : ${globalAccessToken}");
      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainHolder, (route) => false); // 메인 화면으로 이동
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(
          content:
              Text("로그인 실패 : ${responseDTO.errorMessage}"))); // 실패 시 스낵바 표시
    }
  }
}

// SessionData 인스턴스를 관리하는 Riverpod 상태 프로바이더
final sessionProvider = StateProvider<SessionData>((ref) {
  return SessionData();
});
