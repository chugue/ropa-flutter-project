import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/settings/setting_data/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 모델
class UserSettingModel {
  UserSetting userSetting;

  UserSettingModel(this.userSetting);
}

class UserSettingViewModel extends StateNotifier<UserSettingModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  UserSettingViewModel(
    super.state,
    this.ref,
  );

  Future<void> notifyInit() async {
    SessionData sessionData = ref.read(sessionProvider);

    print(sessionData.accessToken);

    ResponseDTO responseDTO = await UserRepo().callUserSetting();

    print("✅✅✅✅VIEW MODEL✅✅✅✅ : ${responseDTO.success}");
    if (responseDTO.success) {
      state = UserSettingModel(responseDTO.response);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(
              "✅✅✅✅VIEW MODEL ERROR MESSAGE✅✅✅✅ : ${responseDTO.errorMessage}"),
        ),
      );
    }
  }
}

// 프로바이더 = 공급자 제공자
final userSettingProvider =
    StateNotifierProvider<UserSettingViewModel, UserSettingModel?>(
  (ref) {
    return UserSettingViewModel(null, ref)..notifyInit();
  },
);
