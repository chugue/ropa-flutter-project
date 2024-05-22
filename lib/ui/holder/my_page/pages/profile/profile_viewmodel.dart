import 'dart:convert';

import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/repositoreis/user_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_data/user_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class UserProfileModel {
  final UserProfile userProfile;

  final XFile? images;
  final String? prevImg;

  final String? fileName; // 파일이름
  final String? fileExtension; // 확장자

  final String? newNickName;
  final String? newMobile;
  final String? newPassword;

  UserProfileModel({
    required this.userProfile,
    this.images,
    this.prevImg,
    this.fileName,
    this.fileExtension,
    this.newNickName,
    this.newMobile,
    this.newPassword,
  });

  UserProfileModel copyWith({
    UserProfile? userProfile,
    XFile? images,
    String? prevImg,
    String? fileName,
    String? fileExtension,
    String? newNickName,
    String? newMobile,
    String? newPassword,
  }) {
    return UserProfileModel(
      userProfile: userProfile ?? this.userProfile,
      images: images ?? this.images,
      prevImg: prevImg ?? this.prevImg,
      fileName: fileName ?? this.fileName,
      fileExtension: fileExtension ?? this.fileExtension,
      newNickName: newNickName ?? this.newNickName,
      newMobile: newMobile ?? this.newMobile,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}

// 창고
class UserProfileViewModel extends StateNotifier<UserProfileModel?> {
  final ImagePicker picker = ImagePicker();
  final cacheManager = DefaultCacheManager();
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  UserProfileViewModel(
    super.state,
    this.ref,
  );

  Future<void> callUserProfileUpdate(
      int userId, UserProfileUpdateDTO repDTO) async {
    ResponseDTO responseDTO =
        await UserRepo().callUserProfileUpdate(userId, repDTO);
    if (responseDTO.success) {
      state = state!.copyWith(userProfile: responseDTO.response);
    }
  }

  void updateValue(String fieldName, String value) {
    if (state != null) {
      UserProfileModel updateProfile = state!.copyWith();
      if (fieldName == "닉네임") {
        updateProfile = state!.copyWith(newNickName: value);
      } else if (fieldName == "휴대폰 번호") {
        updateProfile = state!.copyWith(newMobile: value);
      } else if (fieldName == "비밀번호") {
        updateProfile = state!.copyWith(newPassword: value);
      }
      state = updateProfile;
    }
  }

  Future<String> convertToBase64(XFile image) async {
    Uint8List imageBytes = await image.readAsBytes();
    return compute(base64Encode, imageBytes);
  }

  Future<void> pickAndAddImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String base64String = await convertToBase64(image);

      // 파일 경로에서 파일 이름과 확장자 추출
      String fileName = path.basename(image.path);
      String fileExtension = path.extension(image.path);

      await cacheManager.putFile(
        image.path,
        await image.readAsBytes(),
        fileExtension: fileExtension,
      );

      state = state!.copyWith(
        images: image,
        prevImg: base64String,
        fileName: fileName,
        fileExtension: fileExtension,
      );
    }
  }

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepo().callUserProfile();

    print(responseDTO.response);

    if (responseDTO.success) {
      state = responseDTO.response;
      print(state);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("프로필 정보 보기 실패 : ${responseDTO.errorMessage}"),
        ),
      );
    }
  }
}

// 창고 관리자

final userProfileProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileModel?>(
  (ref) {
    return UserProfileViewModel(null, ref)..notifyInit(); /* 초기 상태 null */
  },
);
