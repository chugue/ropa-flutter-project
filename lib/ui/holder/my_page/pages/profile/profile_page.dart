import 'package:final_project_team02/ui/components/positioned_button.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/text_form.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSetting extends ConsumerWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProfileModel? model = ref.watch(UserProfileProvider);
    print("ddddddddddddddddddddddddddddddddd");
    print(model);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
          color: Colors.blue,
        ),
      );
    } else {
      print("!!!!!!!${model.userProfile.email}");
      return Stack(
        children: [
          Scaffold(
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
                _buildTitle(), // 프로필 제목
                _buildPhoto(), // 사진, 바꾸기 칼럼
                SizedBox(height: 10),
                TextForm(text: model.userProfile.email), // 이메일
                SizedBox(height: 50), // 마진
                TextForm(
                  text: "이름",
                ), // 이름
                SizedBox(height: 50),
                TextForm(text: "닉네임"), // 닉네임
                SizedBox(height: 50),
                _buildMobileChange(), // 휴대폰 번호 변경
                SizedBox(height: 50),
                TextForm(text: "비밀번호 변경"),
                SizedBox(height: 10) // 비밀번호 변경
              ],
            ),
          ),
          PositionedButton(text: "변경하기"),
        ],
      );
    }
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
