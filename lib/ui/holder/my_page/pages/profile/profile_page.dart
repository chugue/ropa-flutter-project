import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/ui/holder/home/components/home_app_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_button.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_edit_info.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/components/profile_fixed_info.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../_core/constants/http.dart';

class ProfileSetting extends ConsumerWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProfileModel? model = ref.watch(userProfileProvider);
    print(model);
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.blue,
        ),
      );
    } else {
      return Stack(
        children: [
          Scaffold(
            appBar: HomeAppbar(),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 10),
                _buildTitle(),
                // 프로필 제목
                model.images == null
                    ? _buildPhoto(model.userProfile.photoDTO.photoPath, ref)
                    : // 사진, 바꾸기 칼럼
                    _buildUpdatePhoto(model, ref),
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
                  fieldValue: '',
                  controller: TextEditingController(
                    text: ref.watch(
                      userProfileProvider
                          .select((model) => model?.userProfile.nickName),
                    ),
                  ),
                  fieldName: "닉네임",
                  onChanged: (fieldName, value) => ref
                      .read(userProfileProvider.notifier)
                      .updateValue(fieldName, value),
                ),
                SizedBox(height: 50),
                EditInfo(
                  controller: TextEditingController(
                    text: ref.watch(
                      userProfileProvider
                          .select((model) => model?.userProfile.mobile),
                    ),
                  ),
                  fieldName: "핸드폰 번호",
                  fieldValue: '',
                  onChanged: (fieldName, value) => ref
                      .read(userProfileProvider.notifier)
                      .updateValue(fieldName, value),
                ),
                // _buildMobileChange(),
                SizedBox(height: 50),
                EditInfo(
                  controller: null,
                  fieldName: "비밀번호",
                  fieldValue: "",
                  onChanged: (fieldName, value) => ref
                      .read(userProfileProvider.notifier)
                      .updateValue(fieldName, value),
                ),
                SizedBox(height: 10),
                SizedBox(height: 50),
                ProfileButton(model: model, text: "변경하기"),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildUpdatePhoto(UserProfileModel model, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: FileImage(File(model.images!.path)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () async {
                await ref.read(userProfileProvider.notifier).pickAndAddImage();
              },
              child: Text(
                "프로필 사진 바꾸기",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 프로필 사진
  Widget _buildPhoto(String? photoPath, WidgetRef ref) => Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: photoPath != null
                  ? CachedNetworkImageProvider(
                      '$baseURL${photoPath}',
                    )
                  : AssetImage("assets/images/avatar.jpg") as ImageProvider,
              child: photoPath == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () async {
                  await ref
                      .read(userProfileProvider.notifier)
                      .pickAndAddImage();
                },
                child: Text(
                  "프로필 사진 바꾸기",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

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
