import 'package:final_project_team02/holder/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

import '../components/bottom_button.dart';
import '../components/bottom_control.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProfileSetting(),
    );
  }
}

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.chevron_left),
        toolbarHeight: 45,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildTitle(), // 프로필 설정
          _buildPhoto(), // 사진, 바꾸기 칼럼
          Container(), // 이메일
          SizedBox(), // 마진
          Container(), // 이름
          Container(), // 닉네임
          Container(), // 휴대폰 번호 변경
          Container(), // 비밀번호 변경
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,  // 스택 내에서 위젯들을 위쪽 중앙에 정렬
        children: [
          Container(
            height: 120,  // 바텀 네비게이션바의 높이
            color: Colors.white,
            child: BottomControl(),
          ),
          Positioned(
            child: BottomButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoto() => Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/avatar.jpg"),
        ),
      ],
    ),
  );

  Widget _buildTitle() => Container(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "프로필 설정",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}



