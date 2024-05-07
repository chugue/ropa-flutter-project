import 'package:final_project_team02/data/domain_data/photo.dart';

class UserProfile {
  String status;
  int userId;
  String email;
  String myName;
  String nickName;
  String mobile;
  int password;
  Photo photoDTO;

  UserProfile.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        userId = json["userId"],
        email = json["email"],
        myName = json["myName"],
        nickName = json["nickName"],
        mobile = json["mobile"],
        password = json["password"],
        photoDTO = json["photoDTO"];
}
