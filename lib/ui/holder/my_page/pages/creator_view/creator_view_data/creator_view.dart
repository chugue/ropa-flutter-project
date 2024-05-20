// "/app/creator-view/1" 의 userDTO를 담음
class CreatorView {
  final int? creatorId;
  final bool blueChecked;
  final String photoName;
  final String photoPath;
  final String nickName;
  final String height;
  final String weight;
  final String job;
  final String introMsg;

  CreatorView({
    required this.creatorId,
    required this.blueChecked,
    required this.photoName,
    required this.photoPath,
    required this.nickName,
    required this.height,
    required this.weight,
    required this.job,
    required this.introMsg,
  });

  factory CreatorView.fromJson(Map<String, dynamic> json) {
    return CreatorView(
      creatorId: json["creatorId"] ?? null,
      blueChecked: json["blueChecked"],
      photoName: json["photoName"] ?? '',
      photoPath: json["photoPath"] ?? '',
      nickName: json["nickName"] ?? '',
      height: json["height"] ?? '',
      weight: json["weight"] ?? '',
      job: json["job"] ?? '',
      introMsg: json["introMsg"] ?? '',
    );
  }
}
