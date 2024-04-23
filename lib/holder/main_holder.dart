import 'package:final_project_team02/holder/profile/_profileMenus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_control.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Settings(),
    );
  }
}

// 설정 페이지
class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(CupertinoIcons.chevron_left),
        toolbarHeight: 45,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildTitle(),
          SizedBox(height: 40),
          _buildSmallTitle(),
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
          SizedBox(height: 50),
          ProfileMenus(field: "로그아웃", value: ""),
        ],
      ),
      bottomNavigationBar: BottomControl(),
    );
  }
}

Widget _buildSmallTitle() {
  return Container(
    child: Text(
      "회원 정보 설정",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.black26,
      ),
    ),
  );
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
