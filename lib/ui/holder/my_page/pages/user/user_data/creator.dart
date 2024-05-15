class Creator {
  final int creatorId;
  final bool blueChecked;
  final String photoName;
  final String base64;
  final String nickName;
  final String height;
  final String weight;
  final String job;
  final String introMsg;

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
      creatorId: json["creatorId"],
      blueChecked: json["blueChecked"],
      photoName: json["photoName"],
      base64: json["base64"],
      nickName: json["nickName"],
      height: json["height"],
      weight: json["weight"],
      job: json["job"],
      introMsg: json["introMsg"],
    );
  }
}
