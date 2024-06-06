class JoinReqDTO {
  final String nickName;
  final String password;
  final String email;
  final String myName;

  JoinReqDTO({
    required this.nickName,
    required this.password,
    required this.email,
    required this.myName,
  });

  Map<String, dynamic> toJson() {
    return {
      "nickName": this.nickName,
      "password": this.password,
      "email": this.email,
      "myName": this.myName,
    };
  }
}

class LoginReqDTO {
  final String email;
  final String password;

  const LoginReqDTO({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "password": this.password,
    };
  }
}

class UserCreatorApplyReqDTO {
  final String height;
  final String weight;
  final String instagram;
  final String job;
  final String comment;

  const UserCreatorApplyReqDTO({
    required this.height,
    required this.weight,
    required this.instagram,
    required this.job,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      "height": this.height,
      "weight": this.weight,
      "instagram": this.instagram,
      "job": this.job,
      "comment": this.comment,
    };
  }
}

class UserProfileUpdateDTO {
  final String? myName;
  final String? nickName;
  final String? mobile;
  final String? password;
  final Photo photo;

  UserProfileUpdateDTO({
    required this.myName,
    required this.nickName,
    required this.mobile,
    required this.password,
    required this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      "myName": this.myName,
      "nickName": this.nickName,
      "mobile": this.mobile,
      "password": this.password,
      "photo": this.photo.toJson(),
    };
  }
}

class Photo {
  final String? name;
  final String? base64;

  Photo({
    required this.name,
    required this.base64,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "base64": this.base64,
    };
  }
}
