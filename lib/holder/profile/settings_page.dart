// 설정 페이지
import 'package:flutter/material.dart';

import '../../components/bottom_control.dart';
import '../../components/custom_app_bar.dart';
import '_profile_menus.dart';
import '_profile_small_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildTitle(),
          SizedBox(height: 40),
          ProfileSmallTitle(text: "회원 정보 설정"),
          SizedBox(height: 20),
          ProfileMenus(field: "이메일", value: "chugue85@gmail.com"),
          SizedBox(height: 20),
          ProfileMenus(field: "이름", value: "홍길동"),
          SizedBox(height: 20),
          ProfileMenus(field: "닉네임", value: "아는남자"),
          SizedBox(height: 20),
          ProfileMenus(field: "휴대폰 번호", value: "01011112222"),
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
      ),
      bottomNavigationBar: BottomControl(),
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
