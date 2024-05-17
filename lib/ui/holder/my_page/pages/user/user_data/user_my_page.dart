class UserMyPage {
  final int? userId;
  final String photoName;
  final String base64;
  final String nickName;
  final int orderCount;

  UserMyPage({
    required this.userId,
    required this.photoName,
    required this.base64,
    required this.nickName,
    required this.orderCount,
  });

  factory UserMyPage.fromJson(Map<String, dynamic> json) {
    return UserMyPage(
      userId: json["userId"] ?? null,
      photoName: json["photoName"] ?? '',
      base64: json["base64"] ?? '',
      nickName: json["nickName"] ?? '',
      orderCount: json["orderCount"] ?? null,
    );
  }
}
