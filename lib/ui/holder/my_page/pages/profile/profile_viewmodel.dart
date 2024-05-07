import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_profile.dart';
import 'package:final_project_team02/data/repositoreis/user_profile_repository.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 💾창고 데이터
class UserProfileModel {
  UserProfile userProfile;

  UserProfileModel(this.userProfile);
// User user;
// UserProfileModel(this.user);
}

// 창고
class UserProfileViewModel extends StateNotifier<UserProfileModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  UserProfileViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    SessionData sessionData = ref.read(sessionProvider);
    String jwt = sessionData.accessToken!;

    // ResponseDTO responseDTO = await UserProfileRepository()
    //     .fetchUserProfile(sessionData.userProfile!.userId, jwt);
    ResponseDTO responseDTO = await UserProfileRepository()
        .fetchUserProfile(sessionData.userProfile!.userId, jwt);

    print("뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = UserProfileModel(responseDTO.response);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(
          content: Text("프로필 정보 보기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
// final UserProfileProvider = StateNotifierProvider.family
//     .autoDispose<UserProfileViewModel, UserProfileModel?, int>((ref, userId) {
//   return UserProfileViewModel(null, ref)..notifyInit();
// });
final UserProfileProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileModel?>((ref) {
  return UserProfileViewModel(null, ref)..notifyInit();
});
