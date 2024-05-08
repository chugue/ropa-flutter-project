import 'package:final_project_team02/data/domain_data/photo.dart';

class UserProfile {
  int userId;
  String email;
  String myName;
  String nickName;
  String mobile;
  PhotoDTO photoDTO;

  UserProfile({
    required this.userId,
    required this.email,
    required this.myName,
    required this.nickName,
    required this.mobile,
    required this.photoDTO,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json["userId"],
      email: json["email"],
      myName: json["myName"],
      nickName: json["nickName"],
      mobile: json["mobile"],
      photoDTO: PhotoDTO.fromJson(json["photoDTO"]),
    );
  }
//
}
