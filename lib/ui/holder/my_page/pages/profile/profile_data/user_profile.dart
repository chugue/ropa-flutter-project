import 'package:final_project_team02/ui/holder/my_page/pages/user/user_data/photo.dart';

class UserProfile {
  final int userId;
  final String email;
  final String myName;
  final String nickName;
  final String mobile;
  final PhotoDTO photoDTO;

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
      photoDTO:
          PhotoDTO.fromJson(json["photoDTO"]) /* ✅list는 DTO.fromJson()으로 */,
    );
  }

  UserProfile copyWith({
    int? userId,
    String? email,
    String? myName,
    String? nickName,
    String? mobile,
    PhotoDTO? photoDTO,
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      myName: myName ?? this.myName,
      nickName: nickName ?? this.nickName,
      mobile: mobile ?? this.mobile,
      photoDTO: photoDTO ?? this.photoDTO,
    );
  }
//
}
