class JoinReqDTO {
  final String nickName;
  final String password;
  final String email;

  JoinReqDTO({
    required this.nickName,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "nickName": this.nickName,
      "password": this.password,
      "email": this.email,
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

  const UserCreatorApplyReqDTO({
    required this.height,
    required this.weight,
    required this.instagram,
    required this.job,
  });

  Map<String, dynamic> toJson() {
    return {
      "height": this.height,
      "weight": this.weight,
      "instagram": this.instagram,
      "job": this.job,
    };
  }
}
