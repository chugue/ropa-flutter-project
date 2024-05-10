import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_menus.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_small_title.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/settings/setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserSettingModel? model = ref.watch(UserSettingProvider);
    print("🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗model");
    print(model);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
          color: Colors.blue,
        ),
      );
    } else {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildTitle(),
          SizedBox(height: 40),
          ProfileSmallTitle(text: "회원 정보 설정"),
          SizedBox(height: 20),
          ProfileMenus(field: "이메일", value: model.userSetting.email),
          SizedBox(height: 20),
          ProfileMenus(field: "이름", value: model.userSetting.myName),
          SizedBox(height: 20),
          ProfileMenus(field: "닉네임", value: model.userSetting.nickName),
          SizedBox(height: 20),
          ProfileMenus(field: "휴대폰 번호", value: model.userSetting.mobile),
          SizedBox(height: 20),
          ProfileMenus(field: "비밀번호", value: "변경하기"),
          SizedBox(height: 80),
          ProfileSmallTitle(text: "서비스 정보"),
          SizedBox(height: 20),
          ProfileMenus(field: "문의하기", value: ""),
          SizedBox(height: 20),
          ProfileMenus(field: "로그아웃", value: ""),
          SizedBox(height: 80),
          ProfileMenus(field: "회원탈퇴", value: ""),
        ],
      );
    }
  }

  Widget _buildTitle() => Container(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "설정",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
}
