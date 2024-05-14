class User {
  final int? id;
  final String nickName;
  final String username;
  final bool? blueChecked;
  final String? instagram;
  final DateTime? createdAt;

  // 😎Creator User
  int? creatorId;
  String? photoName;
  String? base64;
  String? height;
  String? weight;
  String? job;
  String? introMsg;

  User({
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
      id: json["id"] ?? null,
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
