import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_data/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 💾창고 데이터
class UserProfileModel {
  UserProfile userProfile;

  UserProfileModel(
    this.userProfile,
  );
}

// 창고
class UserProfileViewModel extends StateNotifier<UserProfileModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  UserProfileViewModel(
    super.state,
    this.ref,
  );

  Future<void> notifyInit() async {
    SessionData sessionData = ref.read(sessionProvider);

    print(sessionData.accessToken);

    ResponseDTO responseDTO = await UserRepo().callUserProfile();

    print("✅✅✅✅✅✅✅뷰모델 : ${responseDTO.success}");
    if (responseDTO.success) {
      state = UserProfileModel(responseDTO.response);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("⛔⛔⛔⛔⛔⛔⛔프로필 정보 보기 실패 : ${responseDTO.errorMessage}"),
        ),
      );
    }
  }
}

// 창고 관리자

final userProfileProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileModel?>(
  (ref) {
    return UserProfileViewModel(null, ref)..notifyInit(); /* 초기 상태 null */
  },
);
