class User {
  final int id;
  final String nickName;
  final String username;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.nickName,
    required this.username,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      nickName: json["nickName"] ?? "",
      username: json["username"] ?? "",
      createdAt: json["createdAt"] ?? null,
    );
  }
//
}
