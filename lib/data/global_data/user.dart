class User {
  final int? id;
  final String nickName;
  final String username;
  final bool? blueChecked;
  final String? instagram;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.nickName,
    required this.username,
    required this.blueChecked,
    this.instagram,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      blueChecked: json["blueChecked"] ?? '',
      nickName: json["nickName"] ?? '',
      username: json["username"] ?? '',
      instagram: json["instagram"] ?? '',
      createdAt: json["createdAt"] ?? null,
    );
  }
}
