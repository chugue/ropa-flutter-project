class Creator {
  int? creatorId;
  bool? blueChecked;
  String? photoName;
  String? base64;
  String nickName;
  String? height;
  String? weight;
  String? job;
  String? introMsg;

  Creator({
    required this.creatorId,
    required this.blueChecked,
    required this.photoName,
    required this.base64,
    required this.nickName,
    required this.height,
    required this.weight,
    required this.job,
    required this.introMsg,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      creatorId: json["creatorId"] ?? null,
      blueChecked: json["blueChecked"],
      photoName: json["photoName"] ?? '',
      base64: json["base64"] ?? '',
      nickName: json["nickName"] ?? '',
      height: json["height"] ?? '',
      weight: json["weight"] ?? '',
      job: json["job"] ?? '',
      introMsg: json["introMsg"] ?? '',
    );
  }
}
