class UserMyPage {
  int userId;
  String photoName;
  String base64;
  String nickName;
  int orderCount;

  UserMyPage({
    required this.userId,
    required this.photoName,
    required this.base64,
    required this.nickName,
    required this.orderCount,
  });

  factory UserMyPage.fromJson(Map<String, dynamic> json) {
    return UserMyPage(
      userId: json["userId"],
      photoName: json["photoName"],
      base64: json["base64"],
      nickName: json["nickName"],
      orderCount: json["orderCount"],
      // userId: json["userId"] ?? null,
      // photoName: json["photoName"] ?? '',
      // base64: json["base64"] ?? '',
      // nickName: json["nickName"] ?? '',
      // orderCount: json["orderCount"] ?? null,
    );
  }
}
