class User {
  final int id;
  final String nickName;
  final String username;
  final bool blueChecked;
  final String? instagram;
  final DateTime? createdAt;

  // 😎Creator User
  final int? creatorId;
  final String? photoName;
  final String? base64;
  final String? height;
  final String? weight;
  final String? job;
  final String? introMsg;

  const User({
    required this.id,
    required this.nickName,
    required this.username,
    required this.blueChecked,
    this.instagram,
    this.createdAt,
    // 😎Creator User
    this.creatorId,
    this.photoName,
    this.base64,
    this.height,
    this.weight,
    this.job,
    this.introMsg,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      blueChecked: json["blueChecked"],
      nickName: json["nickName"] ?? '',
      username: json["username"] ?? '',
      instagram: json["instagram"] ?? '',
      createdAt: json["createdAt"] ?? null,
      // 😎Creator User
      creatorId: json["creatorId"] ?? null,
      photoName: json["photoName"] ?? '',
      base64: json["base64"] ?? '',
      height: json["height"] ?? '',
      weight: json["weight"] ?? '',
      job: json["job"] ?? '',
      introMsg: json["introMsg"] ?? '',
    );
  }
}
