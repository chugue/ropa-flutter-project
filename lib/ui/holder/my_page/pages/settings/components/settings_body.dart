import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_small_title.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/settings/components/setting_logout_button.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/settings/components/setting_menus.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/settings/setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'setting_inquiry_menus.dart';

class SettingsBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserSettingModel? model = ref.watch(UserSettingProvider);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.blue,
        ),
      );
    } else {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // ✅ 타이틀
          _buildTitle(),
          SizedBox(height: 40),

          // ✅ 서브 타이틀
          ProfileSmallTitle(text: "회원 정보 설정"),
          SizedBox(height: 20),

          SettingMenus(
              field: "이메일", value: model.userSetting.email, isEdit: false),
          SizedBox(height: 20),

          SettingMenus(
              field: "이름", value: model.userSetting.myName, isEdit: false),
          SizedBox(height: 20),
          SettingMenus(
              field: "닉네임", value: model.userSetting.nickName, isEdit: true),
          SizedBox(height: 20),

          SettingMenus(
              field: "휴대폰 번호", value: model.userSetting.mobile, isEdit: true),
          SizedBox(height: 20),

          SettingMenus(field: "비밀번호", value: "변경하기", isEdit: true),
          SizedBox(height: 80),

          // ✅ 서브 타이틀2
          ProfileSmallTitle(text: "서비스 정보"),
          SizedBox(height: 20),

          SettingInquiryMenu(field: "문의하기", value: ""),
          SizedBox(height: 20),
          // ✅ 로그아웃
          LogoutButton(),
          SizedBox(height: 80),
          // SettingMenus(field: "회원탈퇴", value: "", isEdit: true),
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
