import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/bottom_button.dart';
import '../../components/bottom_control.dart';
import '_text_form.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 45,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 10),
          _buildTitle(), // 프로필 설정
          _buildPhoto(), // 사진, 바꾸기 칼럼
          SizedBox(height: 10),
          TextForm("이메일"), // 이메일
          SizedBox(height: 50), // 마진
          TextForm("이름"), // 이름
          SizedBox(height: 50),
          TextForm("닉네임"), // 닉네임
          SizedBox(height: 50),
          _buildMobileChange(), // 휴대폰 번호 변경
          SizedBox(height: 50),
          TextForm("비밀번호 변경"),
          SizedBox(height: 10) // 비밀번호 변경
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter, // 스택 내에서 위젯들을 위쪽 중앙에 정렬
        children: [
          BottomControl(),
          Positioned(
            child: BottomButton(),
          ),
        ],
      ),
    );
  }

  // 비밀번호 변경하기 옆에 버튼을 만들어야 될지 고민 //TODO
  Widget _buildMobileChange() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "휴대폰 번호 변경",
              style: TextStyle(color: Colors.black87, fontSize: 13),
            ),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  )),
            ),
          ],
        ),
      );

  // 프로필 사진
  Widget _buildPhoto() => Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "프로필 사진 바꾸기",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );

  // 페이지 이름
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
