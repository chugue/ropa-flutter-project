import 'package:final_project_team02/ui/components/bottom_button.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_edit_info.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_fixed_info.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSetting extends ConsumerWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProfileModel? model = ref.watch(UserProfileProvider);
    print(model);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
          color: Colors.blue,
        ),
      );
    } else {
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
              actions: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "변경하기(수정 후)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 10),
                _buildTitle(),
                // 프로필 제목
                _buildPhoto(),
                // 사진, 바꾸기 칼럼
                SizedBox(height: 10),
                FixedInfo(
                  fieldName: "이메일",
                  fieldValue: model.userProfile.email,
                ),
                // 이메일
                SizedBox(height: 50),
                // 마진
                FixedInfo(
                  fieldName: "이름",
                  fieldValue: model.userProfile.myName,
                ),
                // 이름
                SizedBox(height: 50),
                EditInfo(
                  fieldName: "닉네임",
                  fieldValue: model.userProfile.nickName,
                ),
                // 닉네임
                SizedBox(height: 50),
                _buildMobileChange(model.userProfile.mobile),
                // 휴대폰 번호 변경
                SizedBox(height: 50),
                EditInfo(
                  fieldName: "비밀번호 변경",
                  fieldValue: "****",
                ),
                SizedBox(height: 10),
                // 비밀번호 변경
                SizedBox(height: 50),
                BottomButton(text: "변경하기"),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      );
    }
  }

// 비밀번호 변경하기 옆에 버튼을 만들어야 될지 고민 //TODO
  Widget _buildMobileChange(userMobile) {
    TextEditingController controller = TextEditingController(text: userMobile);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "휴대폰 번호 변경",
            style: TextStyle(color: Colors.black87, fontSize: 13),
          ),
          TextField(
            controller: controller,
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
  }

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
