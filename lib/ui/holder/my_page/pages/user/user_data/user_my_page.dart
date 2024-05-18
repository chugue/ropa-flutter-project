class UserMyPage {
  final int? userId;
  final String photoName;
  final String photoPath;
  final String nickName;
  final int orderCount;

  UserMyPage({
    required this.userId,
    required this.photoName,
    required this.photoPath,
    required this.nickName,
    required this.orderCount,
  });

  factory UserMyPage.fromJson(Map<String, dynamic> json) {
    return UserMyPage(
      userId: json["userId"] ?? null,
      photoName: json["photoName"] ?? '',
      photoPath: json["photoPath"] ?? '',
      nickName: json["nickName"] ?? '',
      orderCount: json["orderCount"] ?? null,
    );
  }
}
