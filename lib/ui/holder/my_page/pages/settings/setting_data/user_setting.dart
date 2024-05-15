class UserSetting {
  int id;
  String email;
  String myName;
  String nickName;
  String mobile;

  UserSetting({
    required this.id,
    required this.email,
    required this.myName,
    required this.nickName,
    required this.mobile,
  });

  factory UserSetting.fromJson(Map<String, dynamic> json) {
    return UserSetting(
      id: json["id"],
      email: json["email"],
      myName: json["myName"],
      nickName: json["nickName"],
      mobile: json["mobile"],
    );
  }
}
