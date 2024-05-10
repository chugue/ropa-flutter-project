class UserSetting {
  int id;
  String email;
  String myName;
  String nickName;
  String moile;

  UserSetting({
    required this.id,
    required this.email,
    required this.myName,
    required this.nickName,
    required this.moile,
  });

  factory UserSetting.fromJson(Map<String, dynamic> json) {
    return UserSetting(
      id: json["id"],
      email: json["email"],
      myName: json["myName"],
      nickName: json["nickName"],
      moile: json["moile"],
    );
  }
}
