import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileButton extends ConsumerWidget {
  ProfileButton({
    required this.model,
    required this.text,
  });

  final UserProfileModel model;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Photo photo = Photo(name: model.fileName, base64: model.prevImg);
          UserProfileUpdateDTO reqDTO = UserProfileUpdateDTO(
            myName: model.userProfile.myName,
            nickName: model.newNickName,
            mobile: model.newMobile,
            password: model.newPassword,
            photo: photo,
          );

          ref
              .read(userProfileProvider.notifier)
              .callUserProfileUpdate(model.userProfile.userId, reqDTO);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
